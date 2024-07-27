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
                                                        
                                                        <option value="3" data-href="${pageContext.request.contextPath}/role?xRoleId=3" ${param.xRoleId eq '3' ? 'selected' : ''}>normalUser</option>
                                                        
                                                    </select>
                                                        <div class="select-arrow"></div>
                                                </div>
                                            </div>
                                            
                                            
                                               
                                </div>
                                                    <div class="col-sm-12 col-md-5" style="padding-left: 460px">
                                                        <div class="justify-content-md-end"style="display: flex;padding-left: 30px">
                                    <form action="searchUser" method="post" style="display: flex; align-items: center;">
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
                                                    
                                                    <a href="detailUser?uid=${o.id}" class="btn btn-icon btn-pills btn-soft-primary" style="margin: 0px 5px"><i class="uil uil-eye"></i> </a>
                                                    <c:if test="${o.status == 0}">
                                                    <a href="deleteUser?id=${o.id}&status=1" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-check-circle text"></i></a>
                                                    </c:if>
                                                    <c:if test="${o.status == 1}">
                                                    <a href="deleteUser?id=${o.id}&status=0" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-multiply text"></i></a>
                                                    </c:if>
                                                  
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
            
           
        </div>
        <!-- Offcanvas End -->

        <!-- Modal start -->
        <!-- Add New Appointment Start -->
        <div class="modal fade" id="appointmentform" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
             <div class="modal-dialog modal-lg modal-dialog-centered">
                 
                <div class="modal-content" style="background: aliceblue">
                    <div class="form-add" style="padding: 20px">

           <form action="add_User" method="post">
               <div class="modal-header border-bottom p-3">
                    <h5 class="modal-title" id="exampleModalLabel">Add User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="row">
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Name</label>
                            <input type="text" class="form-control" name="fullname" id="fullname" value="${fullname}" minlength="1" maxlength="25" required="required" >
                        </fieldset>
                        <p style="color: red; font-size: 15px">${requestScope.wrongName}</p>
                    </div>
                     <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Password</label>
                            <input type="text" class="form-control" name="password" id="password" value="${password}" minlength="6" maxlength="20" required="required">
                        </fieldset>
                        
                    </div>
                </div>
                    <div class="row">
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Email</label>
                            <input type="text" class="form-control" name="email" id="email" value="${email}" minlength="11" maxlength="30" required="required">
                        </fieldset>
                        <p style="color: red; font-size: 15px">${requestScope.wrongRegister}</p>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black;font-weight: bold"> Phone</label>
                            <input type="text" class="form-control" name="phone" id="phone" value="${phone}" minlength="1" maxlength="10">
                        </fieldset>
                        <p style="color: red; font-size: 15px">${requestScope.wrongPhone}</p>
                    </div>
                    </div>
                
                
                <div class="row">
                  
                    <div class="col-md-6">
                        <fieldset class="form-group">
                            <label style="color: black; font-weight: bold">Role</label>
                          <div class="context-gender" style="display: flex;margin-top: 10px">
    <div style="display: flex; align-items: center;padding-right: 20px">
        <input value="1" type="radio"  name="roleId" style="font-size: 10px;  margin-right: 10px">
        Admin
    </div>
    
    <div style="display: flex; align-items: center;">
        <input value="3" type="radio"  name="roleId" style="font-size: 10px;  margin-right: 10px" checked="">
        NormalUser
    </div>
</div>
                        </fieldset>
                    </div>
                    <div class="col-md-6">
                        <fieldset class="form-group">
                             <label style="color: black; font-weight: bold">Status</label>
                          <div class="context-status" style="display: flex; margin-top: 10px">
    
    <div style="display: flex; align-items: center;padding-right: 20px">
        <input  value="1" type="radio"  name="status" style="font-size: 10px;  margin-right: 10px" checked>
        active
    </div>
    
    <div style="display: flex; align-items: center;">
        <input  value="0" type="radio"  name="status" style="font-size: 10px;  margin-right: 10px">
        block
    </div>
</div>
                        </fieldset>
                    </div>
                </div>
              <div style="margin-left: 650px">
    
    <div class="text-center">
        <button type="submit" class="btn btn-success" style="font-weight: bold">ADD</button>
    </div>
</div>
            </form>
                
        </div>
                </div>
             </div>
        </div>
        
        
        
        
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