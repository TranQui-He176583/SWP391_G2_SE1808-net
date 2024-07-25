/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Account;
import Model.Club;
import Model.ClubDAO;
import Model.Team;
import Model.TeamDAO;
import Model.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author pc
 */
@WebServlet(name="detailTeam", urlPatterns={"/detailTeam"})
public class detailTeam extends HttpServlet {
   
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
        PrintWriter pr = response.getWriter();
         HttpSession session = request.getSession();
         Account account = (Account) session.getAttribute("account");
      
    if (account != null && account.getRoleId() == 1) 
    {
        String id =request.getParameter("tid");
        String xClubID = request.getParameter("clubID");
        TeamDAO dao = new TeamDAO();
        UserDAO udao = new UserDAO();
        ClubDAO cdao =new ClubDAO();
        Team t = dao.getTeam(id);
        Club c =cdao.getClub(xClubID);
        List<Account> listLeader= udao.getLeaderByTeamID("2",id);
        List<Account> AccountList = udao.getAllUsersByClubID(xClubID);
        request.setAttribute("detailC", c );
        request.setAttribute("listte", t);
        request.setAttribute("listLeader", listLeader);
        request.setAttribute("AccountList", AccountList );
        request.getRequestDispatcher("TeamDetail.jsp").forward(request, response);

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
