<%-- 
    Document   : task_details
    Created on : Jun 16, 2024, 1:58:41 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
<link rel="stylesheet" href="assets/css/task_details.css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <div style="position: relative;">
  <img style="margin-top: 110px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Task Details</div>
</div>
    </head>
    <body>
        <div style="margin-top: 20px; margin-left: 260px;">
  <a href="task_List">
    <button style="font-size: 16px; padding: 8px 16px; background: #f05123;border-radius: 5px;border: #f05123">Back</button>
  </a>
</div>
  <div class="containerr">
   
    <div class="task-details">
      <div>
        <label>Name:</label>
        <p>${requestScope.name}</p>
      </div>
      <div>
        <label>Status:</label>
        <p class="status-in-progress">${requestScope.status}</p>
      </div>
      <div>
        <label>Start Time:</label>
        <p>${requestScope.start}</p>
      </div>
      <div>
        <label>End Time:</label>
        <p>${requestScope.end}</p>
      </div>
      
      <div>
        <label>Event:</label>
        <a href="event_Details?id=${requestScope.eventid}">
            <p>${requestScope.event}</p>
        </a>
      </div>
        
        <div>
        <label>Club:</label>
        <a href="club_detail?id=${requestScope.clubid}">
            <p>${requestScope.club}</p>
        </a>
      </div>
        
    </div>
    <div class="task-description">
      <h2>Details</h2>
      <p>${requestScope.details}</p>
    </div>
    <div class="task-note">
      <h2>Note</h2>
      <p>${requestScope.note}</p>
    </div>
  </div>
</body>
</html>
<%@include file="commonFunction/footer.jsp" %>