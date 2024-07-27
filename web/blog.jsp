<%@ page import="java.util.List" %>
<%@ page import="Model.Blog" %>

<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Blog</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <%@include file="commonFunction/CSS.jsp" %>
        <style>
            .blog_item_img img {
                width: 100%;
                height: auto;
                transition: transform 0.3s ease;
                object-fit: cover;
            }
            .blog_item_img:hover img {
                transform: scale(1.1);
            }


        </style>
    </head>
    <body>
        <!-- Preloader Start -->

        <!-- Preloader End -->
        <%@include file="commonFunction/header.jsp" %>

        <div class="container" style="margin-top: 150px;">
            <div class="row">
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget" style="padding: 0px">
                            <form action="blog" method="get">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" name="searchName" placeholder='Search Keyword'
                                               onfocus="this.placeholder = ''"
                                               onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btns" type="submit"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>

                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                        type="submit">Search</button>
                            </form>
                        </aside>
                    </div>
                </div>
            </div>
        </div>

        <main>            
            <div class="container" style="margin-top: 20px">
                <div class="row">
                    <div class="col-lg-12 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <!-- Blog Articles -->
                            <div class="row">
                                <%
                                    List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
                                    for (Blog blog : blogs) {
                                %>
                                <div class="col-lg-4">
                                    <article class="blog_item">
                                        <div class="blog_item_img">
                                            <a href="BlogDetail?id=<%= blog.getID() %>">
                                                <img class="card-img rounded-0" style="width: 100%; height: 350px;" src="<%= blog.getImage() %>" alt="">
                                            </a>
                                            <a class="blog_item_date">
                                                <h3><%= blog.getDate().getMonth().name() %></h3>
                                                <p><%= blog.getDate().getDayOfMonth()%> <%= blog.getDate().getYear() %></p>
                                            </a>
                                        </div>
                                        <div class="blog_details">
                                            <a class="d-inline-block" href="BlogDetail?id=<%= blog.getID() %>">
                                                <h2 class="blog-head" style="font-family: inherit; font-size: 20px; color: #2d2d2d;"><%= blog.getName() %></h2>
                                            </a>
                                            <ul class="blog-info-link">
                                                <li><i class="fa fa-user"></i><%= blog.getNameclub() %></li>
                                            </ul>
                                        </div>
                                    </article>
                                </div>

                                <% } %>
                            </div>
                            <!-- Pagination -->
                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a href="blog?page=${currentPage - 1}" class="page-link" aria-label="Previous">
                                                <i class="ti-angle-left"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                            <a href="blog?page=${i}" class="page-link">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a href="blog?page=${currentPage + 1}" class="page-link" aria-label="Next">
                                                <i class="ti-angle-right"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="commonFunction/footer.jsp" %>
        <!-- Scroll Up -->
        <div id="back-top">
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>

    </body>
</html>
