/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Manager;

import Model.Account;
import Model.AccountDAO;
import Model.Club;
import Model.ClubDAO;
import Model.EventDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quyka
 */
@WebServlet(name="manager_club", urlPatterns={"/manager_club"})
public class manager_club extends HttpServlet {
   
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
            out.println("<title>Servlet manager_event</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manager_event at " + request.getContextPath () + "</h1>");
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
        EventDAO eDAO = new EventDAO();
        PrintWriter out = response.getWriter(); 
        HttpSession session = request.getSession();     
         Account a = new Account();
         a = (Account) session.getAttribute("account");
         String complete = (String) request.getAttribute("complete");
         String search = request.getParameter("s");
         int cPage = Integer.parseInt(request.getParameter("cPage"));
       AccountDAO aDAO = new AccountDAO();
     if (a == null ) {
         request.setAttribute("complete", "Please Login!");
           request.getRequestDispatcher("Home").forward(request, response);
     } else { 
         if (search==null) {
             search="";
         }
       if (aDAO.check_Manager(a.getId())==false) {
           request.setAttribute("complete", "You don't have role manager!");
           request.getRequestDispatcher("Home").forward(request, response);
       } else {
           ClubDAO cDAO = new ClubDAO();
           List<Club> cList = new ArrayList<Club>();
           List<Club> crList = new ArrayList<Club>();
           cList= cDAO.get_club_manager(a.getId(),search);
        
         int  nPage = cList.size()/5;
         if (cList.size()%5!=0) nPage++;
       if (cPage*5>cList.size()) {
           if ((nPage-1)*5>cList.size()) {
               cList=null;
           } else {
               crList =cList.subList((cPage-1)*5, cList.size());
           }
       } else {
           crList =cList.subList((cPage-1)*5, cPage*5);
       }   
       
           
           out.print(cList.size());
           request.setAttribute("complete", complete);
          request.setAttribute("cList", crList);     
           request.setAttribute("nPage", nPage);
           request.setAttribute("search", search); 
          request.getRequestDispatcher("club_manager.jsp").forward(request, response);
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

