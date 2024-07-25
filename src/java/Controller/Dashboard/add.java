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
    String image = request.getParameter("image");
    String xRoleID =request.getParameter("roleId");
    int roleId = Integer.parseInt(xRoleID);
    String xNote=request.getParameter("note");
    String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
    String phoneRegex = "^[0-9]{10}$";
    String regex = "^[a-zA-Z\\p{L}\\s]+$";
    UserDAO aDAO = new UserDAO();
    boolean checkValid =true;
if (aDAO.checkUserExist(xMail)) {
    request.setAttribute("wrongRegister", "This email is registered to another account");
    checkValid= false;
   
}
else if (xMail.equals("")) {
    request.setAttribute("wrongRegister", "Email not null");
    checkValid= false;
    
}
else if (!xMail.matches(emailRegex)) {
    request.setAttribute("wrongRegister", "Invalid email format");
    checkValid= false;
    
}
if (xPhone.equals("")) {
    request.setAttribute("wrongPhone", "Phone not null");
    checkValid= false;
  
} else if (!xPhone.matches(phoneRegex)) {
    request.setAttribute("wrongPhone", "Invalid phone format");
    checkValid= false;
}
if (xFullname.equals("")) {
    request.setAttribute("wrongName", "Name not null");
    checkValid= false;
}
else if (xFullname.matches(".*<.*>.*")) {
    request.setAttribute("wrongName", "Name cannot contain HTML tags!");
    checkValid= false;
}
else if(!xFullname.matches(regex)) {
    request.setAttribute("invalidLeader", "Name cannot contain special characters, numbers, or HTML tags!");
    checkValid= false;
}
if (checkValid== false) {
       request.setAttribute("email", xMail);
       request.setAttribute("fullname", xFullname);
       request.setAttribute("password", xPassword);
       request.setAttribute("phone", xPhone);
       request.getRequestDispatcher("countUser").forward(request, response);
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
        Account u = new Account(numberUser, xPassword, roleId, status, xFullname, xMail, xPhone, 0, image,xNote);
        out.print(aDAO.add(u));
    
    request.setAttribute("addnew", "add successfull");
    request.getRequestDispatcher("countUser").forward(request, response);
    }

    
    

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
  


}
}
