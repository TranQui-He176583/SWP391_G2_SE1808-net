<%-- 
    Document   : accept_register_event
    Created on : Jul 14, 2024, 2:50:12 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>
<%@page import = "Model.Task.*" %>
<%@page import = "java.util.*" %>
<link rel="stylesheet" href="assets/css/task_list.css"/>
<!DOCTYPE html>
<style>


  .accept-btn, .reject-btn {
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    margin-right: 8px;
  }

  .accept-btn {
    background-color: #4CAF50;
    color: white;
  }

  .reject-btn {
    background-color: #f44336;
    color: white;
  }

  .accept-btn:hover, .reject-btn:hover {
    opacity: 0.8;
  }
</style>
    <%
    List<account_event> aeList = (List<account_event>)request.getAttribute("aeList"); 
    List<Event> eList = (List<Event>)request.getAttribute("eList");
    List<Club> cList = (List<Club>)request.getAttribute("cList");
    int cPage = (int) request.getAttribute("cPage");
    int nPage = (int) request.getAttribute("nPage");
    AccountDAO aDAO = new AccountDAO();
    EventDAO eDAO = new EventDAO();
    String club_id = (String)request.getAttribute("club_id");
    String event_id = (String) request.getAttribute("event_id");
    %>
 <%@include file="commonFunction/CSS.jsp" %>
  <%@include file="commonFunction/header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
         <h2 style="text-align: center; margin-top:10%; font-size: 50px; font-family: sans-serif ">Register Event</h2>
         <div style="display: flex; justify-content: space-between">  
       <div style=" height: 35px; font-size: 18px; margin-top: 10px; margin-left: 2%">
             <form action="manage_registerEvent" id="selectClub" onchange="submitForm()" method="get" >
                    <input type="hidden" name="event_id" value="${requestScope.cE}">
                    <input type="hidden" name="cPage" value="1">                  
                    <label style="border: 1px solid; background:#f05123; border-radius: 5px;width: 120px; height: 35px; padding: 4px " for="options">Select Club:</label>
                    <select style="color:#f05123;height: 35px; padding: 4px" id="options" name="club_id">

                        <option value=""> All Club</option> 
                        <%   for (int i=0;i<(cList.size());i++) { 
                               if (String.valueOf(cList.get(i).getId()).equals(club_id) ) {
                        %>
                        <option value="<%=cList.get(i).getId()%>" selected> <%=cList.get(i).getName()%> </option >
                        <%} else {
                        %>
                        <option value="<%=cList.get(i).getId()%>" > <%=cList.get(i).getName()%> </option >
                        <%}}%>
                    </select>       
                </form>
                <script>
                    function submitForm() {
                        document.getElementById("selectClub").submit();
                    }
                </script>      
        </div> 
                     <div style=" height: 35px; font-size: 17px; margin-top: 15px; margin-right: 2%">
                <form id="selectEvent" onchange="submit()" action="manage_registerEvent" method="get">             
                    <input type="hidden" name="cPage" value="1">
                    <input type="hidden" name="club_id" value="${requestScope.club_id}">                   
                    <label style="border: 1px solid; background:#f05123; border-radius: 5px;width: 120px; height: 35px; padding: 4px " for="options">Select Event:</label>
                    <select style="color:black;height: 35px; padding: 4px; width: 200px;" id="options" name="event_id">
                        <option value=""> All Event</option>               
                        <%   for (int i=0;i<(eList.size());i++) { 
                               if (String.valueOf(eList.get(i).getId()).equals(event_id) ) {
                        %>
                        <option value="<%=eList.get(i).getId()%>" selected> <%=eList.get(i).getName()%> </option >
                        <%} else {
                        %>
                        <option value="<%=eList.get(i).getId()%>" > <%=eList.get(i).getName()%> </option >
                        <%}}%>
                    </select>       
                </form>
                <script>
                    function submit() {
                        document.getElementById("selectEvent").submit();
                    }
                </script>

            </div>  
                    
                    
            </div>    
        <table  id="manager-register-event-table">
  <thead>
    <tr>
      <th style="text-align: center;">Event</th>
      <th style="text-align: center;">User Name</th>
      <th style="text-align: center;">User Email</th>
      <th style="text-align: center;">Action</th>
    </tr>
  </thead>
  <tbody> 
      <%if (aeList.size()>0) {%>
      
   <%for (int i=0;i<aeList.size();i++){
        Event e = eDAO.getEvent(aeList.get(i).getEvent_id());
        Account a = aDAO.getAccount(aeList.get(i).getAccount_id());
   %>   
   
    <tr>
        <td style="text-align: center"><%=e.getName()%></td>
      <td style="text-align: center"><%=a.getFullname()%></td>
      <td  style="text-align: center"> <%=a.getEmail()%></td>
      <td>
        <div style="display: flex; justify-content: center; align-items: center;">
            <form action="accept_registerEvent" method="post">
                <input type="hidden" name="eid" value="<%=e.getId()%>">
                <input type="hidden" name="email" value="<%=a.getEmail()%>">
                 <input type="hidden" name="ae_id" value="<%=aeList.get(i).getId()%>">
                <input type="hidden" name="cPage" value="${requestScope.cPage}">
                <input type="hidden" name="club_id" value="${requestScope.club_id}"> 
                <input type="hidden" name="event_id" value="${requestScope.event_id}">
                 <input type="hidden" name="type" value="1"> 
          <button class="accept-btn">Chấp nhận</button>
            </form>  
             <form action="accept_registerEvent" method="post">
                 <input type="hidden" name="email" value="<%=a.getEmail()%>">
                 <input type="hidden" name="eid" value="<%=e.getId()%>">
                  <input type="hidden" name="ae_id" value="<%=aeList.get(i).getId()%>">
                 <input type="hidden" name="cPage" value="${requestScope.cPage}">
                <input type="hidden" name="club_id" value="${requestScope.club_id}"> 
                <input type="hidden" name="event_id" value="${requestScope.event_id}">
                <input type="hidden" name="type" value="2"> 
          <button class="reject-btn">Từ chối</button>
           </form> 
        </div>
      </td>
    </tr>
    <%}%>
    <%}%>
  </tbody>
</table>

  <div style="text-align: center">
   <% for (int i = 1; i <= nPage; i++) { %>
  <form style="display: inline-block;" action="manage_registerEvent" method="get">
      <input type="hidden" name ="cPage" value="<%=i%>">
    <button style="font-size: 15px; margin-left: 7px; border: 2px solid orangered; padding: 7px; color: black; background: white;width: 40px"><%=i%></button>
  </form>
  <% } %>
  </div> 
    </body>
     <%@include file="commonFunction/footer.jsp" %>
</html>
