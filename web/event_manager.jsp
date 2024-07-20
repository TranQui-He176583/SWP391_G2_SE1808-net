<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import = "Model.*" %>
<%@page import = "Model.Task.*" %>
<%@page import = "java.util.*" %>
<link rel="stylesheet" href="assets/css/task_list.css"/>
<!DOCTYPE html>
<html lang="en">

    <head>
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
        </style>
        
  <%
   List<Event> eList = (List<Event>)request.getAttribute("eList");
   List<Club> cList = (List<Club>)request.getAttribute("cList");
   int nPage = (int)request.getAttribute("nPage");
   String search = (String)  request.getAttribute("search");
   int club_id = (int) request.getAttribute("club_id");
  %>      
        
    </head>

    <body>
        <!-- Loader -->
    <div class="page-wrapper doctris-theme toggled">
      <%@include file="commonFunction/header_manager.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_manager1.jsp"%>

    <body>
        <div class="container-fluid">
            <div class="layout-specing">
                <h2 style="text-align: center">Manager Event</h2>   
                <div style="display: flex">    
            
             <div class="search-bar p-0 d-none d-md-block ms-2">
                 <div style="width: 100%" id="search" class="menu-search mb-0">
                                    <form role="search" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords..." value="<%=search%>">
                                             <input type="hidden" name ="club_id" value="<%=club_id%>">
                                            <input type="hidden" name ="cPage" value="1">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div> 
                                            
                  
        
           <div style="margin-left: 50%; height: 40px; font-size: 15px;">   
             <form id="selectClub" onchange="submitForm()">
                     <input type="hidden" name="cPage" value="1">
                    <input type="hidden" name ="search"value="${requestScope.search}" >
                    <label style="border: 1px solid; background:lightblue; border-radius: 5px;width: 120px; height: 25px; padding: 0px " for="options">Select Club:</label>
                        <select style="color:black;height: 25px; padding: 0px" id="options" name="club_id">

                        <option value="0"> All Club</option> 
                        <%   for (int i=0;i<(cList.size());i++) { 
                               if (cList.get(i).getId() == club_id ) {
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
                                                
                                            </div>
                          
                
               <table  id="manager-register-event-table">
  <thead>
    <tr>
      <th style="text-align: center;">Event</th>
      <th style="text-align: center;">Avatar</th>      
      <th style="text-align: center;">Time</th>
      <th style="text-align: center;">Location</th>
      
    </tr>
  </thead>
  <tbody> 
      
     <%
       if (eList == null) {} else {  
        for (int i =0; i <eList.size();i++) {
     %>  

    <tr onclick="window.location.href='manager_event_details?event_id=<%=eList.get(i).getId()%>'">
  
        <td style="text-align: left"> <%=eList.get(i).getName()%> </td>
        
        <td> <img src="<%=eList.get(i).getAvatar()%>" class="avatar avatar-md-sm rounded-circle shadow"> </td>
        
       
      
        
  
      
      <td  style="text-align: center; font-size:14px "> <%=eList.get(i).getDate()%>  </td>
      <td  style="text-align: center; font-size:14px "> <%=eList.get(i).getLocation()%>  </td>
      <%}}%>
      
    </tr>
    
</a>
  </tbody>
</table>
        <div style="text-align: center">
   <% for (int i = 1; i <= nPage; i++) { %>
  <form style="display: inline-block;" action="manager_event" method="get">
      <input type="hidden" name ="s" value="<%=search%>">
      <input type="hidden" name ="cPage" value="<%=i%>">
    <button style="font-size: 15px; margin-left: 7px; border: 2px solid lightblue; padding: 7px; color: black; background: white;width: 40px"><%=i%></button>
  </form>
  <% } %>
  </div> 
                
            </div>
        </div>
    </body>
</html>

        <script src="assets/js/app.js"></script>
        