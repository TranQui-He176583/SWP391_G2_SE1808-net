/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

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
@WebServlet(name="editBlogdb", urlPatterns={"/editBlogdb"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class editBlogdb extends HttpServlet {
   
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
            out.println("<title>Servlet editBlogdb</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editBlogdb at " + request.getContextPath () + "</h1>");
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
    private static final String UPLOAD_DIR = "assets/img/blog";
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String xid = request.getParameter("id");
   
    String xName = request.getParameter("name");
    String xDetails = request.getParameter("details");
    LocalDateTime xTime =  LocalDateTime.now();
    Part xImage = request.getPart("image");
    
    String xStatus = request.getParameter("status");
    int status = Integer.parseInt(xStatus);
    boolean checkValid =true;
    BlogDAO bdao = new BlogDAO();
    
    Blog b= bdao.getBlog(xid);
    if (xName.equals("")) {
      request.setAttribute("invalidName", "Blog title cannot empty.");
      checkValid= false;
    }else if (xName.matches(".*<.*>.*")) {
        request.setAttribute("invalidName", "Blog title cannot contain HTML tags!");
        checkValid= false;
    }else if (xName.length() < 2 || xName.length() > 100) {
      request.setAttribute("invalidName", "Blog title must be between 2 and 100 characters.");
      checkValid= false;
    }
   if (xDetails.equals("")) {
      request.setAttribute("invalidDetails", "Description cannot empty.");
      checkValid= false;
   }
    String imageURL="";
     if (checkValid== false) {
        request.getRequestDispatcher("blogdetaildb?bid="+xid).forward(request, response);
    }else{
   
    if (b != null) {
        if (xImage != null && xImage.getSize() > 0) { // Check if an image was uploaded
            imageURL = saveUploadedFile(request);
            if (b.getImage() != null) {
                File file = new File("C:\\Users\\pc\\Swp291\\build\\web\\" + b.getImage());
                file.delete();
            }
        } else {
            imageURL = b.getImage(); // Use the existing image URL
        }
        b.setName(xName);
        b.setDetails(xDetails);
        b.setImage(imageURL);
        b.setStatus(status);
        b.setTime(xTime);
        bdao.EditBlog(b);
   
        request.setAttribute("completeChange", "Change Information Susscess!");
        request.getRequestDispatcher("blogdetaildb?bid="+xid).forward(request, response);
    } else {
        out.println("<html><body><h1>Error: 'blog' attribute is null</h1></body></html>");
    }
     }
}

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
   
    
   String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
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
}
