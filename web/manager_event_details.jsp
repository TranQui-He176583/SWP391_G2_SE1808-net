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


               <div style="display: flex; ">
                    
                    <a href="add_Task?eventid=${requestScope.e.getId()}&clubid=${requestScope.club_id}" ">
                        <button style="width: 100px; height: 40px; border-radius: 5px;
                                background: #2196f3;border: none">Add Task</button>
                    </a>
                        
                   <a style="margin-left: 20px" >
                        <form action="task_List" method="Post">
                            <input type="hidden" name="club_id" value="${requestScope.club_id}">
                            <input type="hidden" name="event_id" value="${requestScope.e.getId()}">
                            <input type="hidden" name="search" value="">
                            <input type="hidden" name="cPage" value="1">
                            <button type="submit" style="width: 100px; height: 40px; border-radius: 5px;
                                    background: #2196f3;border: none">Task List</button>
                        </form>
                            
                    </a>
                             <a style="margin-left: 20px" href="edit_Event?id=${requestScope.e.getId()}">
                <button type="submit" style="width: 100px; height: 40px; border-radius: 5px;
                                    background: #2196f3;border: none">Edit Event</button>
                </a>
                 <form style="margin-left: 20px" id="delete-form" method="post" action="event_Delete">
                     <input type="hidden" id="record-id" name="event_id" value="${requestScope.e.getId()}">  
  <button type="button" onclick="confirmDelete(1, 'Bản ghi 1')" style="width: 100px; height: 40px; border-radius: 5px;
                                    background: #2196f3;border: none" >Delete</button>
                    </form>
             </div>    
   <script>
function confirmDelete(recordId, recordName) {
  if (confirm("Bạn có chắc chắn muốn xóa Event này không?")) {
    document.getElementById('delete-form').submit();
  } else {
    console.log("Hủy bỏ thao tác xóa");
  }
}
</script>             
                    
                
                    <h4 style="">${requestScope.e.getName()}</h4>                 

                            <img style="width:90%; height: 80% " src="${requestScope.e.getAvatar()}" >
                            <p style="margin-top: 5%"> ${requestScope.e.getDetails()} </p>


                        </div>
                    </div>
                </body>
                </html>
                <script src="assets/js/bootstrap.bundle.min.js"></script>
                <!-- simplebar -->
                <script src="assets/js/simplebar.min.js"></script>
                <!-- Icons -->
                <script src="assets/js/feather.min.js"></script>
                <!-- Main Js -->
                <script src="assets/js/app.js"></script>

                <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
                <script src="./assets/js/popper.min.js"></script>
                <script src="./assets/js/bootstrap.min.js">

                </script>