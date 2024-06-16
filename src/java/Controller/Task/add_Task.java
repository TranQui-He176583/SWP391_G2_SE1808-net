/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Task;

import Model.Account;
import Model.EventDAO;
import Model.Task.*;
import Service.Event.get_aList;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quyka
 */
@WebServlet(name="add_Task", urlPatterns={"/add_Task"})
public class add_Task extends HttpServlet {
   
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
            out.println("<title>Servlet add_Task</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add_Task at " + request.getContextPath () + "</h1>");
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
        PrintWriter out = response.getWriter();
        String xeventid = request.getParameter("eventid");
        String xclubid = request.getParameter("clubid");
        int club_id = Integer.parseInt(xclubid);
        get_aList gal = new get_aList();
        List<Account> aList = new ArrayList<>();
        aList = gal.gettList(club_id);
        request.setAttribute("club_id", xclubid);
        request.setAttribute("event_id", xeventid);
        request.setAttribute("aList", aList);
        request.getRequestDispatcher("add_Task.jsp").forward(request, response);
               
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
       String name= request.getParameter("name");
        String sTime = request.getParameter("start");
        String eTime = request.getParameter("end");
        String details = request.getParameter("details");
        String xeventid = request.getParameter("eventid");
        String xclubid = request.getParameter("clubid");
        int club_id = Integer.parseInt(xclubid);
        
         boolean checkValid =true;
       if (name.equals("")) {
           request.setAttribute("invalidName", "Event name cannot be empty!");
           checkValid= false;
       } 
       if (sTime.equals("")) {
           request.setAttribute("invalidTime", "Event time cannot be empty!");
           checkValid= false;
       }
       if (eTime.equals("")) {
           request.setAttribute("invalidLocation", "Event location cannot be empty!");
           checkValid= false;
       }
       if (details.equals("")) {
           request.setAttribute("invalidDetail", "Event Detail cannot be empty!");
           checkValid= false;
       }
     if (checkValid == false) {
         
         request.setAttribute("name", name);
         request.setAttribute("stime", sTime);
         request.setAttribute("etime", eTime);
         request.setAttribute("details", details);
         get_aList gal = new get_aList();
        List<Account> aList = new ArrayList<>();
        aList = gal.gettList(club_id);
        request.setAttribute("club_id", xclubid);
        request.setAttribute("event_id", xeventid);
        request.setAttribute("aList", aList);
         request.getRequestDispatcher("add_Task.jsp").forward(request, response);
     }  else {
          LocalDateTime stime = LocalDateTime.parse(sTime);
          LocalDateTime etime = LocalDateTime.parse(eTime);
          Task t = new Task(0, name, stime, etime, true, "", club_id, details,1);
          TaskDAO tDAO = new TaskDAO();
          out.print(tDAO.insert(t));
         
     } 
       
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
