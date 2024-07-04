<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/add_Envent.css">
        <%@include file="commonFunction/CSS.jsp" %>
        <%@include file="commonFunction/header.jsp" %>
    </head>
    <body>

        <div style="margin-top: 150px" class="login-container">
            <h2 style="font-size: 50px; text-align: center;">Add Blog</h2>
            <form action="add_blog" method="post" enctype="multipart/form-data">
                <div>
                    <label for="name">Name</label>
                    <input type="text" id="name" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>">
                    <% if (request.getAttribute("invalidName") != null) { %>
                    <div class="error-message"><%= request.getAttribute("invalidName") %></div>
                    <% } %>
                </div>

                <div>
                    <label for="image">Image</label> <br>
                    <input style="font-size: 15px; margin-top: 5px; margin-bottom: 5px;" type="file" id="image" name="image" accept="image/*">
                    <% if (request.getAttribute("invalidImage") != null) { %>
                    <div class="error-message"><%= request.getAttribute("invalidImage") %></div>
                    <% } %>
                </div>

                <div>
                    <label for="details">Detail:</label>
                    <textarea id="details" name="details" rows="5"><%= request.getAttribute("details") != null ? request.getAttribute("details") : "" %></textarea>
                    <% if (request.getAttribute("invalidDetail") != null) { %>
                    <div class="error-message"><%= request.getAttribute("invalidDetail") %></div>
                    <% } %>
                </div>

                <button type="submit">Post</button>

            </form>
        </div>

        <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
        <script>
            CKEDITOR.replace('details');
        </script>

        <style>
            .error-message {
                color: red;
                font-size: 14px;
            }
        </style>


    </body>
</html>
