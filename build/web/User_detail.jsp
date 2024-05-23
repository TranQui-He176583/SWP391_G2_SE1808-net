
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>User Management Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
            <%@include file="commonFunction/CSS_1.jsp" %>
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
    <!-- Preloader Start -->
    <%@include file="commonFunction/header.jsp" %>
    <main>
        <!--? Hero Start -->
        <div class="slider-area2">
            <div class="slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap hero-cap2 pt-70 text-center">
                                <h2>Profile</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
             
      <section class="bg-light">
    <div class="container">
        

        <div class="row">
            <div class="col-lg-12 mb-4 mb-sm-5">
                <div class="card card-style1 border-0">
                    <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                        
                        <div class="row align-items-center" >
               
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                
                                <img src="${detail.image}" alt="...">
                            </div>
                            <div class="col-lg-6 px-xl-10">
                                <div class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded">
                                    <h3 class="h2 text-white mb-0">${detail.fullname}</h3>
                                     <c:choose>
                                       <c:when test="${detail.roleId == 1}">
                                          <span class="text-primary">Admin</span>
                                       </c:when>
                                        <c:when test="${detail.roleId == 2}">
                                          <span class="text-primary">Manager</span>
                                        </c:when>
                                        <c:when test="${detail.roleId == 3}">
                                          <span class="text-primary">NormalUser</span>
                                        </c:when>
                                          
                                    </c:choose>
                                    <span class="text-primary">${role.roleName}</span>
                                </div>
                                <ul class="list-unstyled mb-1-9">
                                    <c:choose>
                                       <c:when test="${detail.gender == 1}">
                                          <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Gender:</span> Male</li>
                                        </c:when>
                                        <c:otherwise>
                                          <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Gender:</span> Female</li>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                    <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Email:</span> ${detail.email}</li>
                                    <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Phone:</span> ${detail.phone}</li>
                                   
<!--                                    <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Club:</span> ${c.clubName}</li>-->
                                    
                                    
                                </ul>
                                
                            </div>
                        </div>
                   
                    </div>
                </div>
            </div>
<!--            <div class="col-lg-12 mb-4 mb-sm-5">
                <div>
                    <span class="section-title text-primary mb-3 mb-sm-4" >About Me</span>
                    <p></p>
                    
                </div>
            </div>-->
<!--            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 mb-4 mb-sm-5">
                        <div class="mb-4 mb-sm-5">
                            <span class="section-title text-primary mb-3 mb-sm-4">Skill</span>
                            <div class="progress-text">
                                <div class="row">
                                   
                                </div>
                            </div>
                                                 
                        </div>
                        
                    </div>
                </div>
            </div>-->
        </div>
    </div>
</section>
            
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