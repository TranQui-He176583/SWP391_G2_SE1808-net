<%@ page import="Model.Blog" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>

<style>
    .feature-img {
        text-align: center;
    }
    .feature-img img {
        display: inline-block;
        max-width: 100%;
        height: auto;
    }
</style>

<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Blog Detail</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <%@include file="commonFunction/CSS.jsp" %>
    </head>
    <body>
        <%@include file="commonFunction/header.jsp" %>
        <main>
            <section class="blog_area single-post-area section-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 posts-list">
                            <div class="single-post">
                                <div class="feature-img" >
                                    <img class="img-fluid" src="<%= ((Blog) request.getAttribute("blog")).getImage() %>" alt="">
                                </div>
                                <div class="blog_details">

                                    <h2><%= ((Blog) request.getAttribute("blog")).getName() %></h2>
                                    <p class="fa fa-user"> <%= ((Blog) request.getAttribute("blog")).getNameclub() %></p>
                                    <p><%= ((Blog) request.getAttribute("blog")).getDetails() %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <%@include file="commonFunction/footer.jsp" %>
        <!-- Scroll Up -->
        <div id="back-top">
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>
        <!-- JS here -->

    </body>
</html>
