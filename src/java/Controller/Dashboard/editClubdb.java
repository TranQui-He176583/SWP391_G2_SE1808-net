/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Club;
import Model.ClubDAO;
import Model.UserDAO;
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

/**
 *
 * @author pc
 */
@WebServlet(name="editClubdb", urlPatterns={"/editClubdb"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class editClubdb extends HttpServlet {
   
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
            out.println("<title>Servlet editClubdb</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editClubdb at " + request.getContextPath () + "</h1>");
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
    private static final String UPLOAD_DIR = "assets/img/avatar";
    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String xid = request.getParameter("id");
    int id = Integer.parseInt(xid);
    String xName = request.getParameter("name");
    String xStatus = request.getParameter("status");
    int status = Integer.parseInt(xStatus);
    Part xAvatar = request.getPart("avatar");
    String xDetail = request.getParameter("detail");

    ClubDAO cdao = new ClubDAO();
    UserDAO udao = new UserDAO();
    Club c= cdao.getClub(xid);
    String imageURL="";
    if (c != null) {
        if (xAvatar != null && xAvatar.getSize() > 0) {
            imageURL = saveUploadedFile(request);
            if (c.getAvatar()!= null) {
                File file = new File("C:\\Users\\pc\\SWP391_G2_SE1808-net\\build\\web\\" + c.getAvatar());
                file.delete();
            }
        } else {
            imageURL = c.getAvatar(); // Use the existing image URL
        }
        c.setName(xName);
        c.setStatus(status);
        c.setAvatar(imageURL);
        c.setDetail(xDetail);
//        out.print(c.getId());
        out.print(cdao.EditClub(c));
        request.setAttribute("completeChange", "Change Information Susscess!");
        response.sendRedirect("clubdb");
    } else {
        out.println("<html><body><h1>Error: 'club' attribute is null</h1></body></html>");
    }
}   

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
   String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
    String uploadPath = "assets/img/anhclb/";

    Part part = request.getPart("avatar");
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
