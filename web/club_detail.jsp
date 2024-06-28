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
        <%@include file="commonFunction/CSS.jsp" %>
        <style>
            .club-avatar img {
                width: 250px;
                height: 250px;
            }
            .myclub-list {
                position: fixed;
                right: 0;
                top: 200px;
                width: 100px;
                display: flex;
                flex-direction: column;
                align-items: center;
                max-height: 550px;
                overflow-y: auto;
            }
            .myclub-item {
                margin: 15px;
            }
            .myclub-item img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                object-fit: cover;
            }
            .add-club-button {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background-color: #333;
                color: #fff;
                font-size: 24px;
                cursor: pointer;
                transition: transform 0.3s ease;
            }
            .add-club-button:hover {
                transform: scale(1.1);
            }
        </style>
    </head>
    <body>
        <%@include file="commonFunction/header.jsp" %>

        <main>
            <div class="container" style="margin-top: 125px">
                <div class="club-detail" style="display: flex;">
                    <div class="club-avatar col-3" style="flex: 0 0 25%; max-width: 25%;">
                        <img src="<c:out value="${club.avatar}"/>">
                    </div>
                    <div class="club-info col-9" style="flex: 0 0 75%; max-width: 75%;"> 
                        <h1><c:out value="${club.name}"/></h1>
                        <p>${requestScope.club.getDetail()} </p>
                    </div>
                </div>
            </div>

            <c:if test="${requestScope.manager==true}">       
                <div style="display: flex; justify-content: flex-start; align-items: center; margin-left: 35%">
                    <a href="add_blog?cid=${requestScope.club.getId()}" >
                        <button style="width: 70px; height: 40px; border-radius: 5px;
                                background: #f05123;border: none">Add Blog</button>
                    </a>
                    
                    <a href="add_Event?cid=${requestScope.club.getId()}" >
                        <button style="width: 70px; height: 40px; border-radius: 5px ; margin-left: 20px;
                                background: #f05123;border: none">Add Event</button>
                    </a>
                    <a href="add_Task?eventid=0&clubid=${requestScope.club.getId()}" style="margin-left: 20px">
                        <button style="width: 70px; height: 40px; border-radius: 5px;
                                background: #f05123;border: none">Add Task</button>
                    </a>
                    <a style="margin-left: 20px" >
                        <form action="task_List" method="Post">
                            <input type="hidden" name="club_id" value="${requestScope.club.getId()}">
                            <input type="hidden" name="cPage" value="1">
                            <button type="submit" style="width: 70px; height: 40px; border-radius: 5px;
                                    background: #f05123;border: none">Task List</button>
                        </form>
                    </a>
                    
                </div>

            </c:if>
            <div class="myclub-list">

                <c:forEach items="${licu}" var="lc">
                    <div class="myclub-item">
                        <a href="club_detail?id=${lc.id}">
                            <img src="${lc.avatar}" alt="Club avatar">
                        </a>
                    </div>
                </c:forEach>
            </div>
            <div class="club-info col-12" style="flex: 0 0 75%; max-width: 90%; margin-top: 40px">
                <div style="display: flex;">

                    <div class="col-6" style="flex: 1;">
                        <h2>Events of Club</h2>
                        <ul>
                            <c:forEach items="${eList}" var="event">
                                <li>
                                    <a href="event_Details?id=${event.id}" style="text-decoration: none; color: #2d2d2d;">
                                        <div style="display: flex; align-items: center; ">
                                            <div style="margin-right: 20px;">
                                                <img src="${event.avatar}" alt="Event avatar" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                                            </div>
                                            <div style="font-size: 15px">
                                                <c:out value="${event.name}"/>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="col-6" style="flex: 1;">
                        <h2>Blogs of Club</h2>
                        <ul>
                            <c:forEach items="${blogs}" var="blog">
                                <li>
                                    <div style="display: flex; align-items: center; margin-top: 15px">
                                        <div style="margin-right: 20px;">
                                            <img src="<c:out value="${blog.image}"/>" alt="Blog Image" style="width: 80px; height: 80px; object-fit: cover; border-radius: 4px;">
                                        </div>
                                        <div>
                                            <a href="BlogDetail?id=<c:out value="${blog.ID}"/>" style="text-decoration: none; color: #2d2d2d; font-size: 15px">
                                                <h3 style="font-size: 18px; margin-bottom: 5px;"><c:out value="${blog.name}"/></h3>
                                            </a>
                                            <p style="font-size: 14px; color: #888; margin-bottom: 5px;">
                                                <i class="fa fa-calendar"></i>
                                                <c:out value="${blog.date.month}"/> <c:out value="${blog.date.dayOfMonth}, ${blog.date.year}"/>
                                            </p>

                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>


                </div>
            </div>
        </main>

        <%@include file="commonFunction/footer.jsp" %>

        <!-- Scroll Up -->
        <div id="back-top">
            <a title="Go to Top" href="#"><i class="fas fa-level-up-alt"></i></a>
        </div>


        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>

    </body>
</html>