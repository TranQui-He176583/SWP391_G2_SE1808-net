package Controller;

import Model.Blog;
import Model.BlogDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BlogDetail", urlPatterns = {"/blogdetail"})
public class BlogDetail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String blogId = request.getParameter("id");
        BlogDAO blogDAO = new BlogDAO();
        Blog blog = blogDAO.getBlog(blogId);
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("blogDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
