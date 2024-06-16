<%-- 
    Document   : club_detail
    Created on : Jun 7, 2024, 9:04:56 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Club Detail</title>
        <%@include file="commonFunction/CSS.jsp" %> <!-- Đưa vào các file CSS cần thiết -->

        <style>
            .club-avatar img {
                width: 250px; 
                height: 250px;

            }
        </style>
    </head>
    <body>
        <%@include file="commonFunction/header.jsp" %>

        <main>
            
            <div class="container" style="margin-top: 125px">
                
                
                <div class="club-detail" style="display: flex; margin-top: 50px">
                    <div class="club-avatar col-3" style="flex: 0 0 25%; max-width: 25%;">
                        <img src="<c:out value="${club.avatar}"/>">
                    </div>
                    <div class="club-info col-9" style="flex: 0 0 75%; max-width: 75%;"> 
                        <h1><c:out value="${club.name}"/></h1>
                        <p><strong>Description:</strong> ${requestScope.club.getDetail()} </p>
                  <c:if test="${requestScope.manager==true}">       
                      <a href="add_Event?cid=${requestScope.club.getId()}" >
                        <button style="width: 70px; height: 40px; border-radius: 5px;
                                background: #f05123;border: none">Add Event</button>
                    </a>
                        
                      <a href="add_Task?eventid=0&clubid=${requestScope.club.getId()}" style="margin-left: 20px">
                    <button style="width: 70px; height: 40px; border-radius: 5px;
                                background: #f05123;border: none">Add Task</button>
                    </a>
                     </c:if>         
                    </div>
                </div>
            </div>  
                    
        </main>

                    
        <%@include file="commonFunction/footer.jsp" %>

        <!-- Scroll Up -->
        <div id="back-top">
            <a title="Go to Top" href="#"><i class="fas fa-level-up-alt"></i></a>
        </div>

        <!-- JS here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- Include các file JavaScript cần thiết -->
    </body>
</html>
