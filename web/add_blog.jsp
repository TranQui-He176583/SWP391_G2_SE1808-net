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
                    <input style="font-size: 15px; margin-top: 5px; margin-bottom: 5px;" type="file" id="image" name="image" accept="image/*" onchange="previewImage(event)">
                    <% if (request.getAttribute("invalidImage") != null) { %>
                    <div class="error-message"><%= request.getAttribute("invalidImage") %></div>
                    <% } %>
                    <br>
                    <img id="imagePreview" src="#" alt="Image Preview" style="max-width: 200px; display: none;">
                </div>

                <div>
                    <label for="details">Detail:</label>
                    <textarea id="details" name="details" rows="5"><%= request.getAttribute("details") != null ? request.getAttribute("details") : "" %></textarea>
                    <% if (request.getAttribute("invalidDetail") != null) { %>
                    <div class="error-message"><%= request.getAttribute("invalidDetail") %></div>
                    <% } %>
                </div>

                <input type="hidden" id="clubid" name="clubid" value="${requestScope.cid}">

                <button type="submit">Post</button>

            </form>
        </div>

        <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
        <script>
                        CKEDITOR.replace('details');

                        function previewImage(event) {
                            var input = event.target;
                            var preview = document.getElementById('imagePreview');
                            preview.style.display = 'block';
                            preview.src = URL.createObjectURL(input.files[0]);
                        }
        </script>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }

            .login-container {
                margin-top: 150px;
                text-align: center;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                max-width: 600px;
                margin: auto;
            }

            .login-container h2 {
                font-size: 50px;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
            }

            .form-group input[type="text"],
            .form-group textarea {
                width: calc(100% - 20px);
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .form-group input[type="file"] {
                font-size: 15px;
                margin-top: 5px;
                margin-bottom: 5px;
            }

            .form-group textarea {
                resize: vertical;
            }

            .form-group .error-message {
                color: red;
                font-size: 14px;
                margin-top: 5px;
            }

            .form-group button[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .form-group button[type="submit"]:hover {
                background-color: #45a049;
            }

            #imagePreview {
                max-width: 200px;
                display: flex;
                margin-top: 10px;
            }
            .error-message {
                color: red;
                font-size: 14px;
            }
        </style>

    </body>
</html>
