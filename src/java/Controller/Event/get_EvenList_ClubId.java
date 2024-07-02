/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Event;

import Controller.*;
import Model.*;
import java.util.*;
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
@WebServlet(name="get_EvenList_ClubId", urlPatterns={"/get_EvenList_ClubId"})
public class get_EvenList_ClubId extends HttpServlet {
   
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
            out.println("<title>Servlet get_EvenList_ClubId</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet get_EvenList_ClubId at " + request.getContextPath () + "</h1>");
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
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         int cPage = Integer.parseInt(request.getParameter("cPage"));
         String sSerach = request.getParameter("search");
         String club_Id = request.getParameter("clubid");
         int clubid = Integer.parseInt(club_Id);
         
         EventDAO eDAO = new EventDAO();
         List<Event> eList = new ArrayList<Event>();
         eList = eDAO.get_Event_List(clubid, sSerach, cPage);
       //  out.print(eDAO.get_Event_List(clubid, sSerach, cPage));
         
       int numberEvent = eDAO.get_Event_List_Npage(clubid, sSerach);
         int nPage=numberEvent/9;
        if (numberEvent%9!=0) {
            nPage++;
        }
        ClubDAO cDAO = new ClubDAO();
        List<Club> cList = new ArrayList<Club> () ;
        cList = cDAO.getClubs();
        
        
        //out.print(cList.size());
        request.setAttribute("cClub", club_Id);
        request.setAttribute("cPage", cPage);
        request.setAttribute("search", sSerach);
        request.setAttribute("nPage", nPage);
        request.setAttribute("eList", eList);
        request.setAttribute("cList", cList);
        request.getRequestDispatcher("eventList.jsp").forward(request, response);
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
