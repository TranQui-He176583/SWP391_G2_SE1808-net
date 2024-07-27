/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Blog;
import Model.BlogDAO;
import Model.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDateTime;

/**
 *
 * @author Duong
 */
@WebServlet(name = "add_blog", urlPatterns = {"/add_blog"})

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class add_blog extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet add_blog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add_blog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String cid = request.getParameter("cid");
        Account a = new Account();
        EventDAO eDAO = new EventDAO();
        a = (Account) session.getAttribute("account");
        if (a != null) {
            if (eDAO.checkManager(a.getId(), Integer.parseInt(cid)) == false) {
                request.setAttribute("complete", "You don't have role to add event!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("cid", cid);
                request.getRequestDispatcher("add_blog.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("complete", "Please Login");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String name = request.getParameter("name");
        String details = request.getParameter("details");
        Part imagePart = request.getPart("image");
        int cid = Integer.parseInt(request.getParameter("clubid"));

        boolean isValid = true;

        if (name == null || name.isEmpty()) {
            request.setAttribute("invalidName", "Blog name cannot be empty!");
            isValid = false;
        } else if (name.length() > 60) {
            request.setAttribute("invalidName", "Blog name cannot exceed 60 characters!");
            isValid = false;
        }

        if (details == null || details.isEmpty()) {
            request.setAttribute("invalidDetail", "Blog Detail cannot be empty!");
            isValid = false;
        }

        if (imagePart == null || imagePart.getSize() == 0) {
            request.setAttribute("invalidImage", "Blog Avatar cannot be empty!");
            isValid = false;
        }

        if (!isValid) {
            request.setAttribute("name", name);
            request.setAttribute("details", details);
            request.getRequestDispatcher("add_blog.jsp").forward(request, response);
        } else {
            String imageURL = saveBlogImage(request);
            LocalDateTime time = LocalDateTime.now();
            Blog blog = new Blog(0, name, details, cid, imageURL, time, 0);

            BlogDAO blogDAO = new BlogDAO();
            blogDAO.addBlog(blog);
            response.sendRedirect("index.jsp");
        }
    }

    String saveBlogImage(HttpServletRequest request) throws IOException, ServletException {
        String uploadPath = "assets/img/blog/";

        Part part = request.getPart("image");
        String fileName = getUniqueFileName(part);
        String filePath = uploadPath + fileName;

        String applicationPath = request.getServletContext().getRealPath("");
        String absoluteFilePath = applicationPath + File.separator + filePath;

        part.write(absoluteFilePath);

        File uploadedFile = new File(absoluteFilePath);
        if (uploadedFile.exists()) {
            return filePath;
        } else {
            return "";
        }
    }

    String getUniqueFileName(Part part) {
        String submittedFileName = part.getSubmittedFileName();
        String fileExtension = submittedFileName.substring(submittedFileName.lastIndexOf('.'));
        String newFileName = System.currentTimeMillis() + fileExtension;
        return newFileName;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
