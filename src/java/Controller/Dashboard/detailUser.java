/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Account;
import Model.Club;
import Model.ClubDAO;
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
@WebServlet(name="detailUser", urlPatterns={"/detailUser"})
public class detailUser extends HttpServlet {
   
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
           String id=request.getParameter("uid");
           UserDAO countdao = new UserDAO();
           ClubDAO cdao=new ClubDAO();
           Account u= countdao.getUser(id);
           String indexPage = request.getParameter("index");
        int index = 1; 
        if (indexPage != null) {
        index = Integer.parseInt(indexPage);
    }
        List<Club> listC= cdao.getAllCLubByAccountID(id);
        List<Account> listindb = countdao.pagingUser(index);
      
        String wrongFormat = (String) request.getSession().getAttribute("wrongFormat");
        request.getSession().removeAttribute("wrongFormat");
        
        request.setAttribute("listC", listC );
        request.setAttribute("listdb", listindb );
        request.setAttribute("detail", u);
        request.setAttribute("wrongFormat", wrongFormat);
        request.getRequestDispatcher("User_detail.jsp").forward(request, response);
        
       
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
         String NameSearch =request.getParameter("search");
         UserDAO dao = new UserDAO();
         List<Account> lis= dao.getSearchUser(NameSearch);
         request.setAttribute("listdb", lis);
         request.getRequestDispatcher("User_detail.jsp").forward(request, response);
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
