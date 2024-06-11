/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Blog;
import Model.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDateTime;

/**
 *
 * @author pc
 */
@WebServlet(name="addBlogdboard", urlPatterns={"/addBlogdboard"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class addBlogdboard extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet addBlogdboard</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addBlogdboard at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
      PrintWriter out = response.getWriter();

    String name = request.getParameter("name");
    String details = request.getParameter("details");
    String xclubID  = request.getParameter("clubID");
    int clubID =Integer.parseInt(xclubID);
    String xtime = request.getParameter("time");
    LocalDateTime time = LocalDateTime.parse(xtime);
    String image= request.getParameter("image");
    String xstatus = request.getParameter("status");
    int status = Integer.parseInt(xstatus);

    Part imagePart = request.getPart("image");
    String imageName = getUniqueFileName(imagePart);
    String imagePath = saveUploadedFile(request, imageName);

    BlogDAO user = new BlogDAO();
    
    int numberUser = user.getNumberBlog()+ 1;
    Blog b = new Blog(numberUser, name, details, clubID, time, image, status);
    out.print(user.add(b));
    response.sendRedirect("blogdb");
   
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
   String saveUploadedFile(HttpServletRequest request, String fileName) throws IOException, ServletException {
    String uploadPath = "assets/img/avatar/";
    String applicationPath = request.getServletContext().getRealPath("");
    String absoluteFilePath = applicationPath + File.separator + uploadPath + fileName;

    Part part = request.getPart("image");
    part.write(absoluteFilePath);

    File uploadedFile = new File(absoluteFilePath);
    if (uploadedFile.exists()) {
        return uploadPath + fileName;
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

}
