<%@ page import="Model.Blog" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Blog Detail</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <%@include file="commonFunction/CSS.jsp" %>
        <style>
            /* Global styles */
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                background-color: #f9f9f9;
                color: #333;
                margin: 0;
                padding: 0;
            }

            

            /* Breadcrumb styles */
            .breadcrumb {
                background-color: #f9f9f9;
                padding: 15px 0;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }

            .breadcrumb a {
                color: #333;
                text-decoration: none;
            }

            /* Main content styles */
            .container {
                max-width: 1200px;
                margin: 20px auto;
                padding: 0 15px;
                display: flex;
                justify-content: space-between;
            }

            .main-content {
                flex: 3;
                margin-right: 20px;
            }

            .sidebar {
                flex: 1;
            }

            .blog_details {
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .blog_details h2 {
                font-family: inherit;
                font-size: 28px;
                margin-top: 0;
            }

            .blog_details p {
                font-size: 16px;
                line-height: 1.8;
                margin-bottom: 20px;
            }

            .feature-img {
                text-align: center;
                margin-bottom: 20px;
                position: relative;
            }

            .feature-img img {
                max-width: 100%;
                height: auto;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .social-share {
                display: flex;
                justify-content: flex-start;
                margin-bottom: 20px;
            }

            .social-share button {
                margin-right: 10px;
                padding: 10px;
                border: none;
                background-color: #ddd;
                border-radius: 5px;
                cursor: pointer;
            }

            .recent-blogs {
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .recent-blog-item {
                display: flex;
                margin-bottom: 20px;
            }

            .recent-blog-item img {
                max-width: 80px;
                margin-right: 10px;
            }

            .recent-blog-item h4 {
                margin: 0;
                font-size: 16px;
            }

            .recent-blog-item p {
                margin: 5px 0;
                font-size: 14px;
                color: #777;
            }

            .pagination {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .pagination a {
                padding: 10px 20px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                text-decoration: none;
                color: #333;
                border-radius: 5px;
            }

            /* Footer styles (adjust as needed) */
            footer {
                background-color: #333;
                color: #fff;
                padding: 10px 0;
                text-align: center;
                position: relative;
                margin-top: 20px;
            }

            /* Scroll up button styles */
            #back-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                font-size: 24px;
                background-color: #333;
                color: #fff;
                padding: 10px;
                border-radius: 50%;
                display: none;
                cursor: pointer;
            }

            
        </style>
    </head>
    <body>
        <%@include file="commonFunction/header.jsp" %>

        <main>
            <section class="blog_area single-post-area section-padding">
                <div class="container">
                    <div class="main-content">
                        <div class="blog_details" >
                            <div class="feature-img">
                                <img class="img-fluid" src="<%= ((Blog) request.getAttribute("blog")).getImage() %>" alt="">
                            </div>
                            <h2 style="margin: 40px"><%= ((Blog) request.getAttribute("blog")).getName() %></h2>

                            <p style="margin: 40px"><i class="fa fa-user"></i> <%= ((Blog) request.getAttribute("blog")).getNameclub() %></p>
                            <p style="margin: 40px"><%= ((Blog) request.getAttribute("blog")).getDetails() %></p>
                        </div>
                        
                    </div>
                    <div class="sidebar">
                        <div class="recent-blogs">
                            <h3>Some Blogs</h3>
                            <c:forEach var="recentBlog" items="${recentBlogs}">
                                <div class="recent-blog-item">
                                    <a href="BlogDetail?id=${recentBlog.id}">
                                        <img src="${recentBlog.image}" alt="">
                                    </a>
                                    <div>
                                        <h4><a href="BlogDetail?id=${recentBlog.id}" style="font-family: math;">${recentBlog.name}</a></h4>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div> 
            </section>
        </main>
    </body>
    
</html>