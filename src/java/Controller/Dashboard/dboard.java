/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Account;
import Model.Club;
import Model.ClubDAO;
import Model.Event;
import Model.EventDAO;
import Model.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author pc
 */
@WebServlet(name="dboard", urlPatterns={"/dboard"})
public class dboard extends HttpServlet {
   
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
        PrintWriter pr= response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String indexPage = request.getParameter("index");
        int index = 1; 
        if (indexPage != null) {index = Integer.parseInt(indexPage);}
         UserDAO dao = new UserDAO();
         ClubDAO lubdao= new ClubDAO();
         EventDAO edao=new EventDAO();
         int countUser = dao.getTotalUser();
         int countUser1 = lubdao.getTotalClub();
         int countUser2 = edao.getTotalEvent();
         int maxPage = (countUser / 5) + (countUser % 5 != 0 ? 1 : 0);
         List<Account> liu= dao.pagingUser(index);
         List<Club> lub=lubdao.getAllClub();
         List<Event> lie=edao.getAllEvent();
         request.setAttribute("cUser", countUser);
         request.setAttribute("cClub", countUser1);
         request.setAttribute("cEvent", countUser2);
         request.setAttribute("lisu", liu);
         request.setAttribute("lisc", lub);
         request.setAttribute("lise", lie);
         request.setAttribute("mPage", maxPage);
         request.setAttribute("tag", index);
         request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
//         request.setCharacterEncoding("UTF-8");
//         String NameSearch =request.getParameter("search");
//         DBoardDAO dao = new DBoardDAO();
//         List<Account> lis= dao.getSearchUser(NameSearch);
//         request.setAttribute("listUser", lis);
//         request.getRequestDispatcher("dashboard.jsp").forward(request, response);
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
