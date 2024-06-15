<!doctype html>
<html class="no-js" lang="zxx">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%@page import = "Model.*" %>
    <%@page import = "java.util.*" %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Club List</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <%@include file="commonFunction/CSS.jsp" %>

        <%
//    List<Club> cList = (List<Club>) request.getAttribute("cList");   
//    int nPage = (int) request.getAttribute("nPage");
        %>

        <style>
            .club-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: space-between;
            }
            .club-card {
                width: calc(33.4% - 20px);
                padding: 10px;
                border-radius: 5px;
                text-align: center;
                margin-bottom: 20px;
            }
            .club-avatar img {
                width: 150px;
                height: 150px;
            }
            .club-name {
                
                margin-top: 10px;
                font-size: 1.2em;
                font-weight: bold;
            }

            .club-info {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .outer-container {
                padding: 0 500px;
            }
        </style>


    </head>
    <body>
        <%@include file="commonFunction/header.jsp" %>
        <main>
            <div class="outer-container">
                <div class="club-container" style="margin-top: 120px">
                    <%
                        List<Club> cList = (List<Club>) request.getAttribute("cList");
                        if (cList != null && !cList.isEmpty()) {
                            for (int i = 0; i < cList.size(); i++) {
                                Club club = cList.get(i);
                    %>
                    <div class="club-card">
                        <div class="club-avatar">
                            <a href="club_detail?id=<%= club.getId() %>">
                                <img src="<%= club.getAvatar() %>" alt="<%= club.getName() %>">
                            </a>
                        </div>
                        <div class="club-info">
                            <div class="club-name">
                                <h1><%= club.getName() %></h1>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        } else {
                    %>
                    <p>No clubs available</p>
                    <%
                        }
                    %>
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
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="./assets/js/jquery.slicknav.min.js"></script>
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        <script src="./assets/js/plugins.js"></script>
    </body>
</html>
