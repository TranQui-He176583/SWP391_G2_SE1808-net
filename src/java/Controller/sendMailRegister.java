/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.AccountDAO;
import Util.MailHandler;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;

/**
 *
 * @author quyka
 */
@WebServlet(name="sendMailRegister", urlPatterns={"/sendMailRegister"})
public class sendMailRegister extends HttpServlet {
   
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
            out.println("<title>Servlet sendMailRegister</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sendMailRegister at " + request.getContextPath () + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pr = response.getWriter();
        String xMail = (String) request.getParameter("email");
        String xFullname = request.getParameter("fullname");
        String xPassWord = request.getParameter("password");
        String xCPassWord = request.getParameter("cpassword");
         AccountDAO aDAO = new AccountDAO();
         boolean check = true;
   if (xFullname.equals("")){
       check = false;
        request.setAttribute("wrongName", "FullName can not be blank!");     
   } else {
       if (xFullname.length()>35) {
           check = false;
            request.setAttribute("wrongName", "FullName cannot be more than 35 characters!");
       }
       if (xFullname.matches("[a-zA-Z\\s\\p{L}]+")==false) {
           check = false;
        request.setAttribute("wrongName", "FullName has only alphanumeric characters!");
       }
   }
   
    if (aDAO.isValidEmail(xMail)==false){
       check = false;
        request.setAttribute("wrongEmail", "Email invalidate!");  
   } else {
        if (xMail.length()>35) {
            check = false;
            request.setAttribute("wrongEmail", "Email cannot be more than 35 characters!"); 
        }
    }
    
    if (xPassWord.equals("")){
       check = false;
        request.setAttribute("wrongPassWord", "Password invalidate!");      
   } else {
        if (xPassWord.length()>25) {
            check = false;
        request.setAttribute("wrongPassWord", "Password cannot be more than 25 characters!");
        }
    }
      if (xPassWord.equals(xCPassWord)==false) {
          check = false;
        request.setAttribute("wrongCPassWord", "Password and Confirm Password not the same!");
        
      } 
          
      if (aDAO.checkAccountExist(xMail)) {
           check = false;
            request.setAttribute("wrongRegister", "This email is registered to another account!");
           
        } 
      
      if (check == false) {
           request.setAttribute("fullname", xFullname);
        request.setAttribute("password", xPassWord);
         request.setAttribute("cpassword", xCPassWord);
        request.setAttribute("email", xMail);
         request.getRequestDispatcher("register.jsp").forward(request, response);
      }       
      else {
        MailHandler mh = new MailHandler(); 
             Random rand = new Random();
         int code = rand.nextInt(900000) + 100000;
         
            try {
               mh.SendMail(xMail, "Email Verify Code:", "Reset Password Code:"+code);               
            } catch (Exception e) {
                pr.print(e);
            }

        request.setAttribute("code", code);
        request.setAttribute("fullname", xFullname);
        request.setAttribute("password", xPassWord);
       
        request.setAttribute("email", xMail);
        request.getRequestDispatcher("confirmRegister.jsp").forward(request, response);
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
