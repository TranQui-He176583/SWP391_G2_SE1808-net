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
<%
     List<Account> aList = (List<Account>) request.getAttribute("aList");
    
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
  </style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <div style="position: relative;">
  <img style="margin-top: 110px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Add New Task</div>
</div>
    <body>
                    
        <div  class="login-container">
        <form action="add_Task" method="post" >
            <div>
    <label for="name">Task Name:</label>
    <input type="text" id="name" name="name" value="${requestScope.name}" >
    <p style="color: red">${requestScope.invalidName}</p>
  </div>
    <p style="color: red">${requestScope.invalidImage}</p>
            
 
    <input type="hidden" id="cid" name="clubid" value="${requestScope.club_id}"  >
    <input type="hidden" id="eid" name="eventid" value="${requestScope.event_id}"  > 
  
  <div>
    <label for="time">Start:</label>
    <input type="datetime-local" id="time" name="start" value="${requestScope.stime}"  >
    <p style="color: red">${requestScope.invalidTime}</p>
  </div>
  
  <div>
    <label for="time">End:</label>
    <input type="datetime-local" id="time" name="end" value="${requestScope.etime}"  >
    <p style="color: red">${requestScope.invalidTime}</p>
  </div>
  
  <div>
    <label for="details">Chi tiết:</label>
    <textarea  id="details" name="details"  rows="10"  " > ${requestScope.detail} </textarea>
    <p style="color: red">${requestScope.invalidDetail}</p>
  </div>
  
  
  <div>
      <label for="details">Member:</label>
    <input type="text" id="searchInput" placeholder="Tìm kiếm..." />
    <div class="checkbox-list">
       <% for (int i=0;i<aList.size();i++) {%> 
      <div>
        <input type="checkbox" id="option1" name="uid" value="<%=aList.get(i).getId()%>">
        <label for="option1"><%=aList.get(i).getEmail()%></label>
      </div>
     <%}%>
      
    </div>
  </div>
     
     <script>
    const checkboxList = document.querySelector('.checkbox-list');
    const searchInput = document.getElementById('searchInput');
    const checkboxes = checkboxList.querySelectorAll('input[type="checkbox"]');

    searchInput.addEventListener('input', () => {
      const searchTerm = searchInput.value.toLowerCase();
      checkboxes.forEach(checkbox => {
        const label = checkbox.nextElementSibling.textContent.toLowerCase();
        const parent = checkbox.parentElement;
        if (label.includes(searchTerm)) {
          parent.classList.remove('hidden');
        } else {
          parent.classList.add('hidden');
        }
      });
    });

    checkboxList.addEventListener('change', () => {
      checkboxes.forEach(checkbox => {
        const parent = checkbox.parentElement;
        if (checkbox.checked) {
          parent.classList.remove('hidden');
        } else {
          parent.classList.add('hidden');
        }
      });
    });
  </script>
     
     
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
