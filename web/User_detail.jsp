
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        
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
    <a href="User_list.jsp"></a>
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
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
           <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css">
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
.form-group{
    padding: 10px; 
    padding-left: 0
}
.toggle-switch {
  display: flex;
  align-items: center;
  background: gray;
  border-radius: 20px;
}

.toggle-checkbox {
  display: none;
}

.toggle-label {
  display: flex;
  align-items: center;
  cursor: pointer;
  width: 60px;
  height: 34px;
  background-color: #ccc; /* Default gray background */
  border-radius: 20px;
  transition: background-color 0.3s ease;
}

.toggle-inner {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  width: 200%;
  margin-left: -0%;
  transition: margin 0.3s ease;
}

.toggle-handle {
  width: 26px;
  height: 26px;
  background-color: #fff;
  border: 2px solid #999;
  border-radius: 50%;
  transition: transform 0.3s ease;
}

.toggle-checkbox:checked + .toggle-label {
  background-color: green; /* Blue background for "active" state */
}

.toggle-checkbox:not(:checked) + .toggle-label {
  background-color: #ccc; /* Gray background for "block" state */
}

.toggle-checkbox:checked + .toggle-label .toggle-inner {
  margin-left: 0;
}

.toggle-checkbox:checked + .toggle-label .toggle-handle {
  transform: translateX(26px);
  background-color: #fff;
}
            </style>
      
  
    </head>
 
    <body>
        <!-- Loader -->
        
        <!-- Loader -->

         <div class="page-wrapper doctris-theme toggled">
         <%@include file="commonFunction/header_db.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_db_1.jsp"%>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                           
                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="dboard">DashBoard</a></li>
                                    <li class="breadcrumb-item"><a href="countUser">User</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">User Detail</li>
                                </ul>
                            </nav>
                                
                        </div>
                        
                        <div class="row">
                            
                                <div style="text-align: center"> <p style="color: red; font-size: 15px">${requestScope.wrongFormat}</p></div>
                            
                            
                            <div class="col-lg-12 col-lg-6 mt-4">
                                <div class="card rounded shadow border-0 overflow-hidden"style="display: flex">
                                   
                                    <div class="p-4">
                                      
                                      <form action="editUser" method="POST">
		<div class="row gutters">
                  
                           <input type="hidden"  name="id" value="${detail.id}" readonly required>
                            <div class="card-body">
                                        <div class="user-avatar" style="text-align: center;">
					<img src="${detail.image}" alt="Maxwell Admin"style="width: 150px;height: 150px;border-radius: 100px">
				        </div>
                              
                                        <h5 class="user-email"style="text-align: center">${detail.email}</h5>
                                        <p style="color: green; font-size: 15px;text-align: center">${requestScope.complete}</p>
                                    </div>
                                     
                                        <div class="row">
    <div class="col-lg-4">
        <div class="form-group">
            <label style="color: yellowgreen;font-weight: bold">Full Name</label>
            <input value="${detail.fullname}" type="text" class="form-control" name="fullname" minlength="1" maxlength="25">
        </div>
        <p style="color: red; font-size: 15px">${requestScope.wrongName}</p>
        <div class="form-group">
            <label style="color: yellowgreen;font-weight: bold">Phone</label>
            <input value="${detail.phone}" type="text" class="form-control" name="phone" minlength="1" maxlength="10">
        </div>
        <p style="color: red; font-size: 15px">${requestScope.wrongPhone}</p>
        <div class="form-group">
            <label style="color: yellowgreen;font-weight: bold">Club</label>
            <c:set var="clubNames" value="" />
            <c:forEach items="${listC}" var="lic" varStatus="loop">
                <c:set var="clubNames" value="${clubNames}${lic.name}${!loop.last ? ',  ' : ''}" />
            </c:forEach>
            <input value="${clubNames}" type="text" class="form-control" name="club" readonly>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="form-group">
            <label style="color: yellowgreen; font-weight: bold">Role</label>
            <div class="context-role" style="margin-top: 5px; display: flex;">
  <div style="flex: 1;">
    <div style="display: flex; align-items: center; margin-bottom: 10px;">
      <input ${detail.roleId == 1 ? 'checked' : ''} value="1" type="radio" name="roleId" style="font-size: 10px; margin-right: 10px;">
      Admin
    </div>
  </div>
  <div style="flex: 1;">
    <div style="display: flex; align-items: center; margin-bottom: 10px;">
      <input ${detail.roleId == 3 ? 'checked' : ''} value="3" type="radio" name="roleId" style="font-size: 10px; margin-right: 10px;">
      NormalUser
    </div>
    
  </div>
</div>
        </div>
        <div class="form-group">
            <label style="color: yellowgreen; font-weight: bold">Gender</label>
            <div class="context-gender" style="display: flex;margin-top: 5px;">
                <div style="display: flex; align-items: center;">
                    <input ${detail.gender == 1 ? 'checked' : ''} value="1" type="radio" name="gender" style="font-size: 10px;  margin-right: 10px">
                    Male
                </div>
                <div style="display: flex; align-items: center; margin-left: 20px;">
                    <input ${detail.gender== 2 ? 'checked' : ''} value="2" type="radio" name="gender" style="font-size: 10px;  margin-right: 10px">
                    Female
                </div>
            </div>
        </div>
        <div class="form-group">
            <label style="color: yellowgreen; font-weight: bold">Status</label>
            <div class="context-status" style="display: flex;margin-top: 5px;">
                <div style="display: flex; align-items: center;">
                    <input ${detail.status == 1 ? 'checked' : ''} value="1" type="radio" name="status" style="font-size: 10px;  margin-right: 10px">
                    active
                </div>
                <div style="display: flex; align-items: center; margin-left: 20px;">
                    <input ${detail.status== 0 ? 'checked' : ''} value="0" type="radio" name="status" style="font-size: 10px;  margin-right: 10px">
                    block
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="form-group">
            <label style="color: yellowgreen;font-weight: bold">Note</label>
            <textarea class="form-control" name="note" rows="6">${detail.note}</textarea>
        </div>
    </div>
</div>

<div class="row gutters">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="text-right" style="padding-left: 610px;display: flex">
            <a href="" class="btn btn-success" style="margin-right: 5px">Cancel</a>
            <button type="submit" name="submit" class="btn btn-primary" style="background: green">Save</button>
        </div>
    </div>
</div>
                                
		</div>
	
      </form>
                                     
                                    </div>
                                </div>
                            </div><!--end col-->
        
        
                        </div><!--end row-->
                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> � Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
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
            

           
        </div>
        <!-- Offcanvas End -->

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