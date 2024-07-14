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
<style>
  body {
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
  }

  .containerr {
    max-width: 80%;
    margin: 40px auto;
    padding: 30px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  }

  .task-details {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    grid-gap: 30px;
    margin-bottom: 30px;
  }

  .task-details > div {
    border-bottom: 1px solid #ddd;
    padding-bottom: 15px;
  }

  .task-details label {
    font-weight: bold;
    margin-right: 10px;
    color: #333;
  }

  .task-details p {
    margin: 0;
    color: #555;
  }

  .status-in-progress {
    color: #4CAF50;
    font-weight: bold;
  }

  .task-description, .task-note {
    margin-top: 30px;
    padding-top: 30px;
    border-top: 1px solid #ddd;
  }

  .task-description h2, .task-note h2 {
    margin-top: 0;
    color: #333;
  }

  .task-description p, .task-note p {
    color: #555;
  }

  a {
    color: #2196F3;
    text-decoration: none;
  }
  button {
    background-color: #2196F3;
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
  }


  :root {
    --primary-color: #4CAF50;
    --secondary-color: #2196F3;
    --accent-color: #FFA000;
  }

  .task-details label {
    color: var(--primary-color);
  }

  .status-in-progress {
    color: var(--primary-color);
  }

  .task-description h2, .task-note h2 {
    color: var(--accent-color);
  }

  button {
    background-color: var(--secondary-color);
  }

  button:hover {
    background-color: #1565C0;
  }
</style>
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
        <div style="display: flex">
        <div style="margin-top: 20px; margin-left: 10%;">
  <a href="javascript:history.back()">
  <button style="font-size: 16px; padding: 8px 16px; background: #f05123;border-radius: 5px;border: #f05123">Back</button>
</a>
        </div>
       <c:if test="${requestScope.role == true}"> 
        <div style="margin-top: 20px; margin-left: 70%;">
            <a href="task_Update?task_id=${requestScope.id}">
  <button style="font-size: 16px; padding: 8px 16px; background: #f05123;border-radius: 5px;border: #f05123">Update</button>
</a>
        </div>
    </c:if>
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
        <label>Deadline:</label>
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