package Controller;

import Model.Blog;
import Model.BlogDAO;
import Model.Club;
import Model.ClubDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Duong
 */
@WebServlet(name = "blog", urlPatterns = {"/blog"})
public class blog extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet blog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet blog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String searchName = request.getParameter("searchName");
        String clubIdStr = request.getParameter("clubId");
        int clubId = (clubIdStr != null && !clubIdStr.isEmpty()) ? Integer.parseInt(clubIdStr) : -1;

        BlogDAO blogDAO = new BlogDAO();
        ClubDAO clubDAO = new ClubDAO();
        List<Blog> allBlogs;
        if (searchName != null && !searchName.isEmpty()) {
            allBlogs = blogDAO.searchBlogsByName(searchName);
        } else if (clubId != -1) {
            allBlogs = blogDAO.getBlogsByClub(clubId);
        } else {
            allBlogs = blogDAO.getAllBlogs();
        }

        int totalBlogs = allBlogs.size();
        int totalPages = (int) Math.ceil((double) totalBlogs / 6);

        int start = (page - 1) * 6;
        int end = Math.min(start + 6, totalBlogs);

        List<Blog> blogs = allBlogs.subList(start, end);
        blogDAO.addClubNameToBlogs(blogs);
        List<Club> clubs = clubDAO.getAllClub();
        request.setAttribute("blogs", blogs);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("clubs", clubs);
        request.setAttribute("allBlogs", allBlogs);

        request.getRequestDispatcher("blog.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> blogs = blogDAO.getAllBlogs();
        request.setAttribute("blogs", blogs);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
