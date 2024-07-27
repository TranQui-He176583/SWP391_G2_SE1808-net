<%-- 
    Document   : clubDboard
    Created on : Jun 11, 2024, 10:38:30 PM
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
      <%@include file="commonFunction/header_db.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_db_1.jsp"%>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <div>
                                <h5 class="mb-0">Club</h5>

                                <nav aria-label="breadcrumb" class="d-inline-block mt-1">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="dboard">DashBoard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Club</li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div style="display: flex">
                            <div style="display: flex; padding-top: 20px" >
                            <div class="mt-4 mt-sm-0" style="margin-right: 10px;">
                                <select class="form-select form-control" id="dailypatient" onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');" style="border: 2px solid skyblue;">
                                    <option value="ALL" data-href="clubdb" >All Club</option>
                                    <option value="Võ Thuật" data-href="${pageContext.request.contextPath}/clubdbCategory?category=Võ%20Thuật" ${param.category eq 'Võ Thuật' ? 'selected' : ''}>Võ thuật</option>
                                    <option value="Học Thuật" data-href="${pageContext.request.contextPath}/clubdbCategory?category=Học%20Thuật" ${param.category eq 'Học Thuật' ? 'selected' : ''}>Học Thuật</option>
                                    <option value="Nghệ Thuật" data-href="${pageContext.request.contextPath}/clubdbCategory?category=Nghệ%20Thuật" ${param.category eq 'Nghệ Thuật' ? 'selected' : ''}>Nghệ Thuật</option>
                                    <option value="Cộng Đồng" data-href="${pageContext.request.contextPath}/clubdbCategory?category=Cộng%20Đồng" ${param.category eq 'Cộng Đồng' ? 'selected' : ''}>Cộng Đồng</option>
                                                  
                                </select>
                            </div>
                            <div class="mt-4 mt-sm-0">
                                <select class="form-select form-control" id="dailypatient" onchange="window.location.href=this.options[this.selectedIndex].getAttribute('data-href');" style="border: 2px solid skyblue;">
                                    <option value=""  data-href="clubdb">Status</option>
                                    <option value="1" data-href="${pageContext.request.contextPath}/statusClub?xStatus=1" ${param.xStatus == '1' ? 'selected' : ''}>active</option>
                                    <option value="0" data-href="${pageContext.request.contextPath}/statusClub?xStatus=0" ${param.xStatus == '0' ? 'selected' : ''}>block</option>
                                </select>
                            </div>
                            </div>
<!--                              <div class="mt-4 mt-sm-0">
                                <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newblogadd">Add Club</a>
                            </div>-->
                            <div class="col-sm-12 col-md-3" style="padding-left: 600px;padding-right: 20px">
                                                        <div class="justify-content-md-end"style="display: flex;padding-left: 30px">
                                    <form action="clubdb" method="post" style="display: flex; align-items: center;">
    <div class="search-wrapper" style="position: relative;">
        <input value="${NameSearch}" type="text" name="search" placeholder="search here" style="padding-left: 30px;border-radius:20px;font-size: 15px">
      <i class="fas fa-search" style="position: absolute; left: 10px; top: 50%; transform: translateY(-50%);"></i>
    </div>
                                            </form>
    <div class="d-grid" style="margin-left: 20px">
        <a href="add_club" class="btn btn-primary" style="height: 35px;width: 130px">ADD NEW</a>
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
                                                <th class="border-bottom p-3">Detail</th>
                                                <th class="border-bottom p-3">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listCLB}" var="lcb">
                                            <tr>
                                                <th class="p-3">${lcb.id}</th>
                                                <td class="py-3">
                                                    <a href="" class="text-dark">
                                                        <div class="d-flex align-items-center">
                                                            <img src="${lcb.avatar}" class="avatar avatar-md-sm rounded-circle shadow">
                                                            <span class="ms-2">${lcb.name}</span>
                                                        </div>
                                                    </a>
                                                </td>
                                               <td class="p-3">
                                                <c:choose>
                                                    <c:when test="${fn:length(lcb.detail) > 40}">
                                                      ${fn:substring(lcb.detail, 0, 40)}...
                                                    </c:when>
                                                    <c:otherwise>
                                                       ${lcb.detail}
                                                    </c:otherwise>
                                                </c:choose>
</td>
                                                <c:if test="${lcb.status == 1}">
                                                    <td class="p-3"><span class="badge bg-soft-success">active</span></td>
                                                </c:if>
                                                <c:if test="${lcb.status == 0}">
                                                    <td class="p-3"><span class="badge bg-soft-danger">block</span></td>
                                                </c:if>
                                                    <td class="text-end p-3" >
                                                    
                                                    <a href="clubdetaildb?cid=${lcb.id}"  class="btn btn-icon btn-pills btn-soft-primary" style="margin: 0px 5px"><i class="uil uil-eye"></i> </a>
                                                    <c:if test="${lcb.status == 0}">
                                                    <a href="deleteClub?id=${lcb.id}&status=1" class="btn btn-icon btn-pills btn-soft-success"><i class="uil uil-check-circle text"></i></a>
                                                    </c:if>
                                                    <c:if test="${lcb.status == 1}">
                                                    <a href="deleteClub?id=${lcb.id}&status=0"  class="btn btn-icon btn-pills btn-soft-danger"><i class="uil uil-multiply text"></i></a>
                                                    </c:if>
                                                  
                                                </td>
                                            </tr>
                                            </c:forEach>
                                      
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
      <a class="page-link" href="clubdb?index=${tag - 1}">Previous</a>
    </li>
    <c:forEach begin="1" end="${mPage}" var="i">
      <li class="page-item ${tag == i ? 'active' : ''}">
        <a class="page-link" href="clubdb?index=${i}">${i}</a>
      </li>
    </c:forEach>
    <li class="page-item ${tag == mPage ? 'disabled' : ''}">
      <a class="page-link" href="clubdb?index=${tag + 1}">Next</a>
    </li>
  </ul>
</div>
                            <!-- PAGINATION END -->
                        </div><!--end row-->
                    </div>
                </div><!--end container-->

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
        <script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<script>
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
    </body>

</html>