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
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- SLIDER -->
        <link href="assets/css/tiny-slider.css" rel="stylesheet" />
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>
   
    <body>
        <!-- Loader -->
        
        <!-- Loader -->

        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper"style="background: aliceblue;">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand" style="font-size: 20px;background: white;">
                        <a style="text-align: center" href="Home"><img src="assets/img/logo/logofpt.png" alt="" width ="50%" height="50%">
                  
                        </a>
                    </div>
                    
                    <ul class="sidebar-menu pt-3">
                        <li><a href="dboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                    

                       <li class="sidebar-dropdown">
    <a href="javascript:void(0)"><i class="uil uil-table me-2 d-inline-block"></i>Table</a>
    <div class="sidebar-submenu">
        <ul>
            <li>
                <a href="javascript:void(0)">Club</a>
                <div class="sidebar-submenu">
                    <ul>
                        <li><a href="dr-profile.html">List</a></li>
                        <li><a href="dr-profile.html">Detail</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="dr-profile.html">Event</a></li>
        </ul>
    </div>
</li>
                       

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-setting me-2 d-inline-block"></i>Setting</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="javascript:void(0)"><i class="uil uil-user me-2 d-inline-block"></i> User</a>
                                        <div class="sidebar-submenu">
                                        <ul>
                                            <li><a href="countUser">User </a></li>
                                            <li><a href="detailUser">User Detail</a></li>
                                        </ul>
                                        </div>
                                    </li>
                                  <li>
                                        <a href="javascript:void(0)"><i class="uil uil-club me-2 d-inline-block"></i>Club</a>
                                        <div class="sidebar-submenu">
                                        <ul>
                                            <li><a href="clubdb">Club</a></li>
                                            <li><a href="clubdetaildb">Club Detail</a></li>
                                        </ul>
                                        </div>
                                   </li>
                                   <li>
                                        <a href="javascript:void(0)"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs</a>
                                        <div class="sidebar-submenu">
                                        <ul>
                                            <li><a href="blogdb">Blog</a></li>
                                            <li><a href="blogdetaildb">Blog Detail</a></li>
                                        </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        

<!--                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-apps me-2 d-inline-block"></i>Apps</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="chat.html">Chat</a></li>
                                    <li><a href="email.html">Email</a></li>
                                    <li><a href="calendar.html">Calendar</a></li>
                                </ul>
                            </div>
                        </li>-->

<!--                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-shopping-cart me-2 d-inline-block"></i>Pharmacy</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="shop.html">Shop</a></li>
                                    <li><a href="product-detail.html">Shop Detail</a></li>
                                    <li><a href="shopcart.html">Shopcart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                </ul>
                            </div>
                        </li>-->

<!--                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="blogs.html">Blogs</a></li>
                                    <li><a href="blog-detail.html">Blog Detail</a></li>
                                </ul>
                            </div>
                        </li>-->

                    </ul>
                    <!-- sidebar-menu  -->
                </div>
                <!-- sidebar-content  -->
<!--                <ul class="sidebar-footer list-unstyled mb-0">
                    <li class="list-inline-item mb-0 ms-1">
                        <a href="#" class="btn btn-icon btn-pills btn-soft-primary">
                            <i class="uil uil-comment icons"></i>
                        </a>
                    </li>
                </ul>-->
            </nav>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">
                <div class="top-header">
                    <div class="header-bar d-flex justify-content-between border-bottom"style="background: aliceblue;">
                        <div class="d-flex align-items-center">
                            <a href="#" class="logo-icon">
                                <img src="assets/images/logo-icon.png" height="30" class="small" alt="">
                                <span class="big">
                                    <img src="assets/images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                    <img src="assets/images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                                </span>
                            </a>
                            <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                                <i class="uil uil-bars"></i>
                            </a>
                            <div class="search-bar p-0 d-none d-md-block ms-2">
                                <div id="search" class="menu-search mb-0">
                                    <form role="search" method="get" id="searchform" class="searchform">
                                        <div>
                                            <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords...">
                                            <input type="submit" id="searchsubmit" value="Search">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
        
                        <ul class="list-unstyled mb-0">
<!--                            <li class="list-inline-item mb-0 ms-1">
                                <a href="login" >
                                    <div class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="home" class="bx bx-home"></i></div>
                                </a>
                            </li>-->
                            

                            <li class="list-inline-item mb-0 ms-1">
                                <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                    <div class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                                </a>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-icon btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="mail" class="fea icon-sm"></i></button>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">4 <span class="visually-hidden">unread mail</span></span>
                                    
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow rounded border-0 mt-3 px-2 py-2" data-simplebar style="height: 320px; width: 300px;">
                                        <a href="#" class="d-flex align-items-center justify-content-between py-2">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="assets/images/client/02.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Janalia</b> <small class="text-muted fw-normal d-inline-block">1 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="assets/images/client/Codepen.svg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>codepen</b>  <small class="text-muted fw-normal d-inline-block">4 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="assets/images/client/03.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Cristina</b> <small class="text-muted fw-normal d-inline-block">5 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="assets/images/client/dribbble.svg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Dribbble</b> <small class="text-muted fw-normal d-inline-block">24 hour ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="assets/images/client/06.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Donald Aghori</b> <small class="text-muted fw-normal d-inline-block">1 day ago</small></small>
                                            </div>
                                        </a>

                                        <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                            <div class="d-inline-flex position-relative overflow-hidden">
                                                <img src="assets/images/client/07.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                                <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Calvin</b> <small class="text-muted fw-normal d-inline-block">2 day ago</small></small>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>

                            <li class="list-inline-item mb-0 ms-1">
                                                <div class="col-xl-10 col-lg-10 col-md-10">
                        <div class="menu-main d-flex align-items-center justify-content-end">
                            <!-- Main-menu -->
                           
                            
                        
                         <c:if test="${sessionScope.account.roleId != null}">                                  
                             <div class="image-container">
                             
                                 <c:if test="${sessionScope.account.image == null }">  
                                     
                                    <img style="width: 28px; margin-top: -10px" src="assets/img/avatar/Avatar1.png" class="img-fluid"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    </c:if>
                                    
                                    <c:if test="${sessionScope.account.image != null}">  
                                       
                                        <img style="width: 50px;height: 50px; margin-top: -10px;border-radius: 20px" src="${sessionScope.account.image}" class="img-fluid"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    </c:if>
                                    
                                        <div style="margin-top: 20px" class="dropdown-menu"> 
                                            
                                   <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="Profile">Information</a>
                                    <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="Change_Password">Change Password</a>
                                   <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="logout">Log Out</a>                           
                                </div>
                            </div>
                         </c:if>
                        </div>
                    </div>   
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <h5 class="mb-0">Dashboard</h5>

                        <div class="row" style="width: 155%;">
                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-user h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${cUser}</h5>
                                            <p class="text-muted mb-0">USER</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            
                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-club h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${cClub}</h5>
                                            <p class="text-muted mb-0">CLUB</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            
                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-star h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">${cEvent}</h5>
                                            <p class="text-muted mb-0">EVENT</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->
                            
                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-share h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">16000</h5>
                                            <p class="text-muted mb-0">SHARE</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div><!--end col-->
                            
<!--                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-medkit h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">220</h5>
                                            <p class="text-muted mb-0">Appointment</p>
                                        </div>
                                    </div>
                                </div>
                            </div>end col-->
                            
<!--                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-medical-drip h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">10</h5>
                                            <p class="text-muted mb-0">Operations</p>
                                        </div>
                                    </div>
                                </div>
                            </div>end col
                        </div>end row-->

<!--                        <div class="row">
                            <div class="col-xl-8 col-lg-7 mt-4">
                                <div class="card shadow border-0 p-4">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h6 class="align-items-center mb-0">Patients visit by Gender</h6>
                                        
                                        <div class="mb-0 position-relative">
                                            <select class="form-select form-control" id="yearchart">
                                                <option selected>2020</option>
                                                <option value="2019">2019</option>
                                                <option value="2018">2018</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="dashboard" class="apex-chart"></div>
                                </div>
                            </div>end col-->

<!--                            <div class="col-xl-4 col-lg-5 mt-4">
                                <div class="card shadow border-0 p-4">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h6 class="align-items-center mb-0">Patients by Department</h6>
                                        
                                        <div class="mb-0 position-relative">
                                            <select class="form-select form-control" id="dailychart">
                                                <option selected>Today</option>
                                                <option value="2019">Yesterday</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="department" class="apex-chart"></div>
                                </div>
                            </div>end col-->
                        </div><!--end row-->

                        <div class="row">
                            <div class="col-xl-4 col-lg-6 mt-4">
                                <div class="card border-0 shadow rounded">
                                    <div class="d-flex justify-content-between align-items-center p-4 border-bottom">
                                        <h6 class="mb-0"><i class="uil uil-user me-1 h5"></i>User</h6>
                                        <div class="clearfix">
                                        <ul class="pagination justify-content-center" id="pagination" style="font-size: 10px">
                                                 <li class="page-item ${tag == 1 ? 'disabled' : ''}">
                                                      <a class="page-link" href="dboard?index=${tag - 1}">&laquo</a>
                                                 </li>
                                                
                                                  <li class="page-item ${tag == mPage ? 'disabled' : ''}">
                                                    <a class="page-link" href="dboard?index=${tag + 1}">&raquo</a>
                                                 </li>
                                               </ul>
                                            </div>
                                            
                                      
                                    </div>
                                 
 
                                   <c:forEach items="${lisu}" var="lu">
                                       <ul class="list-unstyled mb-0 p-4">
                                        <li>                     
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-inline-flex">
                                                    <img src="${lu.image}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                                    <div class="ms-3">
                                                        <h6 class="text-dark mb-0 d-block">${lu.fullname}</h6>
                                                        <small class="text-muted">${lu.email}</small>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                      </c:forEach>
                                </div>
                            </div><!--end col-->

                           <div class="col-xl-4 col-lg-12 mt-4">
                                <div class="card border-0 shadow rounded">
                                    <div class="p-4 border-bottom">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h6 class="mb-0"><i class="uil uil-club me-1 h5"></i> Club</h6>
                                            
                                            <div class="mb-0 position-relative">
                                                <select class="form-select form-control" id="dailypatient">
                                                    <option selected>New</option>
                                                    <option value="2019">Old</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                  
                                    <ul class="list-unstyled mb-0 p-4" data-simplebar style="height: 355px;">
                                        <c:forEach items="${lisc}" var="lc">
                                            <li class="d-flex align-items-center justify-content-between" style="padding: 10px">
                                            <div class="d-flex align-items-center">
                                                <img src="${lc.avatar}" class="avatar avatar-small rounded-circle border shadow" alt="">
                                                <div class="flex-1 ms-3">
                                                    <span class="d-block h6 mb-0">${lc.name}</span>
                                                                
                                                </div>
                                            </div>

                                           
                                        </li>
                                         </c:forEach>
                                    </ul>
                                
                                </div>
                            </div><!--end col-->

                            <div class="col-xl-4 col-lg-12 mt-4">
                                <div class="card border-0 shadow rounded">
                                    <div class="p-4 border-bottom">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <h6 class="mb-0"><i class="uil uil-star me-1 h5"></i> Event</h6>
                                            
                                            <div class="mb-0 position-relative">
                                                <select class="form-select form-control" id="dailypatient">
                                                    <option selected>New</option>
                                                    <option value="2019">Old</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <ul class="list-unstyled mb-0 p-4" data-simplebar style="height: 355px">
                                        <c:forEach items="${lise}" var="let">
                                        <li class="d-flex align-items-center justify-content-between" style="padding: 10px">
                                          <div class="d-flex align-items-center">
                                              <div class="flex-1 ms-3 text-overflow-ellipsis white-space-nowrap" >
                                              <span class="d-block h6 mb-0">${let.name}</span>
                                           </div>
                                          </div>
                                              <div class="text-muted text-overflow-ellipsis white-space-nowrap text-end" > ${let.time}</div>
                                        </li>
                                       </c:forEach>
                                    </ul>
                                    
                                     
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        <!-- page-wrapper -->

        <!-- Offcanvas Start -->
        <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header p-4 border-bottom">
                <h5 id="offcanvasRightLabel" class="mb-0">
                    <img src="assets/images/logo-dark.png" height="24" class="light-version" alt="">
                    <img src="assets/images/logo-light.png" height="24" class="dark-version" alt="">
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
                                    <li class="d-grid"><a href="landing/index.html" target="_blank" class="mt-4"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div><!--end col-->
                </div><!--end row-->
            </div>

            <div class="offcanvas-footer p-4 border-top text-center">
                <ul class="list-unstyled social-icon mb-0">
                    <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                    <li class="list-inline-item mb-0"><a href="" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->
        
        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Chart -->
        <script src="assets/js/apexcharts.min.js"></script>
        <script src="assets/js/columnchart.init.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
    </body>

</html>