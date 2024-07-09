<%-- 
    Document   : BlogDetailDBoard
    Created on : Jun 10, 2024, 9:16:25 AM
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
           
           <style>
               .team-option:hover .team-name {
  color: blue;
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
#preview-image1 {
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
       <%@include file="commonFunction/header_db.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_db_1.jsp"%>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <div>
                                <h5 class="mb-0">${detailC.name}</h5>
                                <div style="display: flex">
                                <input type="hidden"  name="id" value="${detailC.id}" readonly required>
                                <ul class="list-unstyled mt-2 mb-0">
                                    <li class="list-inline-item user text-muted me-2"><i class="mdi mdi-account"></i>Manager: ${Manager.fullname}</li>
                                </ul>  
                              <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    ${cTeam} Team
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:forEach items="${listTeam}" var="lte">
                                        <a class="dropdown-item team-option" href="detailTeam?tid=${lte.id}" data-href="" style="color: inherit;">
                                          <span class="team-name">${lte.name}</span>
                                        </a>
                                    </c:forEach>
                                </div>
                              </div>
                                <div style="margin-left: 20px">
                                   <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newteamadd" style="">ADD TEAM</a>
                                </div>
                                </div>
                                
                                
                            </div>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="dboard">DashBoard</a></li>
                                    <li class="breadcrumb-item"><a href="clubdb">Club</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Club Detail</li>
                                </ul>
                            </nav>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-8 col-lg-7 mt-4">
                                <div class="card rounded shadow border-0 overflow-hidden">
                                    <img src="${detailC.avatar}" class="img-fluid" alt="">
        
                                    <div class="p-4">
                                      
                                        <p class="text-muted">${detailC.detail}</p>
                                       
                                        <ul class="media-list list-unstyled mb-0">
                                         
                                            <li class="mt-4">
                                             
                                            </li>
                                        </ul>
                                    
                                    </div>
                                </div>
                                   
                                    <div class="d-flex justify-content-between mt-4 mt-sm-0"style="padding: 10px">
                                    <p style="color: green; font-size: 15px">${requestScope.completeChange}</p>
                                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newclubadd">EDIT</a>
                                </div>  
                            </div><!--end col-->
        
                            <div class="col-lg-4 col-md-5 mt-4">
                                <div class="card border-0 sidebar sticky-bar rounded shadow">
                                    <div class="card-body">
                                        <!-- SEARCH -->
                                        <div class="widget mb-4 pb-2">
                                            <h5 class="widget-title">Search</h5>
                                            <div id="search2" class="widget-search mt-4 mb-0">
                                                <form action="clubdetaildb" method="post" id="searchform1" class="searchform">
                                                    <div>
                                                        <input type="text" class="border rounded" name="search" id="search" placeholder="Search Keywords...">
                                                        <input type="submit" id="searchsubmit1" value="Search">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- SEARCH -->
            
                                        <!-- RECENT POST -->
                                        <div class="widget mb-4 pb-2">
                                            <h5 class="widget-title">Recent Club</h5>
                                            <div class="mt-4">
                                              
                                                <c:forEach items="${listdb}" var="lcdb">
                                           
                                                <div class="clearfix post-recent">
                                                    <div class="post-recent-thumb float-start"> <a href="clubdetaildb?cid=${lcdb.id}"><img alt="img" src="${lcdb.avatar}" class="img-fluid rounded"></a></div>
                                                    
                                                    <div class="post-recent-content float-start" style="padding-top: 18px"><a href="clubdetaildb?cid=${lcdb.id}">${lcdb.name}</a> 
                                              
                                                        <span class="text-muted mt-2"></span>
                                                    </div>
                                                </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->
                <form action="editClubdb" method="post" enctype="multipart/form-data">
                    <input type="hidden"  name="id" value="${detailC.id}" readonly required>
                    <div class="modal fade" id="newclubadd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"style="">
                        <div class="modal-dialog modal-lg modal-dialog-centered">

                            <div class="modal-content">

                                <div class="modal-header border-bottom p-3">
                                    <h5 class="modal-title" id="exampleModalLabel">Edit Club</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body p-3 pt-4" style="padding-top: 0px">

                                    <div class="row">
    <div class="col-md-6">
        <div class="ms-md-4">
            <div class="row">
                <input type="hidden" name="id" value="${detailC.id}" readonly required>
                <div class="col-12">
                   <div class="d-grid">
    <p class="text-muted"></p>
    <div class="preview-box d-block bg-light p-1">
    <img id="preview-image" src="${detailC.avatar}" class="img-fluid" alt="">
</div>
    <input type="file" id="avatar" name="avatar" accept="image/*" onchange="previewImage(this)">
</div>
                    
                </div>
                <div class="col-12">
                    <div class="mb-3" style="padding-top: 10px">
                        <label class="form-label">Club Name <span class="text-danger">*</span></label>
                        <input name="name" id="name" type="text" class="form-control" value="${detailC.name}">
                    </div>
                </div>
                <div class="col-12">
                    <div class="mb-3">
                        <label class="form-label">Manager <span class="text-danger">*</span></label>
                        <input name="name" id="name" type="text" class="form-control" value="${Manager.fullname}">
                    </div>
                </div>
                <div class="col-12">
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <div class="context-status" style="display: flex;">
                            <div style="display: flex; align-items: center;">
                                <input ${detailC.status == 1 ? 'checked' : ''} value="1" type="radio" name="status" style="font-size: 10px; margin-right: 10px">
                                active
                            </div>
                            <div style="display: flex; align-items: center; margin-left: 20px;">
                                <input ${detailC.status== 0 ? 'checked' : ''} value="0" type="radio" name="status" style="font-size: 10px; margin-right: 10px">
                                block
                            </div>
                        </div>
                    </div>
                </div>
                 
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="mb-3">
            <label class="form-label">Description <span class="text-danger">*</span></label>
            <textarea name="detail" id="comments" rows="4" class="form-control" placeholder=" description :"> ${detailC.detail} </textarea>
        </div>
        <div>
            <p style="color: red; font-size: 15px">${requestScope.wrongName}</p>
        </div>
    </div>
    
    <div class="col-lg-12 text-end">
        <button type="submit" class="btn btn-primary">SAVE</button>
    </div>
</div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            </form>

        <form action="addTeam" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="clubID" name="clubID" value="${detailC.id}">
                    <div class="modal fade" id="newteamadd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"style="">
                        <div class="modal-dialog modal-lg modal-dialog-centered">

                            <div class="modal-content">

                                <div class="modal-header border-bottom p-3">
                                    <h5 class="modal-title" id="exampleModalLabel">ADD TEAM</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>

                                <div class="modal-body p-3 pt-4" style="padding-top: 0px">

                                    <div class="row">
    <div class="col-md-6">
        <div class="ms-md-4">
            <div class="row">
                <div class="col-12">
                   <div class="d-grid">
    <p class="text-muted"></p>
    <div class="preview-box d-block bg-light p-1">
    <img id="preview-image1" src="${image}" class="img-fluid" alt="">
</div>
    <input type="file" id="image" name="image" accept="image/*" onchange="previewImage1(this)">
</div>
                    
                </div>
<p style="color: red">${requestScope.invalidImage}</p>

                <div class="col-12">
                    <div class="mb-3" style="padding-top: 10px">
                        <label class="form-label">Team Name <span class="text-danger"></span></label>
                        <input name="name" id="name" type="text" class="form-control" value="${name}" minlength="2" maxlength="40">
                         <p style="color: red">${requestScope.invalidName}</p>
                    </div>
                </div>
                <div class="col-12">
                    <div class="mb-3">
                        <label class="form-label">Team Leader <span class="text-danger"></span></label>
                        <input name="leader" id="leader" type="text" class="form-control" value="">
                    </div>
                </div>
            
                <div class="col-12">
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <div class="context-status" style="display: flex;">
                            <div style="display: flex; align-items: center;">
                                <input value="1" type="radio" name="status" style="font-size: 10px; margin-right: 10px" checked="">
                                active
                            </div>
                            <div style="display: flex; align-items: center; margin-left: 20px;">
                                <input value="0" type="radio" name="status" style="font-size: 10px; margin-right: 10px">
                                block
                            </div>
                        </div>
                    </div>
                </div>
                 
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="mb-3">
            <label class="form-label">Description <span class="text-danger">*</span></label>
            <textarea name="details" id="details" rows="4" class="form-control" minlength="1" maxlength="500"> ${details} </textarea>
            <p style="color: red">${requestScope.invalidDetail}</p>
        </div>   
    </div>
    <div class="col-lg-12 text-end">
        <button type="submit" class="btn btn-primary">ADD</button>
    </div>
</div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            </form>

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear()),</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
            </main>
            <!--End page-content" -->
        </div>
        
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- simplebar -->
        <script src="assets/js/simplebar.min.js"></script>
        <!-- Icons -->
        <script src="assets/js/feather.min.js"></script>
        <!-- Main Js -->
        <script src="assets/js/app.js"></script>
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<script>
    CKEDITOR.replace('detail');
    CKEDITOR.replace('details');
</script>
<script>
    function previewImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#preview-image').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<script>
    function previewImage1(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#preview-image1').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
    </body>

</html>