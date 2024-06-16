<%-- 
    Document   : task_List
    Created on : Jun 15, 2024, 10:30:12 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>
<%@page import = "Model.Task.*" %>
<%@page import = "java.util.*" %>
    
<link rel="stylesheet" href="assets/css/task_list.css"/>
<!DOCTYPE html>
<%
         List<Task> tList = (List<Task>) request.getAttribute("tList");
%>
<html>
    <%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <div style="position: relative;">
  <img style="margin-top: 110px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Task List</div>
</div>

    </head>
    
    <body>
         <div class="containerr">
   
    <ul class="task-list">
        <li>
            <div style="font-size: 40px" class="task-name">Task Name</div>
            <div  style="font-size: 40px;text-align: right;" class="task-name">Status</div>
        </li>
        
        
    <%
        for (int i=0;i<tList.size();i++) {
    %>  
    <a href="task_Details?task_id=<%=tList.get(i).getId()%>">
      <li>
        <div class="task-name"><%=tList.get(i).getName()%></div>
      <%if (tList.get(i).isStatus()) {%> 
        <div class="status in-progress">Đang thực hiện</div>
        <%} else {%>
        <div class="status completed">Đã hoàn thành</div>
        <%}%>
      </li>
      </a>
     <%
        }
        
    %>
    </ul>
  </div>
     
    

    </body>
</html>
<%@include file="commonFunction/footer.jsp" %>