<%-- 
    Document   : BlogsDBoard
    Created on : Jun 10, 2024, 9:15:19 AM
    Author     : pc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                                <h5 class="mb-0">Blogs</h5>

                                <nav aria-label="breadcrumb" class="d-inline-block mt-1">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="dboard">DashBoard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Blogs</li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                            <div style="display: flex">
                            <div style="display: flex; padding-top: 20px" >
                            <div class="mt-4 mt-sm-0" style="margin-right: 10px;">
                                <select class="form-select form-control" id="dailypatient" onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');" style="border: 2px solid skyblue;">
                                    <option value=""  data-href="blogdb">Status</option>
                                    <option value="1" data-href="${pageContext.request.contextPath}/statusBlog?xStatus=1" ${param.xStatus == '1' ? 'selected' : ''}>active</option>
                                    <option value="0" data-href="${pageContext.request.contextPath}/statusBlog?xStatus=0" ${param.xStatus == '0' ? 'selected' : ''}>block</option>
                                </select>
                            </div>
<!--                            <div class="mt-4 mt-sm-0">
                                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newblogadd">Add Blog</a>
                            </div>-->
                      
                             <div class="mt-4 mt-sm-0" style="padding-left: 10px">
                                <select class="form-select form-control" id="dailypatient" onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');" style="border: 2px solid skyblue;">
                                    <option value="0" data-href="blogdb" >All Event</option>
                                    <option value="1" data-href="${pageContext.request.contextPath}/blogByClub?clubID=1" ${param.clubID eq '1' ? 'selected' : ''}>Vovinam</option>
                                    <option value="2" data-href="${pageContext.request.contextPath}/blogByClub?clubID=2" ${param.clubID eq '2' ? 'selected' : ''}>Teakwondo</option>
                                    <option value="3" data-href="${pageContext.request.contextPath}/blogByClub?clubID=3" ${param.clubID eq '3' ? 'selected' : ''}>Street Workout</option>
                                    <option value="4" data-href="${pageContext.request.contextPath}/blogByClub?clubID=4" ${param.clubID eq '4' ? 'selected' : ''}>Melody</option>
                                    <option value="5" data-href="${pageContext.request.contextPath}/blogByClub?clubID=5" ${param.clubID eq '5' ? 'selected' : ''}>Chinese</option>
                                    <option value="6" data-href="${pageContext.request.contextPath}/blogByClub?clubID=6" ${param.clubID eq '6' ? 'selected' : ''}>Cinema Martial</option>
                                    <option value="7" data-href="${pageContext.request.contextPath}/blogByClub?clubID=7" ${param.clubID eq '7' ? 'selected' : ''}>Japanese</option>
                                    <option value="8" data-href="${pageContext.request.contextPath}/blogByClub?clubID=8" ${param.clubID eq '8' ? 'selected' : ''}>Tình Nguyện</option>
                                    <option value="9" data-href="${pageContext.request.contextPath}/blogByClub?clubID=9" ${param.clubID eq '9' ? 'selected' : ''}>Tiếng Anh</option>
                                    <option value="10" data-href="${pageContext.request.contextPath}/blogByClub?clubID=10" ${param.clubID eq '10' ? 'selected' : ''}>Cầu lông</option>
                                </select>
                            </div>
                            </div>
                            <div class="col-sm-12 col-md-3" style="padding-left: 600px;padding-right: 20px">
                                                        <div class="justify-content-md-end"style="display: flex;padding-left: 30px">
                                    <form action="blogdb" method="post" style="display: flex; align-items: center;">
    <div class="search-wrapper" style="position: relative;">
        <input value="${searchBlog}" type="text" name="search" placeholder="search here" style="padding-left: 30px;border-radius:20px;font-size: 15px">
      <i class="fas fa-search" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);"></i>
    </div>
                                            </form>
    <div class="d-grid" style="margin-left: 20px">
      <a href="add_blog" class="btn btn-primary" style="height: 35px;width: 130px">ADD NEW</a>
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
                                                <th class="border-bottom p-3" style="min-width: 100px;">Name</th>
                                                <th class="border-bottom p-3">Time</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${not empty listBL}">
                                            <c:forEach items="${listBL}" var="lb">
                                            <tr>
                                                <th class="p-3">${lb.id}</th>
                                                <td class="py-3">
                                                    <a href="" class="text-dark">
                                                        <div class="d-flex align-items-center">
                                                            <img src="${lb.image}" class="avatar avatar-md-sm rounded-circle shadow">
                                                            <span class="ms-2">${lb.name}</span>
                                                        </div>
                                                    </a>
                                                </td>
                                               <td class="p-3">${lb.time}</td>
                                                
</td>
                                                <c:if test="${lb.status == 1}">
                                                    <td class="p-3"><span class="badge bg-soft-success">active</span></td>
                                                </c:if>
                                                <c:if test="${lb.status == 0}">
                                                    <td class="p-3"><span class="badge bg-soft-danger">block</span></td>
                                                </c:if>
                                                    <td class="text-end p-3" >
                                                    
                                                    <a href="blogdetaildb?bid=${lb.id}" class="btn btn-icon btn-pills btn-soft-primary" style="margin: 0px 10px"><i class="uil uil-eye"></i> </a>
                                                    <c:if test="${lb.status == 0}">
                                                    <a href="deleteBlog?id=${lb.id}&status=1" class="btn btn-icon btn-pills btn-soft-success" ><i class="uil uil-check-circle text"></i></a>
                                                    </c:if>
                                                    <c:if test="${lb.status == 1}">
                                                    <a href="deleteBlog?id=${lb.id}&status=0" class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-multiply text"></i></a>
                                                    </c:if>
                                                  
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            </c:if>
                                                                        <c:if test="${empty listBL}">
                        <tr>
                           <td colspan="7">
                              <div class="alert alert-danger text-center">There are no Blog</div>
                           </td>
                        </tr>
                              </c:if>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
        
                        </div><!--end row-->
            
                            <div class="row text-center" style="padding: 20px;">
                            <!-- PAGINATION START -->
                             <div class="clearfix" style="padding-bottom: 10px;
    font-size: 20px;">
  <ul class="pagination justify-content-center" id="pagination">
    <li class="page-item ${tag == 1 ? 'disabled' : ''}">
      <a class="page-link" href="blogdb?index=${tag - 1}">Previous</a>
    </li>
    <c:forEach begin="1" end="${mPage}" var="i">
      <li class="page-item ${tag == i ? 'active' : ''}">
        <a class="page-link" href="blogdb?index=${i}">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item ${tag == mPage ? 'disabled' : ''}">
      <a class="page-link" href="blogdb?index=${tag + 1}">Next</a>
    </li>
  </ul>
</div>
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
                                    <li class="d-grid"><a href="../landing/index.html" target="_blank" class="mt-4"><img src="../assets/images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
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
                    <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
                </ul><!--end icon-->
            </div>
        </div>
        <!-- Offcanvas End -->

        <!-- Start Modal -->
<!--        <div class="modal fade" id="newblogadd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"style="">
            <div class="modal-dialog modal-lg modal-dialog-centered">

                <div class="modal-content">
                   
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Add Blog</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body p-3 pt-4" style="padding-top: 0px">
                       
                        <div class="row">
                            
                            <div class="col-md-4">
                                <form action="addBlogdboard" method="post" enctype="multipart/form-data">
                                <div class="d-grid">
                                    
                                    <p class="text-muted"></p>
                                    <div class="preview-box d-block justify-content-center rounded shadow overflow-hidden bg-light p-1"></div>
                                    <input type="file" id="input-file" name="input-file" accept="image/*" />
                                    
                              
                                </div>
                                </form>
                            </div>end col
                           

                            <div class="col-md-8 mt-4 mt-sm-0"style="">
                                <div class="ms-md-4"style="">
                                    <form action="addBlogdboard" method="post" style="">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Blog Title <span class="text-danger">*</span></label>
                                                    <input name="name" id="name" type="text" class="form-control" placeholder="Title :">
                                                </div>
                                            </div>end col
    
                                       
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label"> Date : </label>
                                                    <input name="date" type="text" class="form-control" id="date" value="09 January 2021">
                                                </div>
                                            </div>end col
    
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                     <label class="form-label" style="padding-bottom: 10px">Status</label>
                          <div class="context-status" style="display: flex;">
    
    <div style="display: flex; align-items: center;padding-right: 20px">
        <input  value="1" type="radio"  name="status" style="font-size: 10px;  margin-right: 10px">
        active
    </div>
    
    <div style="display: flex; align-items: center;">
        <input  value="2" type="radio"  name="status" style="font-size: 10px;  margin-right: 10px">
        block
    </div>
</div>
                                                </div>
                                            </div>end col
    
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Club</label>
                                                    <select class="form-control" >
                                                        <option value="1">Vovinam</option>
                                                        <option value="2">Teakwondo</option>
                                                        <option value="3">Street Workout</option>
                                                        <option value="4">Melody</option>
                                                        <option value="5">Chinese</option>
                                                        <option value="6">Cinema Martial Arts</option>
                                                        <option value="7">Japanese</option> 
                                                    </select>
                                                </div>
                                            </div>end col
                                            
    
                                        <div class="col-lg-12">
    <div class="mb-3">
        <label class="form-label">Description <span class="text-danger">*</span></label>
        <div id="blog-description" class="cke_editable cke_editable_inline cke_contents_ltr" contenteditable="true" spellcheck="false" style="height: 100px;">
        </div>
    </div>
</div>

                                            <div class="col-lg-12 text-end">
                                                <button type="submit" class="btn btn-primary">ADD</button>
                                            </div>end col
                                        </div>
                                    </form>
                                </div>
                            </div>end col
                        </div>end row
                    </div>
                </div>
               
            </div>
        </div>-->
        <!-- End modal -->
        <script>
CKEDITOR.replace('blog-description', {
    height: '200px'
});
</script>


<script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
        <!-- javascript -->
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
    </body>
</html>