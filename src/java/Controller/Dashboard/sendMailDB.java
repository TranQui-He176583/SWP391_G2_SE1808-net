/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Dashboard;

import Model.Account;
import Model.Mail;
import Model.MailDAO;
import Util.MailHandler;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.time.LocalDateTime;

/**
 *
 * @author pc
 */
@WebServlet(name="sendMailDB", urlPatterns={"/sendMailDB"})
public class sendMailDB extends HttpServlet {
   
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
            out.println("<title>Servlet sendMailDB</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sendMailDB at " + request.getContextPath () + "</h1>");
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
       HttpSession session = request.getSession();
       Account account = (Account) session.getAttribute("account");

    if (account != null && account.getRoleId() == 1) {
       request.getRequestDispatcher("MailBox.jsp").forward(request, response);
    } else {
        request.setAttribute("complete", "You do not have the right to access this page.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
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
    String xMail = (String) request.getParameter("email");
    String xSubject = (String) request.getParameter("subject");
    String xContext = (String) request.getParameter("context");
    LocalDateTime time = LocalDateTime.now();
    MailDAO mdao = new MailDAO();

    MailHandler mh = new MailHandler();

    try {
        mh.SendMail(xMail, xSubject, xContext);
    } catch (Exception e) {
        out.print(e);
    }
    int numberUser = mdao.getNumberSent() + 1;
    Mail m = new Mail(numberUser, xMail, xSubject, xContext, time);
    out.print(mdao.addSent(m));
    request.setAttribute("name", xMail);
    request.setAttribute("subject", xSubject);
    request.setAttribute("context", xContext);
    request.setAttribute("time", time);
    response.sendRedirect("listSent");
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
