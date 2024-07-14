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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author quyka
 */
@WebServlet(name="register_event", urlPatterns={"/register_event"})
public class register_event extends HttpServlet {
   
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
            out.println("<title>Servlet register_event</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register_event at " + request.getContextPath () + "</h1>");
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
       
       String event_id = request.getParameter("event_id");
       HttpSession session = request.getSession();
       Account a = new Account();
        a = (Account) session.getAttribute("account");
        EventDAO eDAO = new EventDAO();
      if (eDAO.checkRegister(a.getId(), event_id)==false) {
          request.setAttribute("noti", "You are already on the list to participate in the event");
          request.setAttribute("register", false);
      } else {
        out.print(eDAO.insertAccount_Event(a.getId(), event_id));
        request.setAttribute("noti", "Thank you for registering. We'll be in touch soon.");
        request.setAttribute("register", true);
        MailHandler mh = new MailHandler(); 
        try {
               mh.SendMail(a.getEmail(), "Register Event", "We have received your application to participate in the event.\n We will contact you soon about your registration status.");               
            } catch (Exception e) {
                out.print(e);
            }
      }

       request.getRequestDispatcher("get_EvenList_ClubId?search=&cPage=1&clubid=0").forward(request, response);
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
