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
</head>
<body>
    <!-- Preloader Start -->
    
    <!-- Preloader End -->
    <%@include file="commonFunction/header.jsp" %>
    <main>
        <!-- Blog Area Start -->
        <section class="blog_area section-padding" style="background-color: white">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <!-- Blog Articles -->
                            <%
                                List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
                                for (Blog blog : blogs) {
                            %>
                            <article class="blog_item">
                                <div class="blog_item_img">
                                    <img class="card-img rounded-0" src="<%= blog.getImage() %>" alt="">
                                    <a class="blog_item_date"> 
                                        <h3><%= blog.getDate().getDayOfMonth() %></h3>
                                        <p><%= blog.getDate().getMonthValue() %> <%= blog.getDate().getYear() %></p>
                                    </a>
                                </div>
                                <div class="blog_details">
                                    <a class="d-inline-block" href="BlogDetail?id=<%= blog.getID() %>">
                                        <h2 class="blog-head" style="color: #2d2d2d;"><%= blog.getName() %></h2>
                                    </a>
                                    <ul class="blog-info-link">
                                        <li><i class="fa fa-user"></i>Author Name</a></li>
                                    </ul>
                                </div>
                            </article>
                            <% } // End of for loop %>
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
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">
                            <!-- Search Form -->
                            <aside class="single_sidebar_widget search_widget">
                                <form action="#">
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder='Search Keyword'
                                                   onfocus="this.placeholder = ''"
                                                   onblur="this.placeholder = 'Search Keyword'">
                                            <div class="input-group-append">
                                                <button class="btns" type="button"><i class="ti-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                            type="submit">Search</button>
                                </form>
                                <!-- Add Blog Button -->
                                <form action="add_blog" method="get">
                                    <c:if test="${sessionScope.account.roleId != null }">
                                        <div>
                                            <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                                    type="submit">ADD</button> 
                                        </div>
                                    </c:if>
                                </form>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Area End -->
    </main>
    <%@include file="commonFunction/footer.jsp" %>
    <!-- Scroll Up -->
    <div id="back-top">
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
   
    
</body>
</html>
