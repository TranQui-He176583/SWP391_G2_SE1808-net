/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Account;
import Model.Club;
import Model.ClubDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 *
 * @author pc
 */
@WebServlet(name="clubdb", urlPatterns={"/clubdb"})
public class clubdb extends HttpServlet {
   
   /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
         HttpSession session = request.getSession();
         Account account = (Account) session.getAttribute("account");

    if (account != null && account.getRoleId() == 1) {
        String indexPage = request.getParameter("index");
        
    int index = 1; // Default to page 1
    if (indexPage != null) {
        index = Integer.parseInt(indexPage);
    }

    ClubDAO cdao = new ClubDAO();
    int count = cdao.getTotalClub();
    int maxPage = (count / 5) + (count % 5 != 0 ? 1 : 0);
    List<Club> litClub = cdao.pagingClub(index);
    request.setAttribute("listCLB", litClub);
    request.setAttribute("mPage", maxPage);
    request.setAttribute("tag", index);

    request.getRequestDispatcher("clubDboard.jsp").forward(request, response);
    } else {
        request.setAttribute("complete", "You do not have the right to access this page.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
    String NameSearch = request.getParameter("search");
    ClubDAO cdao = new ClubDAO();
    List<Club> listByName = cdao.getSearchClubByName(NameSearch);
    List<Club> listByManager = cdao.getSearchClubByManager(NameSearch);

    // Combine the two lists
    List<Club> combinedList = new ArrayList<>(listByName);
    combinedList.addAll(listByManager);

    // Remove duplicates
    Set<Club> uniqueClubs = new HashSet<>(combinedList);
    combinedList = new ArrayList<>(uniqueClubs);
    request.setAttribute("NameSearch", NameSearch);
    request.setAttribute("listCLB", combinedList);
     request.getRequestDispatcher("clubDboard.jsp").forward(request, response);
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
