/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Task;

import Model.Account;
import Model.AccountDAO;
import Model.EventDAO;
import Model.Task.Task;
import Model.Task.TaskDAO;
import Service.Event.get_aList;
import Service.Task.getTask;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author quyka
 */
@WebServlet(name="task_Update", urlPatterns={"/task_Update"})
public class task_Update extends HttpServlet {
   
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
            out.println("<title>Servlet task_Update</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet task_Update at " + request.getContextPath () + "</h1>");
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
      int task_id =   Integer.parseInt(request.getParameter("task_id"));
        TaskDAO tDAO = new TaskDAO();
        Task t = new Task ();
       t = tDAO.getTask(task_id); 
       EventDAO eDAO = new EventDAO();
        HttpSession session = request.getSession();     
       Account a = new Account();
       a = (Account) session.getAttribute("account");
      if (a==null) {
          request.setAttribute("complete","You don't have role to update this task!");
           request.getRequestDispatcher("index.jsp").forward(request, response);
      }  else {
       if (eDAO.checkManager(a.getId(), t.getClub_id()) ==false) {
           request.setAttribute("complete","You don't have role to update this task!");
           request.getRequestDispatcher("index.jsp").forward(request, response);
       } else {
        List<Account> aList = new ArrayList<>();
        Map<String, Boolean> aMap = new HashMap<>();      
        getTask gTask = new getTask();
        aMap = gTask.gettList(task_id);        
        
        get_aList gal = new get_aList();
        aList = gal.gettList(t.getClub_id());
       for (int i=0;i<aList.size();i++) {
           out.print(aList.get(i).getEmail());
           out.println();
       } 
     request.setAttribute("task_id", task_id);
     request.setAttribute("name", t.getName());
     request.setAttribute("stime", t.getStartTime());
     request.setAttribute("etime", t.getEndTime());     
     request.setAttribute("details", t.getDetails());
     request.setAttribute("club_id", t.getClub_id());
     request.setAttribute("event_id", t.getEvent_id());
     request.setAttribute("aList", aList);     
     request.setAttribute("aMap", aMap);
     
     request.getRequestDispatcher("task_Update.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
         Map<String, Boolean> aMap = new HashMap<>(); 
         AccountDAO aDAO = new AccountDAO();
       String name= request.getParameter("name");
        String eTime = request.getParameter("end");
        String details = request.getParameter("details");
        String xeventid = request.getParameter("eventid");
       int task_id =   Integer.parseInt(request.getParameter("task_id")); 
       int eventid=0;
        String xclubid = request.getParameter("clubid");
        String[] iList = request.getParameterValues("uid");
        int club_id = Integer.parseInt(xclubid);        
         boolean checkValid =true;
         if (iList == null) {
             request.setAttribute("invalidMember", "Please choose member do this task!");
           checkValid= false;
         }
       if (name.equals("")) {
           request.setAttribute("invalidName", "Task name cannot be empty!");
           checkValid= false;
       } 
       if (validateChar(name)==false) {
           request.setAttribute("invalidName", "Task name can't contain special characters!");
           checkValid= false;
       }
       
       if (name.length()>100) {
            request.setAttribute("invalidlName", "Task name has a maximum length of 150 characters");
            checkValid= false;
       }
       if (eTime.equals("")) {
           request.setAttribute("invalidTime", "End time cannot be empty!");
           checkValid= false;
       }
       if (details.equals("")) {
           request.setAttribute("invalidDetails", "Task Detail cannot be empty!");
           checkValid= false;
       }
     if (checkValid == false) {
         if (iList != null) {  
         for (int i=0;i<iList.length;i++) {
             Account a = new Account();
           a=  aDAO.getAccount(Integer.parseInt(iList[i]));
             aMap.put(a.getEmail(), true);
         }
         }
         
         request.setAttribute("task_id", task_id);
         request.setAttribute("aMap", aMap);
         request.setAttribute("name", name);
         request.setAttribute("etime", eTime);
         request.setAttribute("details", details);
         get_aList gal = new get_aList();
        List<Account> aList = new ArrayList<>();
        aList = gal.gettList(club_id);
        request.setAttribute("club_id", xclubid);
        request.setAttribute("event_id", xeventid);
        request.setAttribute("aList", aList);       
         request.getRequestDispatcher("task_Update.jsp").forward(request, response);
     }  else {
         if (xeventid != null) {
             eventid= Integer.parseInt(xeventid);
         }
          LocalDateTime stime = LocalDateTime.now();
          LocalDateTime etime = LocalDateTime.parse(eTime);
          Task t = new Task(task_id, name, stime, etime, true, "", eventid, details,club_id);
          TaskDAO tDAO = new TaskDAO();  
          tDAO.delete_taskAccount(task_id);
          out.print(tDAO.update(t));
         for (int i=0;i<iList.length;i++) { 
          tDAO.insertStudent(Integer.parseInt(iList[i]), task_id);
         }
         response.sendRedirect("task_Details?task_id="+task_id);
                 
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
    
    public boolean validateChar(String taskName) {
          taskName = taskName.trim();
          int openingParenthesisCount = 0;
        int closingParenthesisCount = 0;
           for (int i = 0; i < taskName.length(); i++) {
            char c = taskName.charAt(i);
            if (!Character.isLetterOrDigit(c) && c != ' ' && c != '(' && c != ')') {
                return false;
            }
           else if (c == '(') {
                openingParenthesisCount++;
            }
            else if (c == ')') {
                closingParenthesisCount++;
            }
            
        }
            return openingParenthesisCount == closingParenthesisCount;
    }
    
}
