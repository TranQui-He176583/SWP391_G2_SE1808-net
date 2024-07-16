/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Event;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import Model.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.time.LocalDate;
import java.util.*;
/**
 *
 * @author quyka
 */
@WebServlet(name="add_Event", urlPatterns={"/add_Event"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class add_Event extends HttpServlet {
   
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
            out.println("<title>Servlet add_Event</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add_Event at " + request.getContextPath () + "</h1>");
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
      
         String cid = request.getParameter("cid");
          EventDAO eDAO = new EventDAO();
       Account a = new Account();
        HttpSession session = request.getSession();
       a = (Account) session.getAttribute("account");
      if (a!=null) {
          if (eDAO.checkManager(a.getId(), Integer.parseInt(cid))==false) {
           request.setAttribute("complete", "You don't have role to add event!");
           
           request.getRequestDispatcher("Home").forward(request, response);
       } else {
              request.setAttribute("cid", cid);
              PrintWriter pr  = response.getWriter();
              pr.print(cid);
       request.getRequestDispatcher("add_Event.jsp").forward(request, response);
          }} else {
      request.setAttribute("complete", "Please Login");
           request.getRequestDispatcher("Home").forward(request, response);
      }
       
       
      
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
        PrintWriter pr  = response.getWriter();
        String name = request.getParameter("name");
        String Stime = request.getParameter("time");
        Part xImage = request.getPart("image");
        String xLocation = request.getParameter("location");
        String xDetail = request.getParameter("details");
        String xClubId = request.getParameter("clubid");
        boolean checkValid =true;
      
       if (name.length()<10) {
            request.setAttribute("invalidlName", "Event Name length <10 chars");
            checkValid= false;
       }
       if (validateChar(name)==false) {
           request.setAttribute("invalidName", "Task name can't contain special characters!");
           checkValid= false;
       }
       
       if (name.length()>150) {
            request.setAttribute("invalidlName", "Event name has a maximum length of 150 characters");
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
       if (xLocation.length()>100) {
            request.setAttribute("invalidlLocation", "Event location has a maximum length of 100 characters");
            checkValid= false;
       }
       if (xLocation.length()<5) {
            request.setAttribute("invalidlLocation", "Event location length <5 chars");
            checkValid= false;
       }
       if (xDetail.equals("")) {
           request.setAttribute("invalidDetail", "Event Detail cannot be empty!");
           checkValid= false;
       }
       if (xImage.getSize()==0) {
           request.setAttribute("invalidImage", "Event Avatar cannot be empty!");
           checkValid= false;
       } else {
            String fileName = xImage.getSubmittedFileName();
             request.setAttribute("image", fileName);
       }
  if (checkValid== false) {
      request.setAttribute("name", name);
      request.setAttribute("time", Stime);
      request.setAttribute("location", xLocation);
      request.setAttribute("detail", xDetail);
      request.setAttribute("cid", xClubId);
      request.getRequestDispatcher("add_Event.jsp").forward(request, response);
  }   else {  
        LocalDateTime time = LocalDateTime.parse(Stime);
        
        int club_Id = Integer.parseInt(xClubId);
        String imageURL = saveUploadedFile(request);
        Event e = new Event(0, name, club_Id, time, xLocation, xDetail,imageURL,true);
        EventDAO eDAO = new EventDAO();      
        pr.print(eDAO.insert(e));
        ClubDAO cDAO = new ClubDAO();
        List<Integer> iList = cDAO.getaList(club_Id);
        int id =eDAO.getNumberEvent();  
        pr.print(iList.size()); 
       for (int i=0;i<iList.size();i++) {
           pr.println(iList.get(i));
          pr.print( eDAO.insertMember_Event(iList.get(i),String.valueOf(id)) );
       } 
      response.sendRedirect("event_Details?id="+id+"&k=0&c=0");

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
      public boolean validateChar(String taskName) {
          taskName = taskName.trim();
          int openingParenthesisCount = 0;
        int closingParenthesisCount = 0;
           for (int i = 0; i < taskName.length(); i++) {
            char c = taskName.charAt(i);
            if (!Character.isLetterOrDigit(c) && c != ' ' && c != '(' && c != ')') {
                return false;
            }
           else if (c == '(') {
                openingParenthesisCount++;
            }
            else if (c == ')') {
                closingParenthesisCount++;
            }
            
        }
            return openingParenthesisCount == closingParenthesisCount;
    }

}