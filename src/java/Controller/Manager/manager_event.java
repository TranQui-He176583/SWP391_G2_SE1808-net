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
import java.util.*;

/**
 *
 * @author quyka
 */
@WebServlet(name="manager_event", urlPatterns={"/manager_event"})
public class manager_event extends HttpServlet {
   
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
        
        PrintWriter out = response.getWriter(); 
        HttpSession session = request.getSession();    
        ClubDAO cDAO = new ClubDAO();
         Account a = new Account();
         EventDAO eDAO = new EventDAO();
         a = (Account) session.getAttribute("account");
         String search = request.getParameter("s");
         String xClub_id = request.getParameter("club_id");
         int cPage = Integer.parseInt(request.getParameter("cPage"));
       AccountDAO aDAO = new AccountDAO();
      
        List<Event> eList = new ArrayList<Event>();
        List<Event> erList = new ArrayList<Event>();
     if (a == null ) {
         request.setAttribute("complete", "Please Login!");
           request.getRequestDispatcher("Home").forward(request, response);
     } else { 
           List<Club> cList = cDAO.get_club_manager(a.getId(), "");
         if (search==null) {
             search="";
         }
         if (xClub_id==null) {
             xClub_id="0";
         }
         int club_id = Integer.parseInt(xClub_id);
       if (aDAO.check_Manager(a.getId())==false) {
           request.setAttribute("complete", "You don't have role manager!");
           request.getRequestDispatcher("Home").forward(request, response);
       } else {
           if (club_id != 0) {
               
               if (eDAO.checkManager(a.getId(), club_id)==false) {
                   request.setAttribute("complete", "You don't have role manager!");
                    request.getRequestDispatcher("Home").forward(request, response);
               }
              eList =eDAO.get_eList_search(club_id,search);
              
           } else {
              for (int i=0;i<cList.size();i++) {
                  List<Event> eeList = eDAO.get_eList_search(cList.get(i).getId(), search);              
                  for (int j =0; j<eeList.size(); j++) {
                      eList.add(eeList.get(j));
                  }
              } 
               
               
           }
           int  nPage = eList.size()/5;
         if (eList.size()%5!=0) nPage++;
       if (cPage*5>eList.size()) {
           if ((cPage-1)*5>eList.size()) {
               erList=null;
           } else {
               erList =eList.subList((cPage-1)*5, eList.size());
           }
       } else {
           erList =eList.subList((cPage-1)*5, cPage*5);
       }   
       out.print(eList.size());
         
       request.setAttribute("eList", erList);
       request.setAttribute("cList", cList);
       request.setAttribute("nPage", nPage);
       request.setAttribute("club_id", club_id);
       request.setAttribute("search", search);
       request.getRequestDispatcher("event_manager.jsp").forward(request, response);
           
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
