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
<script>
    $(document).ready(function () {
        CKEDITOR.replace('detail');
        function previewImage(input) {
            var file = input.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#imagePreview').attr('src', e.target.result);
            }

            if (file) {
                reader.readAsDataURL(file);
                $('#imagePreview').show();
            } else {
                $('#imagePreview').attr('src', '#');
                $('#imagePreview').hide();
            }
        }
        $("#avatar").change(function () {
            previewImage(this);
        });
    });
</script>
<style>
    .form-row {
        display: grid;
        grid-template-columns: 1fr 20%;
        gap: 20px;
    }

    .form-column {
        display: flex;
        flex-direction: column;
    }

    .category-column {
        grid-column: 2;
    }

    .form-column select {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        background-color: #f8f9fa;
        transition: border-color 0.3s ease;
    }

    .form-column select:focus {
        border-color: #007bff;
        outline: none;
    }

    .form-column label {
        margin-bottom: 8px;
        font-weight: bold;
    }

    .category-column {
        padding-left: 10px;
        border-left: 1px solid #ccc;
    }

    .form-column input {
        margin-bottom: 10px;
    }

    #imagePreview {
        max-width: 100%;
        max-height: 200px;
        margin-top: 10px;
        display: none;
    }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Club</title>
        <style>
            .error-message {
                color: red;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div style="margin-top: 150px" class="login-container">
            <h2 style="font-size: 50px; text-align: center;" >Add Club</h2>
            <form action="add_club" method="post" enctype="multipart/form-data">
                <div class="form-row">
                    <input type="hidden" id="username" name="username" value="<%= session.getAttribute("username") %>">

                    <div class="form-column">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>">
                        <% if (request.getAttribute("invalidName") != null) { %>
                        <div class="error-message"><%= request.getAttribute("invalidName") %></div>
                        <% } %>
                    </div>
                    <div class="form-column category-column">
                        <label for="category">Category</label>
                        <select id="category" name="category">
                            <option value="">Select category</option>
                            <option value="Võ Thuật">Võ Thuật</option>
                            <option value="Nghệ Thuật">Nghệ Thuật</option>
                            <option value="Học Thuật">Học Thuật</option>
                            <option value="Cộng Đồng">Cộng Đồng</option>
                        </select>
                        <% if (request.getAttribute("invalidCategory") != null) { %>
                        <div class="error-message"><%= request.getAttribute("invalidCategory") %></div>
                        <% } %>
                    </div>
                </div>

                <div>
                    <label style="" for="avatar">Avatar</label> <br>
                    <input style="font-size: 15px; margin-top: 5px; margin-bottom: 5px;" type="file" id="avatar" name="avatar" accept="image/*">
                    <img id="imagePreview" src="#" alt="Image Preview">
                    <% if (request.getAttribute("invalidImage") != null) { %>
                    <div class="error-message"><%= request.getAttribute("invalidImage") %></div>
                    <% } %>
                </div>

                <div>
                    <label for="detail">Description</label>
                    <textarea id="detail" name="detail" rows="5" ><%= request.getAttribute("detail") != null ? request.getAttribute("detail") : "" %></textarea>
                    <% if (request.getAttribute("invalidDetail") != null) { %>
                    <div class="error-message"><%= request.getAttribute("invalidDetail") %></div>
                    <% } %>
                </div>

                <button type="submit">ADD</button>
            </form>
        </div>
    </body>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
</html>
