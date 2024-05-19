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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap User Management Data Table</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<%@include file="commonFunction/CSS.jsp" %>
  <link rel="stylesheet" href="assets/css/list.css">
<script>
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
</head>
<body>
    <style>
    #preloader-active .preloader-img img {
        max-width: 90%;
        max-height: 100%;
        width: auto;
        height: auto;
    }
</style>
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/logofpt.png" alt="" >
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="commonFunction/header.jsp" %>
    <main>
        <div class="slider-area2">
            <div class="slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap hero-cap2 pt-70 text-center">
                                <h2>User Management</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="function-table">
            <div class="row">
                <div class="col-sm-7">
                    <a href="NewUser.jsp"  class="btn btn-secondary"> <span>Add New User</span></a> 	   			
                </div>
            </div>
        </div>
        <div class="content-table">
            <table class="table table-striped table-hover">
                <thead>
                    
                    <tr>
                        <th>Avatar</th>	
                        <th>Name</th>	
                        <th>Role</th>	
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Action</th>
                    </tr> 
                                        
                </thead> 
                <tbody>
                   <c:forEach items="${litsUser}" var="o">
                    <tr>  
                        <td><img src="${o.image}"></td>
                        <td href="User_detail.jsp"><a href="detail?uid=${o.id}"> ${o.fullName}</a></td> 
                        <td>>${role.roleName}</td> 
                        <td>${o.email}</td>                       
                        <td>${o.phone}</td>
                        <td><a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">delete</i></a></td>
                  
                    </c:forEach>
                    </tbody>
            </table>
            <div class="clearfix">
  <div class="hint-text">Showing pages <span id="currentPage">1</span> of 5</div>
  <ul class="pagination" id="pagination">
    <li class="page-item" id="prevPage">
      <a href="#" onclick="prevPage(); return false;">Previous</a>
    </li>
    <li class="page-item active">
      <a href="#" class="page-link" onclick="goToPage(1); return false;">1</a>
    </li>
    <li class="page-item">
      <a href="#" class="page-link" onclick="goToPage(2); return false;">2</a>
    </li>
    <li class="page-item">
      <a href="#" class="page-link" onclick="goToPage(3); return false;">3</a>
    </li>
    <li class="page-item">
      <a href="#" class="page-link" onclick="goToPage(4); return false;">4</a>
    </li>
    <li class="page-item">
      <a href="#" class="page-link" onclick="goToPage(5); return false;">5</a>
    </li>
    <li class="page-item" id="nextPage">
      <a href="#" onclick="nextPage(); return false;">Next</a>
    </li>
  </ul>
</div>
        </div>
<script>
  let currentPage = 1;
  const totalPages = 5;

  function goToPage(page) {
    currentPage = page;
    updatePageInfo();
  }

  function prevPage() {
    if (currentPage > 1) {
      currentPage--;
      updatePageInfo();
    }
  }

  function nextPage() {
    if (currentPage < totalPages) {
      currentPage++;
      updatePageInfo();
    } else {
      currentPage = 1;
      updatePageInfo();
    }
  }

  function updatePageInfo() {
    document.getElementById("currentPage").textContent = currentPage;
    document.querySelectorAll("#pagination li.page-item").forEach((li, index) => {
      li.classList.remove("active");
      if (index === currentPage ) {
        li.classList.add("active");
      }
    });
    document.getElementById("prevPage").classList.toggle("disabled", currentPage === 1);
    document.getElementById("nextPage").classList.toggle("disabled", currentPage === totalPages);
  }
</script>
 </main>
     <%@include file="commonFunction/footer.jsp" %>
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!-- JS here -->
	
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    
    <!-- Nice-select, sticky -->
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
 
</body>
</html>