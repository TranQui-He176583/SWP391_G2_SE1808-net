package Controller;

import Model.Blog;
import Model.BlogDAO;
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

        BlogDAO blogDAO = new BlogDAO();
        List<Blog> allBlogs = blogDAO.getAllBlogs();
        int totalBlogs = allBlogs.size();
        int totalPages = (int) Math.ceil((double) totalBlogs / 3);

        int start = (page - 1) * 3;
        int end = Math.min(start + 3, totalBlogs);

        // Làm gì đó với clubName, ví dụ: đưa vào thuộc tính của blog
        List<Blog> blogs = allBlogs.subList(start, end);
        blogDAO.addClubNameToBlogs(blogs);
        request.setAttribute("blogs", blogs);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);

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
