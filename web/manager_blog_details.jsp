<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import = "Model.*" %>
<%@page import = "Model.Task.*" %>
<%@page import = "java.util.*" %>
<link rel="stylesheet" href="assets/css/task_list.css"/>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min_1.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="assets/css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="assets/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <!-- Css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@mdi/font@6.x/css/materialdesignicons.min.css">
        <link href="assets/css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <style>
            .dropdown-item:hover {
                color: #007bff !important;
            }
            .preview-box {
                width: 180px;
                height: 180px;
                margin-left: 80px;
                background-color: #f8f9fa;
                border-radius: 100%;
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            #preview-image {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .center-text {
                text-align: center;
            }
            .blog-details {
                margin-top: 5%;
                text-align: justify;
            }
            .form-container {
                padding: 20px;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .modal-dialog {
                max-width: 800px;
            }
            .form-control-file {
                margin-top: 10px;
            }
        </style>
    </head>

    <body>
        <!-- Loader -->
        <div class="page-wrapper doctris-theme toggled">
            <%@include file="commonFunction/header_manager.jsp"%>
            <main class="page-content bg-light">
                <%@include file="commonFunction/header_manager1.jsp"%>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div style="display: flex; justify-content: space-between;">
                            
                            <!-- Edit Button -->
                            <button type="button" style="width: 100px; height: 40px; border-radius: 5px; background: #2196f3; border: none; color: white;" data-toggle="modal" data-target="#editModal">Edit</button>
                        </div>
                        <div class="center-text">
                            <h4>${requestScope.e.getName()}</h4>
                            <img style="width: 60%; height: 70%;" src="${requestScope.e.getImage()}">
                            <p class="blog-details">${requestScope.e.getDetails()}</p>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <!-- Edit Modal -->
        <!-- Edit Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content form-container">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="edit-form" method="post" action="edit_blog" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${requestScope.e.getId()}">
                            <div class="form-group">
                                <label for="blogName">Name</label>
                                <input type="text" class="form-control" id="blogName" name="name" value="${requestScope.e.getName()}" required>
                            </div>
                            <div class="form-group">
                                <label for="blogDetails">Details</label>
                                <textarea class="form-control" id="blogDetails" name="details" required>${requestScope.e.getDetails()}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="blogImage">Image</label>
                                <input type="file" class="form-control-file" id="blogImage" name="image" onchange="previewImage(event)">
                                <div class="preview-box mt-3">
                                    <img id="preview-image" src="${requestScope.e.getImage()}" alt="Current Image">
                                </div>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                            <input type="hidden" name="clubid" value="${requestScope.e.getClubID()}">

                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min_1.css" rel="stylesheet" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script>
                                    function previewImage(event) {
                                        const reader = new FileReader();
                                        reader.onload = function () {
                                            const preview = document.getElementById('preview-image');
                                            preview.src = reader.result;
                                        }
                                        reader.readAsDataURL(event.target.files[0]);
                                    }
        </script>
    </body>
</html>
