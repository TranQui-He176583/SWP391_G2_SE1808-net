<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
                position: relative;
            }
            .myclub-item img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                object-fit: cover;
            }
            .myclub-item:hover .tooltip {
                visibility: visible;
                opacity: 1;
            }
            .tooltip {
                visibility: hidden;
                opacity: 0;
                width: 120px;
                background-color: #333;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px;
                position: absolute;
                z-index: 1;
                bottom: 125%;
                left: 50%;
                margin-left: -60px;
                transition: opacity 0.3s;
            }
            .tooltip::after {
                content: "";
                position: absolute;
                top: 100%;
                left: 50%;
                margin-left: -5px;
                border-width: 5px;
                border-style: solid;
                border-color: #333 transparent transparent transparent;
            }
            .register-button {
                display: flex;
                justify-content: center;
                margin-top: 40px;
            }
            .register-button button {
                width: 200px;
                padding: 15px;
                border-radius: 25px;
                background-color: #f05123;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 18px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s ease, transform 0.3s ease;
            }
            .register-button button:hover {
                background-color: #d9441f;
                transform: translateY(-2px);
            }
            .register-button button:active {
                background-color: #c0381a;
                transform: translateY(0);
            }
            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
            }
            .modal-content {
                background-color: white;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 400px;
                text-align: center;
            }
            .modal-button {
                margin: 10px;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            .accept-button {
                background-color: #4CAF50;
                color: white;
            }
            .accept-button:hover {
                background-color: #45a049;
            }
            .reject-button {
                background-color: #f44336;
                color: white;
            }
            .reject-button:hover {
                background-color: #da190b;
            }
        </style>
        <script>
            function showModal(event) {
                event.preventDefault();
                document.getElementById('confirmationModal').style.display = 'block';
            }

            function closeModal() {
                document.getElementById('confirmationModal').style.display = 'none';
            }

            function acceptRegistration() {
                document.getElementById('registrationForm').submit();
            }
        </script>
    </head>
    <body>
        <%@include file="commonFunction/header.jsp" %>
        <section class="blog_area single-post-area section-padding" style="margin: 150px">
            <main>
                <div class="container" >
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
                <c:if test="${sessionScope.account.roleId != null && requestScope.member == null}">
                    <div class="register-button">
                        <form id="registrationForm" action="add_member" method="post">
                            <input type="hidden" name="clubId" value="${requestScope.club.getId()}">
                            <button type="submit" onclick="showModal(event)">Register</button>
                        </form>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account.roleId == null}">
                    <div class="register-button">
                        <form action="login" method="post">
                            <input type="hidden" name="clubId" value="${requestScope.club.getId()}">
                            <button type="submit">Register</button>
                        </form>
                    </div>
                </c:if>
                <c:if test="${requestScope.member == true && requestScope.check == true}">
                    <div style="display: flex; justify-content: flex-start; align-items: center; margin-left: 30%">
                        <a href="add_blog?cid=${requestScope.club.getId()}">
                            <button style="width: 70px; height: 40px; border-radius: 5px; background: #f05123; border: none">Add Blog</button>
                        </a>
                        <c:if test="${requestScope.manager == true}">  
                            <a href="add_Event?cid=${requestScope.club.getId()}">
                                <button style="width: 70px; height: 40px; border-radius: 5px; margin-left: 20px; background: #f05123; border: none">Add Event</button>
                            </a>
                            <a href="add_Task?eventid=0&clubid=${requestScope.club.getId()}" style="margin-left: 20px">
                                <button style="width: 70px; height: 40px; border-radius: 5px; background: #f05123; border: none">Add Task</button>
                            </a>
                            <a style="margin-left: 20px">
                                <form action="task_List" method="Post">
                                    <input type="hidden" name="club_id" value="${requestScope.club.getId()}">
                                    <input type="hidden" name="cPage" value="1">
                                    <button type="submit" style="width: 70px; height: 40px; border-radius: 5px; background: #f05123; border: none">Task List</button>
                                </form>
                            </a>
                            <a href="ClubMembers?clubid=${requestScope.club.getId()}" style="margin-left: 20px;">
                                <form action="ClubMembers" method="post" style="display: inline;">
                                    <input type="hidden" name="clubid" value="${requestScope.club.getId()}">
                                    <input type="hidden" name="status" value="1">
                                    <button type="submit" style="width: 70px; height: 40px; border-radius: 5px; background: #f05123; border: none;">Members</button>
                                </form>
                            </a>
                        </c:if>
                    </div>
                </c:if> 

                <div class="club-info col-12" style="flex: 0 0 75%; max-width: 90%; margin-top: 40px">
                    <div style="display: flex;">
                        <div class="col-6" style="flex: 1;">
                            <h2>Events of Club</h2>
                            <ul>
                                <c:forEach var="event" items="${eList}" varStatus="status">
                                    <c:if test="${status.index < 3}">
                                        <li>
                                            <a href="event_Details?id=${event.id}" style="text-decoration: none; color: #2d2d2d;">
                                                <div style="display: flex; align-items: center;">
                                                    <div style="margin-right: 20px;">
                                                        <img src="${event.avatar}" alt="Event avatar" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                                                    </div>
                                                    <p style="font-size: 18px; margin-bottom: 5px;">
                                                        <c:out value="${event.name}"/>
                                                    </p>
                                                </div>
                                            </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="col-6" style="flex: 1;">
                            <h2>Blogs of Club</h2>
                            <ul>
                                <c:forEach var="blog" items="${blogs}" varStatus="status">
                                    <c:if test="${status.index < 3}">
                                        <li>
                                            <div style="display: flex; align-items: center; margin-top: 15px">
                                                <div style="margin-right: 20px;">
                                                    <img src="<c:out value="${blog.image}"/>" alt="Blog Image" style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover;">
                                                </div>
                                                <div>
                                                    <a href="BlogDetail?id=<c:out value="${blog.ID}"/>" style="text-decoration: none; color: #2d2d2d; font-size: 15px">
                                                        <p style="font-size: 18px; margin-bottom: 5px;"><c:out value="${blog.name}"/></p>
                                                    </a>
                                                    <p style="font-size: 14px; color: #888; margin-bottom: 5px;">
                                                        <i class="fa fa-calendar"></i>
                                                        <c:out value="${blog.date.month}"/> <c:out value="${blog.date.dayOfMonth}, ${blog.date.year}"/>
                                                    </p>
                                                </div>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </main>
        </section>

        <%@include file="commonFunction/footer.jsp" %>

        <!-- Scroll Up -->
        <div id="back-top">
            <a title="Go to Top" href="#"><i class="fas fa-level-up-alt"></i></a>
        </div>

        <div id="confirmationModal" class="modal">
            <div class="modal-content">
                <h2>Xác nhận đăng ký</h2>
                <p>Bạn muốn đăng ký vào câu lạc bộ này không?</p>
                <button class="modal-button accept-button" onclick="acceptRegistration()">Xác nhận</button>
                <button class="modal-button reject-button" onclick="closeModal()">Hủy</button>
            </div>
        </div>

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    </body>
</html>
