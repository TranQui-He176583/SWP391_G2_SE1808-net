package Controller;

import Model.Blog;
import Model.BlogDAO;
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
        BlogDAO blogDAO = new BlogDAO();
        List<Blog> blogs = blogDAO.getAllBlogs();
        request.setAttribute("blogs", blogs);
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
