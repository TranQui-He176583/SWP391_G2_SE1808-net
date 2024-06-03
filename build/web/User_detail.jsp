
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <html>

        <head>
            <title>User Management Application</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
            <%@include file="commonFunction/CSS_1.jsp" %>
            <style>
                body {
    margin: 0;
    padding-top: 40px;
    color: #2e323c;
    background: #f5f6fa;
    position: relative;
    height: 100%;
  
}
.account-settings .user-profile {
    margin: 0 0 1rem 0;
    padding-bottom: 1rem;
    text-align: center;
}
.account-settings .user-profile .user-avatar {
    margin: 0 0 1rem 0;
}
.account-settings .user-profile .user-avatar img {
    width: 90px;
    height: 90px;
    -webkit-border-radius: 100px;
    -moz-border-radius: 100px;
    border-radius: 100px;
}
.account-settings .user-profile h5.user-name {
    margin: 0 0 0.5rem 0;
}
.account-settings .user-profile h6.user-email {
    margin: 0;
    font-size: 0.8rem;
    font-weight: 400;
    color: #9fa8b9;
}
.account-settings .about {
    margin: 2rem 0 0 0;
    text-align: center;
}
.account-settings .about h5 {
    margin: 0 0 15px 0;
    color: #007ae1;
}
.account-settings .about p {
    font-size: 0.825rem;
}
.form-control {
    border: 1px solid #cfd1d8;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    font-size: .825rem;
    background: #ffffff;
    color: #2e323c;
}

.card {
    background: #ffffff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
    margin-bottom: 1rem;
}
            </style>
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
                    <img src="assets/img/logo/logofpt.png" alt=""  >
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
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
					<img src="${detail.image}" alt="Maxwell Admin">
				</div>
				<h5 class="user-name">${detail.fullname}</h5>
				<h6 class="user-email">${detail.email}</h6>
			</div>
			
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
    
	<div class="card-body">
           <form action="editUser" method="POST">
		<div class="row gutters">
                  
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                           <input type="hidden"  name="id" value="${detail.id}" readonly required>
				<div class="form-group">
                                    <label style="color: yellowgreen;font-weight: bold">Full Name</label>
                                        <input value="${detail.fullname}" type="text" class="form-control" name="fullname">
				</div>
			</div>
			<div class="form-group">
                           <label style="color: yellowgreen; font-weight: bold">Role</label>
                          <div class="context-gender" style="display: flex;">
    <div style="display: flex; align-items: center;">
        <input ${detail.roleId== 1 ? 'checked' : ''} value="1" type="radio" class="form-control" name="roleId" style="font-size: 10px;  margin-right: 10px">
        Admin
    </div>
    <div style="display: flex; align-items: center; margin-left: 20px;">
        <input ${detail.roleId== 2 ? 'checked' : ''} value="2" type="radio" class="form-control" name="roleId" style="font-size: 10px;  margin-right: 10px">
        Manager
    </div>
    
    <div style="display: flex; align-items: center; margin-left: 20px;">
        <input ${detail.roleId== 3 ? 'checked' : ''} value="3" type="radio" class="form-control" name="roleId" style="font-size: 10px;  margin-right: 10px">
        NormalUser
    </div>
</div>
</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label style="color: yellowgreen;font-weight: bold">Phone</label>
					<input  value="${detail.phone}"type="text" class="form-control" name="phone" >
				</div>
			</div>
			<div class="form-group">
                           <label style="color: yellowgreen; font-weight: bold">Gender</label>
                           <div class="context-gender" style="display: flex;">
                               
<div style="display: flex; align-items: center;">
    <input ${detail.gender == 1 ? 'checked' : ''} value="1" type="radio" class="form-control" name="gender" style="font-size: 10px;  margin-right: 10px">
    Male
</div>
<div style="display: flex; align-items: center; margin-left: 20px;">
    <input ${detail.gender== 2 ? 'checked' : ''} value="2" type="radio" class="form-control" name="gender" style="font-size: 10px;  margin-right: 10px">
    Female
</div>
                        </div>
</div>
                               
                                
		</div>
		
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="text-right"">
                                    
                                <button type="submit" name="submit" class="btn btn-primary" style="background: green">Edit</button>
                                       
				</div>
			</div>
		</div>
      </form>
	</div>
  
</div>
</div>
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