/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.ClubDAO;
import Util.MailHandler;
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
 * @author Duong
 */
@WebServlet(name = "ApproveMembers", urlPatterns = {"/ApproveMembers"})
public class ApproveMembers extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet ApproveMembers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ApproveMembers at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        try (PrintWriter out = response.getWriter()) {
            try {
                String name = account.getFullname();
                String email = account.getEmail();
                String details = "User " + name + " (Email: " + email + ") has requested to join the club.";
                String subject = "Membership Request";
                int accountid = Integer.parseInt(request.getParameter("accountid"));
                int clubid = Integer.parseInt(request.getParameter("clubid"));
                int status = Integer.parseInt(request.getParameter("status"));
                ClubDAO clubDAO = new ClubDAO();
                clubDAO.changeStatusclubID(accountid, clubid);
                MailHandler mailHandler = new MailHandler();
                String recipientEmail = "swp391g2k17@gmail.com"; // Replace with your recipient email
                mailHandler.SendMail(recipientEmail, subject, details);
                request.setAttribute("clubid", clubid);
                request.setAttribute("status", status);
                request.getRequestDispatcher("ClubMembers").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace(out);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
