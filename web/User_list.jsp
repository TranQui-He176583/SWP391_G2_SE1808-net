<%-- 
    Document   : Home
    Created on : May 10, 2024, 9:37:57 PM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <!-- Select2 -->
        <link href="assets/css/select2.min.css" rel="stylesheet" />
        <!-- Date picker -->
        <link rel="stylesheet" href="assets/css/flatpickr.min.css">
        <link href="assets/css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/css/list.css">
  <style>
      .select-arrow {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #333;
}
  </style>
    </head>

    <body>
        <!-- Loader -->
       
    
        <div class="page-wrapper doctris-theme toggled">
         <%@include file="commonFunction/header_db.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_db_1.jsp"%>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                            <div class="col-xl-9 col-lg-6 col-md-4">
                                <h5 class="mb-0">User List</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="dboard">Dashboard</a></li>
                                      
                                        <li class="breadcrumb-item active" aria-current="page">User</li>
                                    </ul>
                                </nav>
                            </div><!--end col-->
                            <div class="col-sm-12 col-md-5" style="display: flex">
                               
                                <div class="col-sm-12 col-md-5" style="padding-top: 10px">
                                                <div class="mb-0 position-relative">
                                                    <select class="form-control time-during select2input" onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');">
                                                      <option value=""  data-href="countUser">Status</option>
                                                      <option value="1" data-href="${pageContext.request.contextPath}/status?xStatus=1" ${param.xStatus == '1' ? 'selected' : ''}>active</option>
                                                      <option value="0" data-href="${pageContext.request.contextPath}/status?xStatus=0" ${param.xStatus == '0' ? 'selected' : ''}>block</option>
                                                      
                                                    </select>
                                                      <div class="select-arrow"></div>
                                                </div>
                                            </div>
                                           
                                             <div class="col-sm-12 col-md-5" style="padding-top: 10px">
                                                <div class="mb-0 position-relative">
                                                    <select class="form-control time-during select2input"onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');">
                                                        <option value=""  data-href="countUser">Role</option>
                                                        <option value="1" data-href="${pageContext.request.contextPath}/role?xRoleId=1" ${param.xRoleId eq '1' ? 'selected' : ''}>Admin</option>
                                                        <option value="2" data-href="${pageContext.request.contextPath}/role?xRoleId=2" ${param.xRoleId eq '2' ? 'selected' : ''}>manager</option>
                                                        <option value="3" data-href="${pageContext.request.contextPath}/role?xRoleId=3" ${param.xRoleId eq '3' ? 'selected' : ''}>normalUser</option>
                                                        
                                                    </select>
                                                        <div class="select-arrow"></div>
                                                </div>
                                            </div>
                                            
                                            
                                               
                                </div>
                                                    <div class="col-sm-12 col-md-5" style="padding-left: 460px">
                                                        <div class="justify-content-md-end"style="display: flex;padding-left: 30px">
                                    <form action="countUser" method="post" style="display: flex; align-items: center;">
    <div class="search-wrapper" style="position: relative;">
      <input type="text" name="search" placeholder="search here" style="padding-left: 30px;border-radius: 10px;font-size: 15px">
      <i class="fas fa-search" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);"></i>
    </div>
                                        </form>
    <div class="d-grid" style="margin-left: 20px">
      <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#appointmentform"style="height: 35px;width: 130px">ADD NEW</a>
    </div>
    

  
                                </div>
                            </div>
                        </div>
                        
        <div class="row">
        <div class="content-table">
           
            <table class="table table-striped table-hover">
                <thead>
                   
                   <tr>
                        <th>STT</th>	
                        <th>Name</th>	
                        <th>Role</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr> 
                                   
                </thead> 
               <tbody>
                   
                   <c:if test="${not empty listUs}">
                      <c:set var="count" value="0" />
                         <c:forEach items="${listUs}" var="o">
                            <c:set var="count" value="${count + 1}" />
               
                            <tr>
                            <td class="py-4">${count}</td>
                           
                            <td class="py-4">${o.fullname}</td>
                         
                            <td class="py-4">
                                 <c:choose>
                                        <c:when test="${o.roleId == 1}">
                                          <span class="text-primary">Admin</span>
                                        </c:when>
                                        <c:when test="${o.roleId == 2}">
                                          <span class="text-primary">Manager</span>
                                        </c:when>
                                        <c:when test="${o.roleId == 3}">
                                          <span class="text-primary">NormalUser</span>
                                        </c:when>
                                    </c:choose>
                            </td>
                            <td class="py-4">${o.email}</td>
                            <td class="py-4">${o.phone}</td>
              
                        
                                               <c:if test="${o.status == 1}">
                                                   <td class="py-3"><span class="badge bg-soft-success fs-6" style="margin-top: 5px">active</span></td>
                                                </c:if>
                                                <c:if test="${o.status == 0}">
                                                    <td class="py-3"><span class="badge bg-soft-danger fs-6" style="margin-top: 5px">block</span></td>
                                                </c:if>
                                                    <td class="text-end py-3" style="display: flex;">
                                                    
                                                    <a href="detailUser?uid=${o.id}" class="btn btn-icon btn-pills btn-soft-primary"><i class="uil uil-eye"></i> </a>
                                                    <a href="deleteUser?id=${o.id}&status=1" class="btn btn-icon btn-pills btn-soft-success" style="margin: 0px 5px"><i class="uil uil-check-circle text"></i></a>
                                                    <a href="deleteUser?id=${o.id}&status=0" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-multiply text"></i></a>
                                                  
                                                </td>
    
        </tr>
               
                  </c:forEach>
                 </c:if>
                    <c:if test="${empty listUs}">
                        <tr>
                           <td colspan="7">
                              <div class="alert alert-danger text-center">There are no users</div>
                           </td>
                        </tr>
                    </c:if>
                    </tbody>
            </table>
          
          
            
            <div class="row text-center" style="">
                            <!-- PAGINATION START -->
                             <div class="clearfix" style="padding-bottom: 10px;
    font-size: 20px;">
  <ul class="pagination justify-content-center" id="pagination">
    <li class="page-item ${tag == 1 ? 'disabled' : ''}">
      <a class="page-link" href="countUser?index=${tag - 1}">Previous</a>
    </li>
    <c:forEach begin="1" end="${mPage}" var="i">
      <li class="page-item ${tag == i ? 'active' : ''}">
        <a class="page-link" href="countUser?index=${i}">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item ${tag == mPage ? 'disabled' : ''}">
      <a class="page-link" href="countUser?index=${tag + 1}">Next</a>
    </li>
  </ul>
</div>
                            <!-- PAGINATION END -->
                        </div><!--end row-->
        </div>
 </div>



                        </div><!--end row-->

<!--                        <div class="row text-center">
                             PAGINATION START 
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <span class="text-muted me-3">Showing 1 - 10 out of 50</span>
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Previous">Prev</a></li>
                                        <li class="page-item active"><a class="page-link" href="javascript:void(0)">1</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0)" aria-label="Next">Next</a></li>
                                    </ul>
                                </div>
                            </div>end col
                             PAGINATION END 
                        </div>end row-->
                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                
                <!-- End -->
            
            <!--End page-content" -->
        
        <!-- page-wrapper -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src="../assets/images/logo-dark.png" height="24" class="light-version" alt="">
                    <img src="../assets/images/logo-light.png" height="24" class="dark-version" alt="">
                </h5>
                <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
            </div>
            <div class="offcanvas-body p-4 px-md-5">
                <div class="row">
                    <div class="col-12">
                        <!-- Style switcher -->
                        <div id="style-switcher">
                            <div>
                                <ul class="text-center list-unstyled mb-0">
                                    <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="../assets/images/layouts/light-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="../assets/images/layouts/dark-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="../assets/images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                    <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="../assets/images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                    <li class="d-grid"><a href="../landing/index.html" target="_blank" class="mt-4"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div><!--end col-->
                </div><!--end row-->
            </div>

           
        </div>
        <!-- Offcanvas End -->

        <!-- Modal start -->
        <!-- Add New Appointment Start -->
        <div class="modal fade" id="appointmentform" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
             <div class="modal-dialog modal-lg modal-dialog-centered">
                 
                <div class="modal-content" style="background: aliceblue">
                    <div class="form-add" style="padding: 20px">

           <form action="add" method="post">
               <div class="modal-header border-bottom p-3">
                    <h5 class="modal-title" id="exampleModalLabel">Add User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Name</label>
                            <input type="text" class="form-control" name="fullname" id="fullname" placeholder="fullname" minlength="1" maxlength="25" required="required" >
                        </fieldset>
                    </div>
                     <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Password</label>
                            <input type="text" class="form-control" name="password" id="password"  placeholder="password" minlength="6" maxlength="20" required="required">
                        </fieldset>
                    </div>
                </div>
                    <div class="row">
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Email</label>
                            <input type="text" class="form-control" name="email" id="email" placeholder="email" minlength="11" maxlength="30" required="required">
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Phone</label>
                            <input type="text" class="form-control" name="phone" id="phone" placeholder="phone" minlength="1" maxlength="10">
                        </fieldset>
                    </div>
                    </div>
                
                
                <div class="row">
                  
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black; font-weight: bold">Role</label>
                          <div class="context-gender" style="display: flex;">
    <div style="display: flex; align-items: center;padding-right: 20px">
        <input value="1" type="radio"  name="roleId" style="font-size: 10px;  margin-right: 10px">
        Admin
    </div>
    <div style="display: flex; align-items: center;padding-right: 20px">
        <input value="2" type="radio"  name="roleId" style="font-size: 10px;  margin-right: 10px">
        Manager
    </div>
    
    <div style="display: flex; align-items: center;">
        <input value="3" type="radio"  name="roleId" style="font-size: 10px;  margin-right: 10px">
        NormalUser
    </div>
</div>
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="form-group">
                             <label style="color: black; font-weight: bold">Status</label>
                          <div class="context-status" style="display: flex;">
    
    <div style="display: flex; align-items: center;padding-right: 20px">
        <input  value="1" type="radio"  name="status" style="font-size: 10px;  margin-right: 10px" checked>
        active
    </div>
    
    <div style="display: flex; align-items: center;">
        <input  value="2" type="radio"  name="status" style="font-size: 10px;  margin-right: 10px">
        block
    </div>
</div>
                        </fieldset>
                    </div>
                </div>
              <div style="display: flex; align-items: center; justify-content: space-between;">
    <p style="color: red; font-size: 15px">${requestScope.wrongRegister}</p>
    <div class="text-center">
        <button type="submit" class="btn btn-success" style="font-weight: bold">ADD</button>
    </div>
</div>
            </form>
                
        </div>
                </div>
             </div>
        </div>
        <!-- Add New Appointment End -->

        <!-- View Appintment Start -->
        <div class="modal fade" id="viewappointment" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1">Appointment Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="d-flex align-items-center">
                            <img src="../assets/images/client/01.jpg" class="avatar avatar-small rounded-pill" alt="">
                            <h5 class="mb-0 ms-3">Howard Tanner</h5>
                        </div>
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li>
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Age:</h6>
                                        <p class="text-muted ms-2">25 year old</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Gender:</h6>
                                        <p class="text-muted ms-2">Male</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6 class="mb-0">Department:</h6>
                                        <p class="text-muted ms-2 mb-0">Cardiology</p>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Date:</h6>
                                        <p class="text-muted ms-2">20th Dec 2020</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Time:</h6>
                                        <p class="text-muted ms-2">11:00 AM</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6 class="mb-0">Doctor:</h6>
                                        <p class="text-muted ms-2 mb-0">Dr. Calvin Carlo</p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- View Appintment End -->

        <!-- Accept Appointment Start -->
        <div class="modal fade" id="acceptappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Accept Appointment</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                                <div class="mt-4">
                                    <a href="#" class="btn btn-soft-success">Accept</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Accept Appointment End -->

        <!-- Cancel Appointment Start -->
        <div class="modal fade" id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-times-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Cancel Appointment</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                                <div class="mt-4">
                                    <a href="#" class="btn btn-soft-danger">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cancel Appointment End -->
        <!-- Modal end -->
        
        <!-- javascript -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Select2 -->
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/select2.init.js"></script>
        <!-- Datepicker -->
        <script src="assets/js/flatpickr.min.js"></script>
        <script src="assets/js/flatpickr.init.js"></script>
        <!-- Datepicker -->
        <script src="assets/js/jquery.timepicker.min.js"></script> 
        <script src="assets/js/timepicker.init.js"></script> 
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
         <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
    </body>

</html>