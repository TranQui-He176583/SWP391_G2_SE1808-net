package Controller;

import Model.Blog;
import Model.BlogDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

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
                
                String clubName = blogDAO.getClubNameByClubID(blog.getClubID());
//                blog.setNameclub(clubName); 

                request.setAttribute("blog", blog);
                request.getRequestDispatcher("blog_details.jsp").forward(request, response);
            } else {
                response.getWriter().println("Blog not found");
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid blog ID");
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
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
