/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Account;
import Model.UserDAO;
import Util.MailHandler;
import Util.encodePassword;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
@WebServlet(name="add", urlPatterns={"/add"})
public class add extends HttpServlet {
   
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
    PrintWriter out = response.getWriter();

String xMail = (String) request.getParameter("email");
String xFullname = request.getParameter("fullname");
String xPassword = request.getParameter("password");
 
    String xPhone = request.getParameter("phone");
    String xstatus = request.getParameter("status");
    int status = Integer.parseInt(xstatus);
    String xgender = request.getParameter("gender");
    int gender = Integer.parseInt(xgender);
    String image = request.getParameter("image");
    String xRoleID =request.getParameter("roleId");
    int roleId = Integer.parseInt(xRoleID);
    String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
    String phoneRegex = "^[0-9]{10}$";
    UserDAO aDAO = new UserDAO();

if (aDAO.checkUserExist(xMail)) {
    request.getSession().setAttribute("wrongRegister", "This email is registered to another account");
    response.sendRedirect("countUser");
    return;
}
if (!xMail.matches(emailRegex)) {
    request.getSession().setAttribute("wrongRegister", "Invalid email format");
    response.sendRedirect("countUser");
    return;
}
if (xPhone == null || xPhone.trim().isEmpty()) {
    
           response.sendRedirect("countUser");
           return;
       } else if (!xPhone.matches(phoneRegex)) {
    
           request.getSession().setAttribute("wrongRegister", "Invalid phone format");
           response.sendRedirect("countUser");
           return;
        }
if (!xFullname.matches("[a-zA-Z ]+")) {
    request.getSession().setAttribute("wrongRegister", "Name should not contain special characters ");
    response.sendRedirect("countUser");
    return;
}

else {
     
        MailHandler mh = new MailHandler();     

    try {
         mh.SendMail(xMail, "Your Registration Information", 
                    "Thank you for registering with our application.\n" +
                    "Here are the details you provided:\n" +
                    "Email: " + xMail + "\n" +
                    "password: " + xPassword + "\n" + 
                    "Please use this infor to complete your registration at http://localhost:9999/SWP/LoginAccount");
        
        
    } catch (Exception e) {
        out.print(e);
    }
    
        encodePassword ep = new encodePassword();
        xPassword = ep.toSHA1(xPassword);
        int numberUser = aDAO.getNumberUser() + 1;
        Account u = new Account(numberUser, xPassword, roleId, status, xFullname, xMail, xPhone, gender, image);
        out.print(aDAO.add(u));
    request.setAttribute("fullname", xFullname);
    request.setAttribute("password", xPassword);
    request.setAttribute("email", xMail);
    request.setAttribute("addnew", "add successfull");
    response.sendRedirect("countUser");
}
    
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
  


}
}
