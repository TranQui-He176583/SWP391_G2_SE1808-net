/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Event;

import Model.*;
import Util.MailHandler;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author quyka
 */
@WebServlet(name="accept_registerEvent", urlPatterns={"/accept_registerEvent"})
public class accept_registerEvent extends HttpServlet {
   
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
            out.println("<title>Servlet accept_registerEvent</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet accept_registerEvent at " + request.getContextPath () + "</h1>");
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
         String xClub_id = request.getParameter("club_id");      
        String event_id = request.getParameter("event_id");
         String eid = request.getParameter("eid");
        String type = request.getParameter("type");
        String cPage = request.getParameter("cPage");
        String ae_id = request.getParameter("ae_id");
        String email = request.getParameter("email");
         MailHandler mh = new MailHandler(); 
         EventDAO eDAO = new EventDAO();
         Event ev = eDAO.getEvent(Integer.parseInt(eid));
         
      if (type.equals("1") ) {
          out.print(eDAO.accept(Integer.parseInt(ae_id)));
           try {
               mh.SendMail(email, "Response to registration application for Event: "+ev.getName(),"Your event registration has been accepted."
                       + "<br><br>Event: "+ev.getName()+
                       "<br>Location: "+ev.getLocation()+
                       "<br>Time: "+ev.getDate());               
            } catch (Exception e) {
                out.print(e);
            }
      }   else {
          eDAO.delete(Integer.parseInt(ae_id));
          try {
               mh.SendMail(email, "Response to registration application for Event: "+ev.getName(),"Your event registration has not been accepted."
                       + "<br><br>Event: "+ev.getName()+
                       "<br>Location: "+ev.getLocation()+
                       "<br>Time: "+ev.getDate());               
            } catch (Exception e) {
                out.print(e);
            }
      }
      request.getRequestDispatcher("manage_registerEvent?club_id="+xClub_id+"&cPage="+cPage+"&event_id="+event_id).forward(request, response);
     
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
