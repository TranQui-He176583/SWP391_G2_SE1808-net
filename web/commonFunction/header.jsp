<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import = "Model.*" %>
<%@page import = "Model.Task.*" %>
<%@page import = "java.util.*" %>


<header  >
    <!--? Header Start -->
    <div style="background: #f05123; height: 118px" class="header-area header-transparent">
        <div class="main-header header-sticky">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <!-- Logo -->
                    <div class="col-xl-2 col-lg-2 col-md-1">
                        <div class="logo">
                            <a  href="Home"><img style="border-radius: 5px" src="assets/img/logo/logofpt.png" alt="" width   ="80%" height="100%"></a>
                        </div>
                    </div>
                    <div class="col-xl-10 col-lg-10 col-md-10">
                        <div class="menu-main d-flex align-items-center justify-content-end">
                            <!-- Main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="ClubList">Club</a></li>
                                        <li><a href="blog">Blog</a></li>
                                        <li><a href="get_EvenList_ClubId?search=&cPage=1&clubid=0">Event</a></li>
                                        <li><a href="addContact">Contact</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <c:if test="${sessionScope.account.roleId == null}">      
                                <div class="header-right-btn f-right d-none d-lg-block ml-30">
                                    <a href="LoginAccount" class="btn header-btn">Sign in</a>
                                    <span style="margin-right: 20px;"></span>
                                    <a href="RegisterAccount" class="btn header-btn">Sign up</a>
                                </div>
                            </c:if>  

                            <c:if test="${sessionScope.account.roleId != null}">                                  
                                <div class="image-container">

                                    <c:if test="${sessionScope.account.image == null }">  

                                        <img style="width: 28px; margin-top: -10px" src="assets/img/avatar/Avatar1.png" class="img-fluid"
                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    </c:if>

                                    <c:if test="${sessionScope.account.image != null}">  

                                        <img style="width: 28px; margin-top: -10px" src="${sessionScope.account.image}" class="img-fluid"
                                             data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    </c:if>

                                    <div style="margin-top: 20px" class="dropdown-menu"> 
                                        <c:if test="${sessionScope.account.roleId == 1}">  

                                            <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="dboard">Admin</a>
                                        </c:if>
                                        <c:if test="${sessionScope.isManager == true}">
                                            <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="manager_club?cPage=1">Manager</a>
                                        </c:if>
                                        <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="Profile">Information</a>
                                        <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="myclublist">My Club List</a>                                       
                                        <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="task_List?search=&cPage=1&club_id=&event_id=">My Task</a>
                                        <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="Change_Password">Change Password</a>                                       
                                        <a style="font-size: 14px; font-weight: bold " class="dropdown-item" href="logout">Log Out</a>                           
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>   
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Header End -->

</header>
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>