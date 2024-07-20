<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header>
    <!--? Header Start -->
    <div>
   <nav id="sidebar" class="sidebar-wrapper"style="background: aliceblue;">
                <div class="sidebar-content" data-simplebar style="height: calc(100% - 60px);">
                    <div class="sidebar-brand" style="font-size: 20px;background: white;">
                        <a style="text-align: center" href="Home"><img src="assets/img/logo/logofpt.png" alt="" width ="50%" height="50%">
                  
                        </a>
                    </div>
                    
                    <ul class="sidebar-menu pt-3">
                        <li><a href="manager_club?cPage=1"><i class="uil uil-dashboard me-2 d-inline-block"></i>Club</a></li>
                    

                        <li><a href="manager_event?cPage=1"><i class="uil uil-club me-2 d-inline-block"></i>Event</a></li>
                        
                       
                        
                        
                       <li><a href="manage_registerEvent?club_id=&cPage=1&event_id="><i class="uil uil-envelope me-2 d-inline-block"></i>Register Event</a></li>

                        <li><a href="event_Reminders"><i class="uil uil-link-alt me-2 d-inline-block"></i>Event Reminders</a> </li>
                    </ul>
                </div>
         
            </nav>
    
    </div>

</header>

        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
