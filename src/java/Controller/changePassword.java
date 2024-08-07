/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.*;
import Util.*;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author quyka
 */
@WebServlet(name="changePassword", urlPatterns={"/changePassword"})
public class changePassword extends HttpServlet {
   
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
            out.println("<title>Servlet changePassword</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changePassword at " + request.getContextPath () + "</h1>");
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
        String xOldPassword = request.getParameter("oldPassword");
        String oldpass = xOldPassword;
        String xNewPassword = request.getParameter("newPassword");
        String newpass = xNewPassword;
        String xConfrimPassword = request.getParameter("confirmPassword");
        boolean check = true;
        
      if (xNewPassword.length()<6 || xNewPassword.length()>20) {
             check = false;
            request.setAttribute("wrong1", "Password can be from 6 to 20 characters!"); 
    }
      
      if (xNewPassword.equals(xConfrimPassword)==false) {
            check = false;
            request.setAttribute("wrong2", "New password and confirm password not same!");            
      }      
         encodePassword ep = new encodePassword();
          xNewPassword = ep.toSHA1(xNewPassword);
         xOldPassword = ep.toSHA1(xOldPassword);
          out.print(xEmail);
         AccountDAO aDAO = new AccountDAO();
           if (aDAO.checkLogin(xEmail, xOldPassword)==false) {
               check = false;
               request.setAttribute("wrongLogin", "Old Password Wrong!");
           }
           
         if (check == false ) {
             request.setAttribute("password", oldpass);
            request.setAttribute("newpassword", newpass);
            request.setAttribute("confirmpassword", xConfrimPassword);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
         } else {         
            aDAO.updatePassWord(xEmail, xNewPassword);           
             request.setAttribute("complete", "Change Password Complete!");
                 request.getRequestDispatcher("Home").forward(request, response);    
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
