/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Event;

import Model.*;
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
 * @author quyka
 */
@WebServlet(name="edit_Event", urlPatterns={"/edit_Event"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class edit_Event extends HttpServlet {
   
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
            out.println("<title>Servlet edit_Event</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet edit_Event at " + request.getContextPath () + "</h1>");
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
        String xid = request.getParameter("id");
        int id = Integer.parseInt(xid);
        EventDAO eDAO = new EventDAO();
        Event e = eDAO.getEvent(id);
        request.setAttribute("Event", e);
        request.getRequestDispatcher("updateEvent.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String UPLOAD_DIR = "assets/img/eventlogo";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
         EventDAO eDAO = new EventDAO();
         
        PrintWriter pr  = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String Stime = request.getParameter("time");
        Part xImage = request.getPart("image");
        String imageURL="";
        String xLocation = request.getParameter("location");
        String xDetail = request.getParameter("details");
        String xClubId = request.getParameter("clubid");
//      HttpSession session = request.getSession();
//       Account a = new Account();
//       a = (Account) session.getAttribute("account");
//      if (a!=null) {
//          if (eDAO.checkManager(a.getId(), xClubId)) {
//           request.setAttribute("complete", "You don't have role to update this event!");
//       }  
        Event getE = eDAO.getEvent(id);
        boolean checkValid =true;
       if (name.equals("")) {
           request.setAttribute("invalidName", "Event name cannot be empty!");
           checkValid= false;
       } 
       if (Stime.equals("")) {
           request.setAttribute("invalidTime", "Event time cannot be empty!");
           checkValid= false;
       }
       if (xLocation.equals("")) {
           request.setAttribute("invalidLocation", "Event location cannot be empty!");
           checkValid= false;
       }
       if (xDetail.equals("")) {
           request.setAttribute("invalidDetail", "Event Detail cannot be empty!");
           checkValid= false;
       }
       if (xImage.getSize()==0) {
           
           imageURL = getE.getAvatar();
       } else {
                File file = new File("D:\\SWP\\Project\\SWP391_G2_SE1808-net\\Swp\\build\\web\\"+getE.getAvatar());
              file.delete();
             imageURL = saveUploadedFile(request);
       }
  if (checkValid== false) {
      request.setAttribute("name", name);
      request.setAttribute("time", Stime);
      request.setAttribute("location", xLocation);
      request.setAttribute("detail", xDetail);
      request.getRequestDispatcher("add_Event.jsp").forward(request, response);
  }   else {  
        LocalDateTime time = LocalDateTime.parse(Stime);        
        int club_Id = Integer.parseInt(xClubId);        
        Event e = new Event(id, name, club_Id, time, xLocation, xDetail,imageURL,true);       
        pr.print(eDAO.updateEvent(e));
        pr.print(e.getName());
      response.sendRedirect("event_Details?id="+id);
  }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
       String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
    String uploadPath = "assets/img/eventlogo/";

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
