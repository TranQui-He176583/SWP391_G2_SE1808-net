<%-- 
    Document   : event_Details
    Created on : Jun 5, 2024, 8:51:31 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>
<!DOCTYPE html>
<%
        Event e = new Event();
        e = (Event)request.getAttribute("Event");
        
%>
<html>
    <%@include file="commonFunction/CSS.jsp" %>
    <%@include file="commonFunction/header.jsp" %>
    
    <body >
        <div class="row" style="margin-top: 180px;">
          <div class="col-9" style="">
              <div style="margin-left: 50px">
                <h1 style=" font-family:  Helvetica, Arial, sans-serif; font-size: 36px;font-weight: 500; "> <%= e.getName()%></h1>
                <p style="margin-top: 20px">Time: <%=e.getDate().toLocalDate()%> At:<%=e.getDate().toLocalTime()%> </p>
                <p><%=e.getDetails()%></p>
            </div>
         </div>
  <div class="col-3">
    Cột 2
  </div>
 
</div>
        
    </body>
</html>
