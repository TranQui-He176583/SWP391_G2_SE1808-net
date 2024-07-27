/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Manager;

import Model.Account;
import Model.AccountDAO;
import Model.Blog;
import Model.BlogDAO;
import Model.ClubDAO;
import Model.Event;
import Model.EventDAO;
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
@WebServlet(name = "manager_blog_details", urlPatterns = {"/manager_blog_details"})
public class manager_blog_details extends HttpServlet {

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
            out.println("<title>Servlet manager_blogs_details</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manager_blogs_details at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Account a = new Account();
        a = (Account) session.getAttribute("account");
        AccountDAO aDAO = new AccountDAO();
        ClubDAO cDAO = new ClubDAO();
        BlogDAO bDAO = new BlogDAO();
        EventDAO eDAO = new EventDAO();
        int blog_id = Integer.parseInt(request.getParameter("blog_id"));
        Blog e = bDAO.getBlogByID(blog_id);
        int club_id = cDAO.get_club_blog_id(blog_id);
        out.print(club_id);
        if (a == null) {
            request.setAttribute("complete", "Please Login!");
            request.getRequestDispatcher("Home").forward(request, response);
        } else {
            if (eDAO.checkManager(a.getId(), club_id) == false) {
                request.setAttribute("complete", "You don't have role manage this club!");
                out.print(club_id);
                request.getRequestDispatcher("Home").forward(request, response);
            } else {

                request.setAttribute("e", e);
                request.setAttribute("club_id", club_id);
                request.getRequestDispatcher("manager_blog_details.jsp").forward(request, response);
            }
        }
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
        processRequest(request, response);
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
