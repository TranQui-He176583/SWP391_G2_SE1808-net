/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Account;
import Model.AccountDAO;
import Util.encodePassword;
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
@WebServlet(name="change_F_Password", urlPatterns={"/change_F_Password"})
public class change_F_Password extends HttpServlet {
   
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
            out.println("<title>Servlet change_F_Password</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet change_F_Password at " + request.getContextPath () + "</h1>");
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
        String xEmail = request.getParameter("email");
        String xPassword = request.getParameter("npassword");
        String xCPassword = request.getParameter("cpassword");
    if (xPassword.length()<6 || xPassword.length()>20) {
        request.setAttribute("cp", xCPassword);
        request.setAttribute("np", xPassword);
        request.setAttribute("wrong", "Password can be from 6 to 20 characters!");
        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
    }    
    if (xCPassword.equals(xPassword)) {    
         encodePassword ep = new encodePassword();
         xPassword = ep.toSHA1(xPassword);
         AccountDAO aDAO = new AccountDAO();
         
          aDAO.updatePassWord(xEmail, xPassword);
           HttpSession session = request.getSession();
          Account account = aDAO.getAccount(xEmail,xPassword);
         
          session.setAttribute("account",account);
          
         request.setAttribute("complete", "Change Password Complete!");
         request.getRequestDispatcher("index.jsp").forward(request, response);
        
    } else {
       
        request.setAttribute("email", xEmail);
        request.setAttribute("cp", xCPassword);
        request.setAttribute("np", xPassword);
        request.setAttribute("wrong", "Password and Confirm password not the same!");
        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
                
    }
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
