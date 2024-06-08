<%-- 
    Document   : MailBox
    Created on : Jun 7, 2024, 8:48:43 PM
    Author     : pc
--%>

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
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>

    <body>
       
        <div class="page-wrapper doctris-theme toggled">
            <nav id="sidebar" class="sidebar-wrapper"style="background: aliceblue;">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand" style="font-size: 20px;background: white;">
                        <a style="text-align: center"href="Home"><img src="assets/img/logo/logofpt.png" alt="" width ="50%" height="50%">
                       
                        </a>
                    </div>
                    
                    <ul class="sidebar-menu pt-3">
                        <li><a href="dboard"><i class="uil uil-dashboard me-2 d-inline-block"></i>Dashboard</a></li>
                        <li><a href="appointment.html"><i class="uil uil-user me-2 d-inline-block"></i>Profile</a></li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-table me-2 d-inline-block"></i>Table</a>
                            <div class="sidebar-submenu">
                                <ul>
                                   
                                    <li><a href="dr-profile.html">Club</a></li>
                                    <li><a href="dr-profile.html">Event</a></li>
                                </ul>
                            </div>
                        </li>
                         <li><a href="MailBox.jsp"><i class="uil uil-envelope me-2 d-inline-block"></i>MailBox</a></li>

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-setting me-2 d-inline-block"></i>Setting</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="countUser">Setting</a></li>
                                    <li><a href="detailUser">Setting Detail</a></li>
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

                        <li class="sidebar-dropdown">
                            <a href="javascript:void(0)"><i class="uil uil-flip-h me-2 d-inline-block"></i>Blogs</a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li><a href="blogs.html">Blogs</a></li>
                                    <li><a href="blog-detail.html">Blog Detail</a></li>
                                </ul>
                            </div>
                        </li>

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
                                <div class="dropdown dropdown-primary">
                                    <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../assets/images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                    <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                        <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                            <img src="assets/images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                            <div class="flex-1 ms-2">
                                                <span class="d-block mb-1">Calvin Carlo</span>
                                                <small class="text-muted">Orthopedic</small>
                                            </div>
                                        </a>
                                        
                                        <a class="dropdown-item text-dark" href="dr-profile.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                        <div class="dropdown-divider border-top"></div>
                                        <a class="dropdown-item text-dark" href="logout"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Email</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="dboard">DashBoard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Email</li>
                                </ul>
                            </nav>
                        </div>
                        
                        <div class="card rounded border-0 mt-4 overflow-hidden">
                            <div class="row g-1">
                                <div class="col-xl-2 col-lg-3 col-md-4 col-12">
                                    <div class="card rounded-0 border-0 shadow p-4">
                                        <a href="javascript:void(0)" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#compose-mail"><i class="uil uil-plus me-1"></i> Compose</a>

                                        <ul class="nav nav-pills nav-link-soft nav-justified flex-column mt-4 bg-white mb-0" id="pills-tab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link rounded active" id="inbox-tab" data-bs-toggle="pill" href="#inbox" role="tab" aria-controls="inbox" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-inbox h5 align-middle me-2 mb-0"></i> Inbox</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" id="starred-tab" data-bs-toggle="pill" href="#starred" role="tab" aria-controls="starred" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-star h5 align-middle me-2 mb-0"></i> Starred</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" id="spam-tab" data-bs-toggle="pill" href="#spam" role="tab" aria-controls="spam" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-times h5 align-middle me-2 mb-0"></i> Spam</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" id="send-tab" data-bs-toggle="pill" href="#sent" role="tab" aria-controls="sent" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-upload h5 align-middle me-2 mb-0"></i> Sent</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" id="drafts-tab" data-bs-toggle="pill" href="#drafts" role="tab" aria-controls="drafts" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-edit h5 align-middle me-2 mb-0"></i> Drafts</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" id="delete-tab" data-bs-toggle="pill" href="#delete" role="tab" aria-controls="delete" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-trash h5 align-middle me-2 mb-0"></i> Delete</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" id="notes-tab" data-bs-toggle="pill" href="#notes" role="tab" aria-controls="notes" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-notes h5 align-middle me-2 mb-0"></i> Notes</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                        </ul><!--end nav pills-->
                                    </div>
                                </div><!--end col-->

                                <div class="col-xl-10 col-lg-9 col-md-8 col-12 mt-4 mt-sm-0">
                                    <div class="tab-content rounded-0 shadow" id="pills-tabContent">
                                        <div class="tab-pane fade bg-white show active" id="inbox" role="tabpanel" aria-labelledby="inbox-tab">
                                            <div class="table-responsive bg-white shadow rounded">
                                                <table class="table mb-0 table-center">
                                                    <thead>
                                                        <tr>
                                                            <th class="border-bottom p-3" style="min-width: 15px;" scope="col">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkAll">
                                                                    <label class="form-check-label fw-normal" for="checkAll"></label>
                                                                </div>
                                                            </th>
                                                            <th class="border-bottom p-3" style="min-width: 15px;" scope="col">
                                                                <a href="#" class="text-muted"><i class="uil uil-redo"></i></a>
                                                            </th>
                                                            <th class="border-bottom p-3" style="min-width: 150px;" scope="col"></th>
                                                            <th class="border-bottom p-3" style="min-width: 750px;" scope="col"></th>
                                                            <th class="border-bottom p-3 text-end" style="min-width: 150px;" scope="col">
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-left icons"></i></a>
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-right icons"></i></a>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox1">
                                                                    <label class="form-check-label" for="checkbox1"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Amy Lucier</td>
                                                            <td class="p-3"><p class="text-muted mb-0">In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do.</p></td>
                                                            <td class="text-end class p-3"><small>17 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox2">
                                                                    <label class="form-check-label" for="checkbox2"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Tameika Whittle</td>
                                                            <td class="p-3"><p class="text-muted mb-0">The wise man therefore always holds in these matters to this principle of selection.</p></td>
                                                            <td class="text-end class p-3"><small>27 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox3">
                                                                    <label class="form-check-label" for="checkbox3"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Barbara Bayne</td>
                                                            <td class="p-3"><p class="text-muted mb-0">We denounce with righteous</p></td>
                                                            <td class="text-end class p-3"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox4">
                                                                    <label class="form-check-label" for="checkbox4"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Nita Griffin</td>
                                                            <td class="p-3"><p class="text-muted mb-0">In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do.</p></td>
                                                            <td class="text-end class p-3"><small>17 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox5">
                                                                    <label class="form-check-label" for="checkbox5"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Marc Flythe</td>
                                                            <td class="p-3"><p class="text-muted mb-0">The wise man therefore always holds in these matters to this principle of selection.</p></td>
                                                            <td class="text-end class p-3"><small>27 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox6">
                                                                    <label class="form-check-label" for="checkbox6"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Elaine Hannah</td>
                                                            <td class="p-3"><p class="text-muted mb-0">pain avoided.</p></td>
                                                            <td class="text-end class p-3"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox7">
                                                                    <label class="form-check-label" for="checkbox7"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Abraham Edwards</td>
                                                            <td class="p-3"><p class="text-muted mb-0">We denounce with righteous</p></td>
                                                            <td class="text-end class p-3"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox8">
                                                                    <label class="form-check-label" for="checkbox8"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Allie Smith</td>
                                                            <td class="p-3"><p class="text-muted mb-0">In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do.</p></td>
                                                            <td class="text-end class p-3"><small>17 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox9">
                                                                    <label class="form-check-label" for="checkbox9"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Eleanor Cisco</td>
                                                            <td class="p-3"><p class="text-muted mb-0">The wise man therefore always holds in these matters to this principle of selection.</p></td>
                                                            <td class="text-end class p-3"><small>27 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox10">
                                                                    <label class="form-check-label" for="checkbox10"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Troy Turk</td>
                                                            <td class="p-3"><p class="text-muted mb-0">pain avoided.</p></td>
                                                            <td class="text-end class p-3"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox11">
                                                                    <label class="form-check-label" for="checkbox11"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Tyron Elliott</td>
                                                            <td class="p-3"><p class="text-muted mb-0">We denounce with righteous</p></td>
                                                            <td class="text-end class p-3"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox12">
                                                                    <label class="form-check-label" for="checkbox12"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Betty Cook</td>
                                                            <td class="p-3"><p class="text-muted mb-0">We denounce with righteous</p></td>
                                                            <td class="text-end class p-3"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox13">
                                                                    <label class="form-check-label" for="checkbox13"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Doris Morrison</td>
                                                            <td class="p-3"><p class="text-muted mb-0">In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do.</p></td>
                                                            <td class="text-end class p-3"><small>17 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox14">
                                                                    <label class="form-check-label" for="checkbox14"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Chad Potter</td>
                                                            <td class="p-3"><p class="text-muted mb-0">The wise man therefore always holds in these matters to this principle of selection.</p></td>
                                                            <td class="text-end class p-3"><small>27 Jan 2021</small></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                                
                                            <p class="text-end text-muted mb-0 py-2 mx-2">See more 14 of 35</p>
                                        </div><!--end teb pane-->

                                        <div class="tab-pane fade bg-white rounded" id="starred" role="tabpanel" aria-labelledby="starred-tab">
                                            <div class="table-responsive">
                                                <table class="table mb-0 table-email table-center table-nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th class="border-bottom py-3" style="min-width: 15px;" scope="col">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkAll1">
                                                                    <label class="form-check-label fw-normal" for="checkAll1"></label>
                                                                </div>
                                                            </th>
                                                            <th class="border-bottom py-3" style="min-width: 15px;" scope="col">
                                                                <a href="#" class="text-muted"><i class="uil uil-redo"></i></a>
                                                            </th>
                                                            <th class="border-bottom py-3" style="min-width: 150px;" scope="col"></th>
                                                            <th class="border-bottom py-3" style="min-width: 750px;" scope="col"></th>
                                                            <th class="border-bottom py-3 text-end" style="min-width: 150px;" scope="col">
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-left icons"></i></a>
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-right icons"></i></a>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox16">
                                                                    <label class="form-check-label" for="checkbox16"></label>
                                                                </div>
                                                            </th>
                                                            <th><i class="uil uil-star text-muted"></i></th>
                                                            <td>Amy Lucier</td>
                                                            <td><p class="text-muted mb-0">In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do.</p></td>
                                                            <td class="text-end"><small>17 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox17">
                                                                    <label class="form-check-label" for="checkbox17"></label>
                                                                </div>
                                                            </th>
                                                            <th><i class="uil uil-star text-muted"></i></th>
                                                            <td>Tameika Whittle</td>
                                                            <td><p class="text-muted mb-0">The wise man therefore always holds in these matters to this principle of selection.</p></td>
                                                            <td class="text-end"><small>27 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox18">
                                                                    <label class="form-check-label" for="checkbox18"></label>
                                                                </div>
                                                            </th>
                                                            <th><i class="uil uil-star text-muted"></i></th>
                                                            <td>Barbara Bayne</td>
                                                            <td><p class="text-muted mb-0">We denounce with righteous</p></td>
                                                            <td class="text-end"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div><!--end teb pane-->

                                        <div class="tab-pane fade bg-white rounded p-4" id="spam" role="tabpanel" aria-labelledby="spam-tab">
                                            <span class="text-muted">Hooray, no spam here!</span>
                                        </div><!--end teb pane-->

                                        <div class="tab-pane fade bg-white rounded" id="sent" role="tabpanel" aria-labelledby="send-tab">
                                            <div class="table-responsive">
                                                <table class="table mb-0 table-email table-center table-nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th class="border-bottom py-3" style="min-width: 15px;" scope="col">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkAll2">
                                                                    <label class="form-check-label fw-normal" for="checkAll2"></label>
                                                                </div>
                                                            </th>
                                                            <th class="border-bottom py-3" style="min-width: 15px;" scope="col">
                                                                <a href="#" class="text-muted"><i class="uil uil-redo"></i></a>
                                                            </th>
                                                            <th class="border-bottom py-3" style="min-width: 150px;" scope="col"></th>
                                                            <th class="border-bottom py-3" style="min-width: 750px;" scope="col"></th>
                                                            <th class="border-bottom py-3 text-end" style="min-width: 150px;" scope="col">
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-left icons"></i></a>
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-right icons"></i></a>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox19">
                                                                    <label class="form-check-label" for="checkbox19"></label>
                                                                </div>
                                                            </th>
                                                            <th><i class="uil uil-star text-muted"></i></th>
                                                            <td>Amy Lucier</td>
                                                            <td><p class="text-muted mb-0">In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do.</p></td>
                                                            <td class="text-end"><small>17 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox20">
                                                                    <label class="form-check-label" for="checkbox20"></label>
                                                                </div>
                                                            </th>
                                                            <th><i class="uil uil-star text-muted"></i></th>
                                                            <td>Tameika Whittle</td>
                                                            <td><p class="text-muted mb-0">The wise man therefore always holds in these matters to this principle of selection.</p></td>
                                                            <td class="text-end"><small>27 Jan 2021</small></td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox21">
                                                                    <label class="form-check-label" for="checkbox21"></label>
                                                                </div>
                                                            </th>
                                                            <th><i class="uil uil-star text-muted"></i></th>
                                                            <td>Barbara Bayne</td>
                                                            <td><p class="text-muted mb-0">We denounce with righteous</p></td>
                                                            <td class="text-end"><small>21 Feb 2021</small></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div><!--end teb pane-->

                                        <div class="tab-pane fade bg-white rounded p-4" id="drafts" role="tabpanel" aria-labelledby="drafts-tab">
                                            <span class="text-muted">You don't have any saved drafts. Saving a draft allows you to keep a message you aren't ready to send yet.</span>
                                        </div><!--end teb pane-->

                                        <div class="tab-pane fade bg-white rounded p-4" id="delete" role="tabpanel" aria-labelledby="delete-tab">
                                            <span class="text-muted">No conversations in Trash.</span>
                                        </div><!--end teb pane-->

                                        <div class="tab-pane fade bg-white rounded p-4" id="notes" role="tabpanel" aria-labelledby="notes-tab">
                                            <span class="text-muted">No notes in Notes</span>
                                        </div><!--end teb pane-->
                                    </div>
                                </div>
                            </div><!--end row-->
                        </div>
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
                                
                            </div>
                        </div>
                        <!-- end Style switcher -->
                    </div><!--end col-->
                </div><!--end row-->
            </div>

           
        </div>
        <!-- Offcanvas End -->

        <!-- Compose Mail Start -->
        <div class="modal fade" id="compose-mail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Compose</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <form>
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-3">
                                        <input type="email" class="form-control" placeholder="To">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <input type="email" class="form-control" placeholder="Cc">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <input type="email" class="form-control" placeholder="Bcc">
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div id="editor"><p>Hello,<br><br> Great doctor if you need your family member to get effective immediate assistance, emergency treatment, or simple consultation. <br><br>Thank you</p></div>
                                </div>

                                <div class="col-12 mt-4">
                                    <button type="submit" class="btn btn-primary">Send Now</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Compose Mail End -->

        <!-- javascript -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- CK editor -->
        <script src="assets/js/ckeditor.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
        
        <script>
            ClassicEditor
            .create(document.querySelector('#editor'))
            .catch(error => {
                console.error(error);
            });
        </script>
    </body>

</html>
