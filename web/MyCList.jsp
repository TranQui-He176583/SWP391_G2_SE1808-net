<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Club"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>My Clubs</title>
        <link rel="stylesheet" href="path/to/your/css/styles.css">
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
        </style>
    </head>
    <body>
        <h1>My Clubs</h1>
        <div class="club-container">
            <%
                List<Club> clubs = (List<Club>) request.getAttribute("clubs");
                if (clubs != null && !clubs.isEmpty()) {
                    for (Club club : clubs) {
            %>
            <div class="club-card">
                <div class="club-avatar">
                    <a href="club_detail?id=<%= club.getId() %>">
                        <img src="<%= club.getAvatar() %>" alt="<%= club.getName() %>">
                    </a>
                </div>
                <div class="club-info">
                    <div class="club-name">
                        <h2><%= club.getName() %></h2>
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
        <!-- JS here -->

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

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
