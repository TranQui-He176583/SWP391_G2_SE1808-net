<%-- 
    Document   : add_Event
    Created on : Jun 1, 2024, 4:01:07 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <link rel="stylesheet" href="assets/css/add_Envent.css"> 
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
<%@page import = "Model.*" %>
<%@page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
     List<Account> aList = (List<Account>) request.getAttribute("aList");
     Map<String, Boolean> aMap = (Map<String, Boolean>) request.getAttribute("aMap");
%>
 <style>
    .checkbox-list {
      display: flex;
      flex-wrap: wrap;
    }

    .checkbox-list > div {
      margin-right: 20px;
    }

    .checkbox-list > div.hidden {
      display: none;
    }
    .checkbox-list {
    max-height: 130px;
    overflow-y: auto;
    padding-right: 15px;
  }

  .checkbox-list .hidden {
    display: none;
  }
  </style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <div style="position: relative;">
  <img style="margin-top: 110px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Update Task</div>
</div>
    <body>
                   
        <div  class="login-container">
        <form action="task_Update" method="post" >
             <input type="hidden" name ="task_id" value="${requestScope.task_id}"> 
            <div style="display: flex">
            <div style="width: 65%; height: 250px">
                <label for="name">Task Name:</label>
    <input type="text" id="name" name="name" value="${requestScope.name}" >
    <p style="color: red">${requestScope.invalidName}</p>
    <p style="color: red">${requestScope.invalidlName}</p>
              <div>
                  <div>
    <label for="time">Deadline:</label>
                  </div>
    <div>
    <input type="datetime-local" id="time" name="end" value="${requestScope.etime}"  >
    <p style="color: red">${requestScope.invalidTime}</p>
    </div>
             </div>    
            </div>
            
  <div style="width: 15%; margin-left: 10% ">
      <div>
      <label for="details">Member:</label>
    <input type="text" id="searchInput" placeholder="Tìm kiếm..." />
 
    <div class="checkbox-list">
       <% for (int i=0;i<aList.size();i++) {%>    
      <%if (aMap.get(aList.get(i).getEmail())==null) {%>
      <div>
          <input type="checkbox" id="option1" name="uid" value="<%=aList.get(i).getId()%>">
        <label for="option1"><%=aList.get(i).getEmail()%></label>
      </div>     
      <%} else {%>               
      <div>
          <input type="checkbox" id="option1" name="uid" value="<%=aList.get(i).getId()%>" checked="" >
        <label for="option1"><%=aList.get(i).getEmail()%></label>
      </div>           
     <%}
}%>
     
    </div>
      <p style="color: red">${requestScope.invalidMember}</p>
        </div>
      </div> 
  </div>        
    <input type="hidden" id="cid" name="clubid" value="${requestScope.club_id}"  >
    <input type="hidden" id="eid" name="eventid" value="${requestScope.event_id}"  > 
    
   
  
  
    <div >
    <label for="details">Chi tiết:</label>
    <textarea  id="details" name="details"  rows="10"  " > ${requestScope.details} </textarea>
    <p style="color: red">${requestScope.invalidDetails}</p>
  </div>     
  <button type="submit">Lưu sự kiện</button>

        </form>
                </div>
        <script>
           $(document).ready(function() {
  CKEDITOR.replace('details');
});
        </script>       
        
          
    </body>
  
  
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
   
</html>
