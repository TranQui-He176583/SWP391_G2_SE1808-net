<%-- 
    Document   : contactList
    Created on : Jun 28, 2024, 2:20:18 PM
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css">
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
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
     
        <div class="page-wrapper doctris-theme toggled">
          <%@include file="commonFunction/header_db.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_db_1.jsp"%>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="row">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Contact List</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="dboard">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Contacts</li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-sm-12 col-md-5" style="display: flex">
                               
                                <div class="col-sm-12 col-md-3" style="padding-top: 10px">
                                                <div class="mb-0 position-relative">
                                                    <select class="form-control time-during select2input" onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');">
                                                      <option value=""  data-href="contactdb">Status</option>
                                                      <option value="1" data-href="${pageContext.request.contextPath}/statusContact?xStatus=1" ${param.xStatus == '1' ? 'selected' : ''}>active</option>
                                                      <option value="0" data-href="${pageContext.request.contextPath}/statusContact?xStatus=0" ${param.xStatus == '0' ? 'selected' : ''}>block</option>
                                                    </select>
                                                    <div class="select-arrow"></div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-sm-12 col-md-3" style="padding-top: 10px;padding-left: 10px">
                                                <div class="mb-0 position-relative">
                                                    <select class="form-control time-during select2input"onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');">
                                                        <option value="Sort" data-href="">Sort</option>
                                                        <option value="ASC" data-href="contactASC" >ASC</option>
                                                        <option value="DESC"data-href="contactDESC" >DESC</option>
                                                    </select>
                                                    <div class="select-arrow"></div>
                                                </div>
                                            </div>
                                      
                                </div>
                         <div class="col-sm-12 col-md-3" style="padding-left: 460px;padding-top: 15px">
                                                        <div class="justify-content-md-end"style="display: flex;padding-left: 30px">
                                    <form action="contactdb" method="post" style="display: flex; align-items: center;">
    <div class="search-wrapper" style="position: relative;">
        <input value="${NameSearch}" type="text" name="search" placeholder="search here" style="padding-left: 30px;border-radius: 10px;font-size: 15px">
      <i class="fas fa-search" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);"></i>
    </div>
                                            </form>
    <div class="d-grid" style="margin-left: 20px">
      <a href="addContact" class="btn btn-primary" style="height: 35px;width: 130px">ADD NEW</a>
    </div>
    

  
                                </div>
                            </div>    
                        </div>
                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive shadow rounded">
                                    <table class="table table-center bg-white mb-0">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Name</th>
                                                <th class="border-bottom p-3" style="min-width: 80px;">Email</th>
                                                <th class="border-bottom p-3">Subject</th>
                                               
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listCT}" var="lct">
                                            <tr>
                                                <th class="p-3">${lct.id}</th>
                                                <td class="py-3">
                                                    <a href="" class="text-dark">
                                                        <div class="d-flex align-items-center">
                                                            
                                                            <span class="ms-2">${lct.name}</span>
                                                        </div>
                                                    </a>
                                                </td>
                                                <td class="p-3">${lct.email}</td>
                                                <td class="p-3">${lct.subject}</td>
                                                <c:if test="${lct.status == 1}">
                                                    <td class="p-3"><span class="badge bg-soft-success">active</span></td>
                                                </c:if>
                                                <c:if test="${lct.status == 0}">
                                                    <td class="p-3"><span class="badge bg-soft-danger">block</span></td>
                                                </c:if>
                                                <td class="text-end p-3">
                                                    
                                                    <a href="detailContact?ctid=${lct.id}" class="btn btn-icon btn-pills btn-soft-primary" style="margin: 0px 5px"><i class="uil uil-eye"></i> </a>
                                                    <c:if test="${lct.status == 0}">
                                                    <a href="deleteContact?id=${lct.id}&status=1" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-check-circle text"></i></a>
                                                    </c:if>
                                                    <c:if test="${lct.status == 1}">
                                                    <a href="deleteContact?id=${lct.id}&status=0" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-multiply text"></i></a>
                                                    </c:if>
                                                  
                                                </td>
                                            </tr>
                                            </c:forEach>
                                      
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!--end row-->

                        <div class="row text-center">
                            <!-- PAGINATION START -->
                            <div class="col-12 mt-4">
                                <div class="row text-center" style="">
                            <!-- PAGINATION START -->
                           
                             <div class="clearfix" style="padding-bottom: 10px;
    font-size: 20px;">
  <ul class="pagination justify-content-center" id="pagination">
    <li class="page-item ${tag == 1 ? 'disabled' : ''}">
      <a class="page-link" href="contactdb?index=${tag - 1}">Previous</a>
    </li>
    <c:forEach begin="1" end="${mPage}" var="i">
      <li class="page-item ${tag == i ? 'active' : ''}">
        <a class="page-link" href="contactdb?index=${i}">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item ${tag == mPage ? 'disabled' : ''}">
      <a class="page-link" href="contactdb?index=${tag + 1}">Next</a>
    </li>
  </ul>
</div>
                                       
                            <!-- PAGINATION END -->
                        </div><!--end row-->
                            </div><!--end col-->
                            <!-- PAGINATION END -->
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
        <!-- Profile Settings Start -->
        <div class="modal fade" id="editprofile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Profile Settings</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="row align-items-center">
                            <div class="col-lg-2 col-md-4">
                                <img src="../assets/images/doctors/01.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                            </div><!--end col-->

                            <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                <h6 class="">Upload your picture</h6>
                                <p class="text-muted mb-0">For best results, use an image at least 256px by 256px in either .jpg or .png format</p>
                            </div><!--end col-->

                            <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                <a href="#" class="btn btn-primary">Upload</a>
                                <a href="#" class="btn btn-soft-primary ms-2">Remove</a>
                            </div><!--end col-->
                        </div><!--end row-->
                    
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile Settings End -->

        <!-- Profile Start -->
                   
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<script>
    CKEDITOR.replace('details');
</script>
<script>
    
</script>

    </body>

</html>
