<%-- 
    Document   : add_club
    Created on : Jun 7, 2024, 11:35:30 AM
    Author     : Duong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="assets/css/add_Envent.css"> 
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div style="margin-top: 150px" class="login-container">
            <h2 style="font-size: 50px; text-align: center;" >Add Club</h2>
            <form action="add_blog" method="post" enctype="multipart/form-data" >
                <div>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div>
                    <label style="" for="image">Avatar</label> <br>
                    <input style="font-size: 15px;
                           margin-top: 5px;
                           margin-bottom: 5px;" type="file" id="image" name="image" accept="image/*" >
                </div>
                <button type="submit">ADD</button>

            </form>
        </div>

    </body>


    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>

</html>