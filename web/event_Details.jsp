<%-- 
    Document   : event_Details
    Created on : Jun 5, 2024, 8:51:31 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>

<%@page import = "java.util.*" %>
<!DOCTYPE html>
<%
        Event e = new Event();
        e = (Event)request.getAttribute("Event");
         List<Event> eList = (List<Event>) request.getAttribute("eList");
%>

<html>
    <%@include file="commonFunction/CSS.jsp" %>
    <%@include file="commonFunction/header.jsp" %>
    
    <body >
        <div class="row" style="margin-top: 180px;">
          <div class="col-9" style="">
              <div style="margin-left: 50px">
                <h1 style=" font-family:  Helvetica, Arial, sans-serif; font-size: 36px;font-weight: 500; text-align: center ">
                    <%= e.getName()%></h1>
                <p style="margin-top: 20px;font-weight: bold">Time: <%=e.getDate().toLocalDate()%> At:<%=e.getDate().toLocalTime()%> </p>
                <p style="font-weight: bold;">Location: <%=e.getLocation()%></p>
                <p><%=e.getDetails()%></p>
            </div>
         </div>
  <div class="col-3">
     
    <%
        for (int i=0;i<eList.size();i++) {

    %>
    <div style="margin-left: 30px;width: 200px">
        <a href="event_Details?id=<%=eList.get(i).getId()%>" style=" width: 150px; height: 100px">
            <img style="width: 80%; height: 100%" src="<%=eList.get(i).getAvatar()%>" alt="alt"/>
            <p style="width: 100%; font-weight: bold"> <%=eList.get(i).getName()%></p>
            <p style="font-size: 13px; margin-top: -20px"><%=eList.get(i).getDate().toLocalDate()%></p>
            
        </a>
    </div>
       <%}%> 
  </div>
 
</div>
        
    </body>
</html>
