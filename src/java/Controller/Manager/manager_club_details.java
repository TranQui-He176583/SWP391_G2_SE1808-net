/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Manager;

import Model.*;
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
@WebServlet(name="manager_club_details", urlPatterns={"/manager_club_details"})
public class manager_club_details extends HttpServlet {
   
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
            out.println("<title>Servlet manager_club_details</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manager_club_details at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();     
         Account a = new Account();
         a = (Account) session.getAttribute("account");        
       AccountDAO aDAO = new AccountDAO();
       ClubDAO cDAO = new ClubDAO();
       EventDAO eDAO = new EventDAO();
       int club_id = Integer.parseInt(request.getParameter("club_id"));
       
     if (a == null ) {
         request.setAttribute("complete", "Please Login!");
           request.getRequestDispatcher("Home").forward(request, response);
     } else {
         if (eDAO.checkManager(a.getId(), club_id)==false) {
             request.setAttribute("complete", "You don't have role manage this club!");
           request.getRequestDispatcher("Home").forward(request, response);
         } else {
             Club c = cDAO.getClub_Id(club_id);
             request.setAttribute("c", c);
             request.getRequestDispatcher("manager_club_details.jsp").forward(request, response);
         }
     }
     
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
        processRequest(request, response);
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
