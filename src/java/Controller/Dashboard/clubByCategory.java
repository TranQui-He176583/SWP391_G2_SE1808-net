/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Account;
import Model.BlogDAO;
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
@WebServlet(name="clubByCategory", urlPatterns={"/clubByCategory"})
public class clubByCategory extends HttpServlet {
   
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
        PrintWriter out = response.getWriter();
        String indexPage = request.getParameter("index");
        String xCategory = request.getParameter("category");
        int index = 1; 
        if (indexPage != null) {index = Integer.parseInt(indexPage);}
         UserDAO dao = new UserDAO();
         ClubDAO lubdao= new ClubDAO();
         EventDAO edao=new EventDAO();
         BlogDAO bdao =new BlogDAO();
         int countUser = dao.getTotalUser();
         int countUser1 = lubdao.getTotalClub();
         int countUser2 = edao.getTotalEvent();
         int countUserStatus0 = dao.getTotalUserByStatus0();
         int countUserStatus1 = dao.getTotalUserByStatus1();
         int countVoThuat = lubdao.getTotalClubByVoThuat();
         int countHocThuat = lubdao.getTotalClubByHocThuat();
         int countNgheThuat = lubdao.getTotalClubByNgheThuat();
         int countCongDong = lubdao.getTotalClubByCongDong();
         int countEvent0 = edao.getTotalEventByStatus0();
         int countEvent1 = edao.getTotalEventByStatus1();
         int countEvent2 = edao.getTotalEventByStatus2();
         int countBlog = bdao.getTotalBlog();
        int maxPage = (countUser / 5) + (countUser % 5 != 0 ? 1 : 0);
         List<Account> liu= dao.pagingUser(index);
         List<Event> lie=edao.getAllEvent();
         List<Club> lsClub = lubdao.getAllClubByCategory(xCategory);
         request.setAttribute("lisc", lsClub);
         request.setAttribute("cBlog", countBlog);
         request.setAttribute("cUser", countUser);
         request.setAttribute("cUser0", countUserStatus0);
         request.setAttribute("cUser1", countUserStatus1);
         request.setAttribute("cClub", countUser1);
         request.setAttribute("cVoThuat", countVoThuat);
         request.setAttribute("cHocThuat", countHocThuat);
         request.setAttribute("cNgheThuat", countNgheThuat);
         request.setAttribute("cCongDong", countCongDong);
         request.setAttribute("cEvent", countUser2);
         request.setAttribute("cNotHappened", countEvent0);
         request.setAttribute("cHadHappened", countEvent1);
         request.setAttribute("cCanceled", countEvent2);
         request.setAttribute("lisu", liu);
         request.setAttribute("lisc", lsClub);
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
