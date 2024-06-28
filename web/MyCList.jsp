<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Model.Club"%>
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Clubs</title>
    <link rel="stylesheet" href="styles.css">
    
    
    <style>
        body {
            background-color: #fff;
            color: #000;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        
        h1 {
            margin-bottom: 20px;
        }

        .club-list-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .club-item {
            width: 250px;
            height: 280px;
            background-color: orange;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            cursor: pointer;
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .club-item img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
        }

        .club-name {
            margin-top: 10px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            color: #fff;
        }

        .club-item:hover {
            transform: scale(1.1);
        }

        .add-profile {
            width: 120px;
            height: 120px;
            background-color: #333;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .add-profile:hover {
            transform: scale(1.1);
        }

        
    </style>
</head>
<body>
    <h1>My Club</h1>
    <div class="club-list-container">
        <%
            List<Club> clubs = (List<Club>) request.getAttribute("clubs");
            if (clubs != null && !clubs.isEmpty()) {
                for (Club club : clubs) {
        %>
        <div class="club-item">
            <a href="club_detail?id=<%= club.getId() %>">
                <img src="<%= club.getAvatar() %>" alt="Logo of <%= club.getName() %>">
                <p class="club-name"><%= club.getName() %></p>
            </a>
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

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
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
    <script src="./assets/js/main.js"></script>
</body>
</html>
