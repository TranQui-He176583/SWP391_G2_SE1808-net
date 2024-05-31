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
import Util.*;
import Model.*;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
/**
 *
 * @author quyka
 */
@WebServlet(name="loginGoogle", urlPatterns={"/loginGoogle"})
public class loginGoogle extends HttpServlet {
   
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
        String code = request.getParameter("code");
        googleLogin gl = new googleLogin();
        String accessToken = gl.getToken(code);
        googleAccount ga = new googleAccount();
        ga = gl.getUserInfo(accessToken);
       encodePassword ep  = new encodePassword();
       
    
       
       
       String password = "";
       Account a = new  Account();
       a.setEmail(ga.getEmail());
       a.setFullname(ga.getName());
       AccountDAO aDAO = new AccountDAO();
       out.print(aDAO.checkAccountExist(ga.getEmail()));
       if (aDAO.checkAccountExist(ga.getEmail())==false) {
           
             MailHandler mh = new MailHandler(); 
             Random rand = new Random();
         int Iassword = rand.nextInt(900000) + 100000;
         String Spassword = String.valueOf(Iassword);
            try {
               mh.SendMail(ga.getEmail(), "Account Password", "Your Password:"+Iassword);               
            } catch (Exception e) {
                
            } 
           password = ep.toSHA1(Spassword);
           a.setPassWord(password);
           a.setId(aDAO.getNumberAccount()+1);
           a.setRoleId(3);
           out.print(aDAO.insert(a));
        
       }
       HttpSession session = request.getSession();
       a = aDAO.getAccount(a.getEmail()); 
       session.setAttribute("account", a);
       request.getRequestDispatcher("index.jsp").forward(request, response);
       
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
