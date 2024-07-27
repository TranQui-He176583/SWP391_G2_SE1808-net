package Controller;

import Model.Blog;
import Model.BlogDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "BlogDetail", urlPatterns = {"/BlogDetail"})
public class BlogDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int blogId = Integer.parseInt(request.getParameter("id"));

            BlogDAO blogDAO = new BlogDAO();
            Blog blog = blogDAO.getBlogByID(blogId);

            if (blog != null) {
                List<Blog> allBlogs = blogDAO.getAllBlogs();
                allBlogs = allBlogs.stream()
                                   .filter(b -> b.getId() != blogId)
                                   .collect(Collectors.toList());
                Collections.shuffle(allBlogs);
                List<Blog> recentBlogs = allBlogs.size() > 3 ? allBlogs.subList(0, 3) : allBlogs;
                String clubName = blogDAO.getClubNameByClubID(blog.getClubID());
                blog.setNameclub(clubName);
                request.setAttribute("blog", blog);
                request.setAttribute("recentBlogs", recentBlogs);
                request.getRequestDispatcher("blog_details.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Blog not found");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid blog ID");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for fetching blog details";
    }
}
