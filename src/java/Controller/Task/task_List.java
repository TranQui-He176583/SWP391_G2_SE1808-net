/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Task;

import Model.Account;
import Model.*;
import Model.Task.*;
import Service.Task.getTask;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;

/**
 *
 * @author quyka
 */
@WebServlet(name="task_List", urlPatterns={"/task_List"})
public class task_List extends HttpServlet {
   
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
            out.println("<title>Servlet task_List</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet task_List at " + request.getContextPath () + "</h1>");
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
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();      
        String search = request.getParameter("search");
        String event_id = request.getParameter("event_id");
        String club_id = request.getParameter("club_id");
        int cPage = Integer.parseInt(request.getParameter("cPage"));
        if (search==null) {
            search = "";
        }
        if (club_id == null) {
            club_id="";
        }
        if (event_id == null) {
            event_id="";
        } 
        getTask gTask = new  getTask();
        List<Task> tList = new ArrayList<Task>();
        HttpSession session = request.getSession();
       Account a = new Account();
       a = (Account) session.getAttribute("account");
       if (a==null) {
           request.setAttribute("complete", "Please Login!");
           request.getRequestDispatcher("index.jsp").forward(request, response);
       } else {
        tList = gTask.gettList(a.getId(),search,cPage,"","");
        ClubDAO cDAO = new ClubDAO();
        EventDAO eDAO = new EventDAO();
        ArrayList<Club> cList = new ArrayList<Club>();
        ArrayList<Event> eList = new ArrayList<Event>();
        for (int i=0;i<tList.size();i++) {   
            out.println(tList.get(i).getId());
          if (checkCList(tList.get(i).getClub_id(), cList)) {
            Club c = new Club();
            c= cDAO.getClubById(tList.get(i).getClub_id());
           if (c.getName() != null) {
              cList.add(c); 
           }             
          }
        }
         tList = gTask.gettList(a.getId(),search,cPage,"",club_id); 
       for (int i=0;i<tList.size();i++) {   
        if (checkEList(tList.get(i).getEvent_id(), eList)) { 
             Event e = new Event();
            e = eDAO.getEvent(tList.get(i).getEvent_id());
            if (e.getName()!=null) {
                eList.add(e);
            } 
        }
       }
        
        
        tList = gTask.gettList(a.getId(),search,cPage,event_id,club_id);
          int nPage= gTask.gett_nPage(a.getId(), search,event_id,club_id);
         request.setAttribute("cList", cList);
         request.setAttribute("eList", eList);
        request.setAttribute("tList", tList);
        request.setAttribute("search", search);
        request.setAttribute("cC", club_id);
        request.setAttribute("cE", event_id);
         request.setAttribute("nPage", nPage);
         request.setAttribute("cPage", cPage);
         request.setAttribute("typeSearch", false);
        request.getRequestDispatcher("task_List.jsp").forward(request, response); 
       }
      
        
    } 
public boolean checkEList(int id, ArrayList<Event> eList) {
    for (Event event : eList) {
        if (event.getId() == id) {
            return false;
        }
    }
    return true;
}
public boolean checkCList(int id, ArrayList<Club> cList) {
    for (Club club : cList) {
        if (club.getId() == id) {
            return false;
        }
    }
    return true;
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
        String xClub_id = request.getParameter("club_id");
        String search = request.getParameter("search");
        String event_id = request.getParameter("event_id");
        int cPage = Integer.parseInt(request.getParameter("cPage"));        
        if (search==null) {
            search = "";
        }
        if (event_id==null) {
            event_id="";
        }
      
        int club_id = Integer.parseInt(xClub_id);
        List<Task> tList = new ArrayList<Task>();
        TaskDAO tDAO = new TaskDAO();
       tList=  tDAO.get_TaskList(club_id,search,cPage,event_id);
       List<Event>  eList = new ArrayList<Event>();
       EventDAO eDAO = new EventDAO();
       eList= eDAO.getEventByClubID(xClub_id);
       
       int nPage = tDAO.get_numberTask(club_id, search,event_id);
      
       out.print(club_id);
        request.setAttribute("search", search);
        request.setAttribute("club_id", String.valueOf(club_id));
        request.setAttribute("cE", event_id);
         request.setAttribute("tList", tList);
         request.setAttribute("eList", eList);
         request.setAttribute("nPage", nPage);
         request.setAttribute("cPage", cPage);
          request.setAttribute("typeSearch", true);
       request.getRequestDispatcher("task_List.jsp").forward(request, response); 
        
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
