
package Controller.Event;

import Model.*;
import Service.Event.get_aList;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;

@WebServlet(name="manage_registerEvent", urlPatterns={"/manage_registerEvent"})
public class manage_registerEvent extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String xClub_id = request.getParameter("club_id");      
        String event_id = request.getParameter("event_id");
        HttpSession session = request.getSession();
       Account a = new Account();
       a = (Account) session.getAttribute("account");     
       if (a==null) {
           request.setAttribute("complete", "Please Login!");
           request.getRequestDispatcher("Home").forward(request, response);
       } else {
        int cPage = Integer.parseInt(request.getParameter("cPage"));              
        if (event_id==null) {
            event_id="";
        }
        if (xClub_id==null) {
            xClub_id="";
        }
       List<Event>  eList = new ArrayList<Event>();
       get_aList getaList= new get_aList();
       List<Club> cList= getaList.get(a.getId());
       EventDAO eDAO = new EventDAO();          
     if (xClub_id != "") {  
       eList= eDAO.geteListdate(xClub_id);
     } else {        
        for (int i=0;i<cList.size();i++) {
           List<Event> eListt = eDAO.geteListdate(String.valueOf(cList.get(i).getId()));
           for (int j = 0;j<eListt.size();j++) {
               eList.add(eListt.get(j));
           }
        }
     }
       List<account_event> aeList = new ArrayList<account_event>();
       if (event_id=="") {     
       for (int i=0;i<eList.size();i++) {         
           List<account_event> aeListt = eDAO.getAccount_Event(eList.get(i).getId()); 
           for (int j=0;j<aeListt.size();j++) {
               aeList.add(aeListt.get(j));
           }
       }
       } else {          
           aeList= eDAO.getAccount_Event(Integer.parseInt(event_id));
       }
      int nPage = aeList.size()/10;
      Collections.reverse(aeList);
    if (aeList.size()%10 !=0) {
        nPage++;
    }   
    if (cPage*10>aeList.size()) {
       if ((cPage-1)*10>aeList.size()) {
           aeList= null;
       } else {
        aeList = aeList.subList((cPage-1)*10, aeList.size());
        }
    } else {
        aeList = aeList.subList((cPage-1)*10, cPage*10);
    }
         request.setAttribute("club_id", xClub_id);
          request.setAttribute("event_id", event_id);
        request.setAttribute("cList", cList);
        request.setAttribute("eList", eList);
        request.setAttribute("aeList", aeList);
        request.setAttribute("cPage", cPage);
        request.setAttribute("nPage", nPage);
        
        request.getRequestDispatcher("accept_register_event.jsp").forward(request, response);
       }
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         doGet(request, response);
    }
}