<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <!--? Header Start -->
    <div class="header-area header-transparent">
        <div class="main-header header-sticky">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <!-- Logo -->
                    <div class="col-xl-2 col-lg-2 col-md-1">
                        <div class="logo" style="opacity: 1;">
                            <a href="index.jsp"><img src="assets/img/logo/banner.jpg" alt="" ></a>
                        </div>
                    </div>
                    <div class="col-xl-10 col-lg-10 col-md-10">
                        <div class="menu-main d-flex align-items-center justify-content-end">
                            <!-- Main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="index.jsp">Home page</a></li>
                                        <li><a href="blog.jsp">Blog</a>
                                            <ul class="submenu">
                                                <li><a href="blog.jsp">Blog</a></li>
                                                <li><a href="blog_details.jsp">Blog Details</a></li>
                                                <li><a href="elements.jsp">Element</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="contact.jsp">Contact</a></li>
                                    </ul>
                                </nav>
                            </div>
                        <c:if test="${sessionScope.account.roleId == null}">      
                            <div class="header-right-btn f-right d-none d-lg-block ml-30">
                                <a href="login.jsp" class="btn header-btn">Sign in</a>
                                <span style="margin-right: 20px;"></span>
                                <a href="register.jsp" class="btn header-btn">Sign up</a>
                            </div>
                         </c:if>  
                        
                         <c:if test="${sessionScope.account.roleId != null}">                                  
                             
                             
                             <div class="image-container">
                                    <img style="width: 28px; margin-top: -10px" src="assets/img/logo/userlogo2.jpg" class="img-fluid"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <div class="dropdown-menu"> 
                                   <a style="font-size: 13px" class="dropdown-item" href="#">Thông tin cá nhân</a>
                                   <a style="font-size: 13px" class="dropdown-item" href="logout">Đăng xuất</a>                           
                                </div>
                            </div>
                         </c:if>     
                           
}
                           
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