/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.UserDAO;
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
@WebServlet(name="editUser", urlPatterns={"/editUser"})
public class editUser extends HttpServlet {
   
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
       PrintWriter out = response.getWriter();
       String xid = request.getParameter("id");
       int id =Integer.parseInt(xid);
       String xFullName = request.getParameter("fullname");
       String xPhone = request.getParameter("phone");
       String xGender = request.getParameter("gender");
       int gender =Integer.parseInt(xGender);
       String xRole = request.getParameter("roleId");
       int roleId =Integer.parseInt(xRole);
       String xStatus = request.getParameter("status");
       int status =Integer.parseInt(xStatus);
       String xNote = request.getParameter("note");
       String phoneRegex = "^[0-9]{10}$";
       String nameRegex = "^[a-zA-Z\\p{L}\\s]+$";
       boolean checkValid =true;
       if (xPhone.equals("")) {
           request.setAttribute("wrongPhone", "Phone is not empty");
           checkValid= false;
       } else if (!xPhone.matches(phoneRegex)) {
           request.setAttribute("wrongPhone", "Invalid phone format");
           checkValid= false;
        }
        if (xFullName.matches(".*<.*>.*")) {
          request.setAttribute("wrongName", "Name cannot contain HTML tags!");
          checkValid= false;
        }else if (xFullName.equals("")) {
           request.setAttribute("wrongName", "Name is not empty");
           checkValid= false;
        }else if (!xFullName.matches(nameRegex)) {
           request.setAttribute("wrongName", "Name cannot contain special characters");
           checkValid= false;
        }
   if (checkValid== false) {
          
        request.getRequestDispatcher("detailUser?uid=" + id).forward(request, response);
    } else {  
       
       UserDAO udao = new UserDAO();
       out.print(udao.EditUser(roleId, status, xFullName, xPhone, gender,xNote, id));
       request.setAttribute("complete", "Information successfully updated!");
       request.getRequestDispatcher("detailUser?uid=" + id).forward(request, response);
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

