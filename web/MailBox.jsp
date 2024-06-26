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
                                            <div class="table-responsive bg-white shadow rounded" style="">
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
                                                            <th class="border-bottom p-3" style="min-width: 100px;" scope="col"></th>
                                                            <th class="border-bottom p-3" style="min-width: 250px;" scope="col"></th>
                                                            <th class="border-bottom p-3 text-end" style="min-width: 100px;" scope="col">
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-left icons"></i></a>
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-right icons"></i></a>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                       
                                                        <tr>
                                                            <th class="p-3">
                                                                <div class="form-check">
                                                                    <input class="form-check-input check" type="checkbox" value="" id="checkbox4">
                                                                    <label class="form-check-label" for="checkbox4"></label>
                                                                </div>
                                                            </th>
                                                            <th class="p-3"><i class="uil uil-star text-muted"></i></th>
                                                            <td class="p-3">Nita Griffin</td>
                                                            <td><p class="text-muted mb-0">In a free hour,......</p></td>
                                                            <td class="text-end class p-3"><small>17 Jan 2021</small></td>
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
                                                            <td><p class="text-muted mb-0">In a free hour,......</p></td>
                                                            <td class="text-end class p-3"><small>17 Jan 2021</small></td>
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
                                                            <td><p class="text-muted mb-0">In a free hour,......</p></td>
                                                            <td class="text-end class p-3"><small>17 Jan 2021</small></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            
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
                                                            <th class="border-bottom py-3" style="min-width: 100px;" scope="col"></th>
                                                            <th class="border-bottom py-3" style="min-width: 250px;" scope="col"></th>
                                                            <th class="border-bottom py-3 text-end" style="min-width: 100px;" scope="col">
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
                                                            <td><p class="text-muted mb-0">In a free hour,.....</p></td>
                                                            <td class="text-end"><small>17 Jan 2021</small></td>
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
                                                            <th class="border-bottom py-3" style="min-width: 100px;" scope="col"></th>
                                                            <th class="border-bottom py-3" style="min-width: 250px;" scope="col"></th>
                                                            <th class="border-bottom py-3 text-end" style="min-width: 100px;" scope="col">
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-left icons"></i></a>
                                                                <a href="#" class="btn btn-icon btn-sm btn-pills btn-soft-light"><i class="uil uil-angle-right icons"></i></a>
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                       <c:forEach items="${sentlis}" var="sl">
                                            
    <tr class="btn-soft-primary">
                           
        <th>
            <div class="form-check">
                <input class="form-check-input check" type="checkbox" value="" id="checkbox19">
                <label class="form-check-label" for="checkbox19"></label>
            </div>
        </th>
        <th><i class="uil uil-star text-muted"></i></th>
        <td><a href="detailMailSent?mid=${sl.id}"></a> To: ${sl.name}</td>
        <td>
            <a href="detailMailSent?mid=${sl.id}" ><p class="text-muted mb-0"><strong style="color:#696969">${sl.subject}</strong></p></a>
            <a href="detailMailSent?mid=${sl.id}"><p class="text-muted mb-0">${fn:substring(sl.context, 0, 30)}....</p></a>
        </td>
        <td class="text-end"><small>${sl.time}</small></td>
        
    </tr>
      
</c:forEach>
                                                        </a>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div><!--end teb pane-->
           
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
            <textarea name="context" id="context" rows="10" class="form-control" placeholder=" "></textarea>
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
