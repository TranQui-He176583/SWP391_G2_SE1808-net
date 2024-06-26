<%-- 
    Document   : MailBox
    Created on : Jun 22, 2024, 9:48:14 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <meta name="website" content="index.html" />
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
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css">
         
    </head>

    <body>
        <!-- Loader -->
    <div class="page-wrapper doctris-theme toggled">
       <%@include file="commonFunction/header_db.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_db_1.jsp"%>
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
                                                <a class="nav-link rounded active" id="inbox-tab" data-bs-toggle="pill" href="listSent" role="tab" aria-controls="inbox" aria-selected="false">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-inbox h5 align-middle me-2 mb-0"></i>Inbox</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded"href="listSent">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-star h5 align-middle me-2 mb-0"></i> Starred</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" href="listSent">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-times h5 align-middle me-2 mb-0"></i> Spam</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" href="listSent" >
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-upload h5 align-middle me-2 mb-0" ></i> Sent</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" href="listSent">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-envelope-edit h5 align-middle me-2 mb-0"></i> Drafts</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded" href="listSent" role="tab">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-trash h5 align-middle me-2 mb-0"></i> Delete</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                            
                                            <li class="nav-item mt-2">
                                                <a class="nav-link rounded"  href="listSent">
                                                    <div class="text-start px-3">
                                                        <span class="mb-0"><i class="uil uil-notes h5 align-middle me-2 mb-0"></i> Notes</span>
                                                    </div>
                                                </a><!--end nav link-->
                                            </li><!--end nav item-->
                                        </ul><!--end nav pills-->
                                    </div>
                                </div><!--end col-->

                                <div class="col-xl-10 col-lg-9 col-md-8 col-12 mt-4 mt-sm-0">
                                    <div class="tab-content">
                                        
                                         <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel1" style="font-size: 20px">${detail.subject}</h5>
                        <div style="font-size: 12px">${detail.time}</div>
                    </div>
                    <div class="modal-body p-3 pt-3">
                        <div class="d-flex ">
                           <div class="mb-0" style="font-size: 15px;font-weight: bold;">FPTU HN Club</div> 
                           <div class="mb-0 ms-3" style="font-size: 12px">(quitdhe176583@fpt.edu.vn)</div>
                        </div>
                        <div class="list-unstyled mb-0 d-md-flex justify-content-between mt-2" style="font-size: 12px;">
                         To:${detail.name}
                        </div>
                        <div class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                          ${detail.context}  
                        </div>
                    </div>
                </div>
            </div>
                                        

                                        

           
        <!-- View Appintment End -->

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
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear()),</script> © DashBoard. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="" target="_blank" class="text-reset">G2</a>.</p>
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

            <div class="offcanvas-footer p-4 border-top text-center">
               
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
 <form action="sendMailDB" method="post">
    <div class="row">
      <div class="col-12">
        <div class="mb-3">
            <input type="email" class="form-control" name="email" placeholder="To">
          
        </div>
      </div>

      <div class="col-md-6">
        <div class="mb-3">
            <input type="text" class="form-control" name="subject" placeholder="Subject">
        </div>
      </div>

      <div class="col-12">
        <div>
            <textarea name="context" id="context" rows="4" class="form-control" placeholder=" "></textarea>
        </div>
      </div>
      <div class="col-12 mt-4">
        <button type="submit" class="btn btn-primary">Send Now</button>
      </div>
    </div>
  </form>
     
    
</div>
           <!-- View Appintment Start -->
       

<!-- javascript -->
<script src="assets/js/bootstrap.bundle.min.js"></script>
<!-- simplebar -->
<script src="assets/js/simplebar.min.js"></script>
<!-- Icons -->
<script src="assets/js/feather.min.js"></script>
<!-- CK editor -->
<!-- Main Js -->
<script src="assets/js/app.js"></script>
<script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<script>CKEDITOR.replace('context');</script>
<script src="https://cdn.ckeditor.com/4.19.1/standard/plugins/image/plugin.js"></script>

    </body>

</html>
