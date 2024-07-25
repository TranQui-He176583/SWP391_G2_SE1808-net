/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.AccountDAO;
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
@WebServlet(name = "DeleteMembers", urlPatterns = {"/DeleteMembers"})
public class DeleteMembers extends HttpServlet {

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
            out.println("<title>Servlet DeleteMembers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteMembers at " + request.getContextPath() + "</h1>");
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
        try (PrintWriter out = response.getWriter()) {
            AccountDAO ad = new AccountDAO();
            
            try {
                int accountid = Integer.parseInt(request.getParameter("accountid"));
                int clubid = Integer.parseInt(request.getParameter("clubid"));
                int status = Integer.parseInt(request.getParameter("status"));
                Account a = ad.getAccount(accountid);
                String name = a.getFullname();
                String mail = a.getEmail();
                String reason = request.getParameter("reason");
                String details = "Kính gửi " + name + " Chúng tôi rất cảm ơn bạn đã quan tâm đến câu lạc bộ của chúng tôi. Sau khi tham khảo thông tin" + "<br>Chúng tôi rất xin lỗi vì " + reason;
                String subject = "Sorry";
                ClubDAO clubDAO = new ClubDAO();
                clubDAO.deleteMember(accountid, clubid);
                request.setAttribute("clubid", clubid);
                request.setAttribute("status", status);
                MailHandler mailHandler = new MailHandler();
                mailHandler.SendMail(mail, subject, details);
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
