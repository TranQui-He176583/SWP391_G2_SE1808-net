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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">

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
            width: 70%;
            display: flex;
            justify-content: center;
            position: relative;
        }

        .club-item {
            width: 250px;
            height: 255px;
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
            margin: 0 10px; /* Add horizontal margin to create space between items */
            padding-top: 10px; /* Add padding to move the image down */
        }

        .club-item img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin: auto; /* Center the image within its container */
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

        .slick-prev, .slick-next {
            width: 30px;
            height: 30px;
            z-index: 1000;
        }

        .slick-prev:before, .slick-next:before {
            font-size: 30px;
            color: black;
        }

    </style>
</head>
<body>
    <h1>My Club</h1>
    <div class="club-list-container slider">
        <%
            List<Club> clubs = (List<Club>) request.getAttribute("clubs");
            if (clubs != null && !clubs.isEmpty()) {
                for (Club club : clubs) {
                    if (club.getStatus() == 1) {
        %>
        <div class="club-item">
            <a href="club_detail?id=<%= club.getId() %>">
                <img src="<%= club.getAvatar() %>" alt="Logo of <%= club.getName() %>">
                <p class="club-name"><%= club.getName() %></p>
            </a>
        </div>
        <%
                    }
                }
            } else {
        %>
        <p>No clubs available</p>
        <% 
            }
        %>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.slider').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                prevArrow: '<button type="button" class="slick-prev">&larr;</button>',
                nextArrow: '<button type="button" class="slick-next">&rarr;</button>',
                infinite: true
            });
        });
    </script>
</body>
</html>