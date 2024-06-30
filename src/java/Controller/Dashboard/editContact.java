/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Contact;
import Model.ContactDAO;
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
@WebServlet(name="editContact", urlPatterns={"/editContact"})
public class editContact extends HttpServlet {
   
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
            out.println("<title>Servlet editContact</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editContact at " + request.getContextPath () + "</h1>");
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
       String xid = request.getParameter("id");
       int id =Integer.parseInt(xid);
       String xEmail = request.getParameter("email");
       String xSubject = request.getParameter("subject");
       String xDetails = request.getParameter("details");
       String xPhonenumber = request.getParameter("phonenumber");
       String xName = request.getParameter("name");
       String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
       String phoneRegex = "^[0-9]{10}$";
       if (xPhonenumber == null || xPhonenumber.trim().isEmpty()) {
    
           response.sendRedirect("detailContact?ctid=" + id);
           return;
       } 
       else if (!xPhonenumber.matches(phoneRegex)) {
           request.getSession().setAttribute("wrongFormat", "Invalid phone format");
           response.sendRedirect("detailContact?ctid=" + id);
           return;
        }
       else if (!xName.matches("[a-zA-Z ]+")) {
          request.getSession().setAttribute("wrongFormat", "Name should not contain special characters ");
          response.sendRedirect("detailContact?ctid=" + id);
          return;
        }
       else if (!xSubject.matches("[^<>]+")) {
           request.getSession().setAttribute("wrongFormat", "Subject should not contain HTML tags");
           response.sendRedirect("detailContact?ctid=" + id);
           return;
        }
       else if (!xEmail.matches(emailRegex)) {
           request.getSession().setAttribute("wrongFormat", "Invalid Mail format");
           response.sendRedirect("detailContact?ctid=" + id);
          return;
       }
        
       ContactDAO ctdao = new ContactDAO();
       Contact c =ctdao.getContact(xid);
       c.setEmail(xEmail);
       c.setSubject(xSubject);
       c.setDetails(xDetails);
       c.setPhonenumber(xPhonenumber);
       c.setName(xName);
       ctdao.EditContact(c);
       request.getSession().setAttribute("complete", "Successful change");
       response.sendRedirect("detailContact?ctid=" + id );

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
