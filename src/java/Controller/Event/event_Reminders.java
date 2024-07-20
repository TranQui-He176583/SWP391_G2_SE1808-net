/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Event;

import Model.*;
import Model.Task.*;
import Util.MailHandler;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

/**
 *
 * @author quyka
 */
@WebServlet(name="event_Reminders", urlPatterns={"/event_Reminders"})
public class event_Reminders extends HttpServlet {
   
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
            out.println("<title>Servlet event_Reminders</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet event_Reminders at " + request.getContextPath () + "</h1>");
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
        EventDAO eDAO = new EventDAO();
        AccountDAO aDAO = new AccountDAO();
        List<Event>  eList = new ArrayList<Event>();
        eList= eDAO.getAllEvent1();     
        out.print(eList.size());
        MailHandler mh = new MailHandler(); 
       for (int i =0;i<eList.size();i++) {
           List<account_event> aeList = new ArrayList<account_event>();           
           aeList=eDAO.getAccount_Event1(eList.get(i).getId());
           out.print(aeList.size());
          for (int j=0;j<aeList.size();j++) {
              Account a = aDAO.getAccount(aeList.get(j).getAccount_id());
              out.print(a.getEmail());
              try {
               mh.SendMail(a.getEmail(), "Event participation reminder: "+eList.get(i).getName(),"<br>Event Information:"
                       + "<br>Event: "+eList.get(i).getName()+
                       "<br>Location: "+eList.get(i).getLocation()+
                       "<br>Time: "+eList.get(i).getDate());               
            } catch (Exception e) {
                out.print(e);
            }
          } 
       }
       List<Integer> tList = new ArrayList<Integer>();
       TaskDAO tDAO = new TaskDAO();
       tList= tDAO.getDoing_Task();
       for (int i=0; i <tList.size();i++) {
           tDAO.update(tList.get(i));
       }       
       request.setAttribute("complete", "Reminder complete!");
       request.getRequestDispatcher("manager_club?cPage=1").forward(request, response);
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
