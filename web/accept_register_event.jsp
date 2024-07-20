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
<meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min_1.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css">
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>
.dropdown-item:hover {
    color: #007bff !important;
  }
               .preview-box {
  width: 180px;
  height: 180px;
  margin-left: 80px;
  background-color: #f8f9fa;
  border-radius: 100%; /* Add this line to round the corners */
}

#preview-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 100%; /* Add this line to round the corners of the image */
}

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
  .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 999;
        }

        .notification-content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            position: relative;
        }

        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        .close-button1 {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
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
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="page-wrapper doctris-theme toggled">
      <%@include file="commonFunction/header_manager.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_manager1.jsp"%>

    <body>
        <div class="container-fluid">
            <div class="layout-specing">
       
         <h2 style="text-align: center; font-size: 50px; font-family: sans-serif ">Register Event</h2>
         <div style="display: flex; justify-content: space-between">  
       <div style=" height: 35px; font-size: 15px; margin-top: 10px; margin-left: 2%">
             <form action="manage_registerEvent" id="selectClub" onchange="submitForm()" method="get" >
                    <input type="hidden" name="event_id" value="${requestScope.cE}">
                    <input type="hidden" name="cPage" value="1">                  
                    <label style="border: 1px solid; background:lightblue; border-radius: 5px;width: 120px; height: 25px; padding:  " for="options">Select Club:</label>
                    <select style="color:lightblue;height: 25px; padding: 0px" id="options" name="club_id">

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
                     <div style=" height: 35px; font-size: 15px; margin-top: 15px; margin-right: 2%">
                <form id="selectEvent" onchange="submit()" action="manage_registerEvent" method="get">             
                    <input type="hidden" name="cPage" value="1">
                    <input type="hidden" name="club_id" value="${requestScope.club_id}">                   
                    <label style="border: 1px solid; background:lightblue; border-radius: 5px;width: 120px; height: 25px; padding: 0px " for="options">Select Event:</label>
                    <select style="color:black;height: 25px; padding: 0px; width: 200px;" id="options" name="event_id">
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
          <c:if test="${requestScope.type == 1}">                  
                    <script>
                      window.onload = function() {
                      showNotificationOverlay();
                                                     };
                     </script>
          </c:if>
          <c:if test="${requestScope.type == 2}">      
                
                    <script>
                      window.onload = function() {
                      showNotificationOverlay1();
                                                     };
                     </script>
          </c:if>            
      <div id="notification-overlay" class="overlay">
        <div class="notification-content">
            <span class="close-button">&times;</span>
            <h3>Notification</h3>
            <p>Accept Complete.</p>
        </div>
    </div>
                     
     <div id="notification-overlay1" class="overlay">
        <div class="notification-content">
            <span class="close-button1">&times;</span>
            <h3>Notification</h3>
            <p>Reject Complete.</p>
        </div>
    </div>
                   
      <script>
        const notificationOverlay = document.getElementById('notification-overlay');
        const closeButton = document.querySelector('.close-button');
        
        

        function showNotificationOverlay() {
            notificationOverlay.style.display = 'flex';
        }

        function hideNotificationOverlay() {
            notificationOverlay.style.display = 'none';
        }
        closeButton.addEventListener('click', hideNotificationOverlay);
        notificationOverlay.addEventListener('click', (event) => {
            if (event.target === notificationOverlay) {
                hideNotificationOverlay();
            }
        });

        const notificationOverlay1 = document.getElementById('notification-overlay1');
        const closeButton1 = document.querySelector('.close-button1');

        function showNotificationOverlay1() {
            notificationOverlay1.style.display = 'flex';
        }

        function hideNotificationOverlay1() {
            notificationOverlay1.style.display = 'none';
        }
        closeButton1.addEventListener('click', hideNotificationOverlay1);
        notificationOverlay1.addEventListener('click', (event) => {
            if (event.target === notificationOverlay1) {
                hideNotificationOverlay1();
            }
        });

    </script>
  
                     
                    
                    
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
  </div> 
  </div> 
    </body>
     
</html>
<script 
        <script src="assets/js/app.js"></script>
        
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        
        <script src="./assets/js/bootstrap.min.js">
            
        </script>