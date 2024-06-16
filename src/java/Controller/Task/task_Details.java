/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Task;

import Model.Account;
import Model.ClubDAO;
import Model.EventDAO;
import Model.Task.*;
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
 * @author quyka
 */
@WebServlet(name="task_Details", urlPatterns={"/task_Details"})
public class task_Details extends HttpServlet {
   
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
            out.println("<title>Servlet task_Details</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet task_Details at " + request.getContextPath () + "</h1>");
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Account a = new Account();
        a = (Account) session.getAttribute("account");
        TaskDAO TaskDAO = new TaskDAO(); 
          
        String xid= request.getParameter("task_id");
        int id = Integer.parseInt(xid);
        Task t = new Task();
        t = TaskDAO.getTask(id);
     if (a == null) {
         request.setAttribute("complete", "Please Login!");
         request.getRequestDispatcher("index.jsp").forward(request, response);
     } else {   
        
     if (TaskDAO.checkTask(a.getId(), id)==false && TaskDAO.checkManager(a.getId(), t.getClub_id())) {
         request.setAttribute("complete", "You don't have this task!");
         request.getRequestDispatcher("index.jsp").forward(request, response);
     } else {
             
        ClubDAO cDAO = new ClubDAO();
        EventDAO eDAO = new EventDAO();
        
        if (t.isStatus()) {
            request.setAttribute("status", "Đang thực hiện");
        } else {
            request.setAttribute("status", "Đã Hoàn Thành");
        }
        request.setAttribute("name", t.getName());
        request.setAttribute("eventid", t.getEvent_id());
        request.setAttribute("clubid", t.getClub_id());
        request.setAttribute("start", t.getStartTime().toLocalDate()+" at "+t.getStartTime().toLocalTime());
        request.setAttribute("end", t.getEndTime().toLocalDate()+" at "+t.getEndTime().toLocalTime());
        request.setAttribute("event", eDAO.getEvent(t.getEvent_id()).getName());
        request.setAttribute("club", cDAO.getClub_Id(t.getClub_id()).getName());
        request.setAttribute("details", t.getDetails());
        request.getRequestDispatcher("task_details.jsp").forward(request, response);
     }
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
