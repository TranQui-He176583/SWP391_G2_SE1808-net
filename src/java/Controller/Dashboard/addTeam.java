/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Account;
import Model.Club;
import Model.ClubDAO;

import Model.StudentTeamDAO;
import Model.Student_team;
import Model.Team;
import Model.TeamDAO;
import Model.UserDAO;

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

/**
 *
 * @author pc
 */
@WebServlet(name="addTeam", urlPatterns={"/addTeam"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class addTeam extends HttpServlet {
   
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
            out.println("<title>Servlet addTeam</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addTeam at " + request.getContextPath () + "</h1>");
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
    private static final String UPLOAD_DIR = "assets/img/team";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       PrintWriter pr  = response.getWriter();
        String name = request.getParameter("name");
        String leader = request.getParameter("leader");
        
        Part xImage = request.getPart("image");
        String xDetail = request.getParameter("details");
        String xStatus = request.getParameter("status");
        int status = Integer.parseInt(xStatus);
        String xClubID = request.getParameter("clubID");
        String xRoleID = request.getParameter("roleID");
        ClubDAO cdao = new ClubDAO();
        UserDAO udao = new UserDAO();
        TeamDAO tdao = new TeamDAO();
        StudentTeamDAO stdao= new StudentTeamDAO();
        Club c = cdao.getClub(xClubID);
        String regex = "^[a-zA-Z\\p{L}\\s]+$";
        int leaderID = udao.getIdByName(leader); 
        
        boolean checkValid =true;
        if (name.equals("")) {
           request.setAttribute("invalidName", "Team Name cannot be empty!");
           
           checkValid= false;
       }
        else if (tdao.checkTeamExist(xClubID,name)) {
           request.setAttribute("invalidName", "This team name already exists in this club");
           
           checkValid= false;
        }
       else if (name.matches(".*<.*>.*")) {
           request.setAttribute("invalidName", "Team Name cannot contain HTML tags!");
           checkValid= false;
        }
       if (xDetail.equals("")) {
           request.setAttribute("invalidDetail", "Team Detail cannot be empty!");
           
           checkValid= false;
       }
       if (xImage.getSize()==0) {
           request.setAttribute("invalidImage", "Team Avatar cannot be empty!");
           
           checkValid= false;
       } else {
            
            String fileName = xImage.getSubmittedFileName();
            request.setAttribute("image", fileName);
       }
       if (checkValid== false) {
           request.setAttribute("name", name);
           request.setAttribute("leader", leader);
           request.setAttribute("details", xDetail);
           request.getRequestDispatcher("clubdetaildb?cid="+xClubID).forward(request, response);
    } else {  
        int clubID = Integer.parseInt(xClubID);
        String imageURL = saveUploadedFile(request);

        Team t = new Team(0, name, imageURL, xDetail, status, clubID);
        tdao.add(t);
        int newTeamID = tdao.getId_newTeam();
        Student_team st = new Student_team(0, leaderID, 2, newTeamID);
    
        pr.print(stdao.add(st));
        request.getRequestDispatcher("clubdetaildb?cid="+xClubID).forward(request, response);
       }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    String saveUploadedFile(HttpServletRequest request) throws IOException, ServletException {
    String uploadPath = "assets/img/team/";

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
