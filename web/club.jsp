<%@page import="java.util.List"%>
<%@page import="Model.Club"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Club List</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <%@include file="commonFunction/CSS.jsp" %>

    <style>
        .add-club-button {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            font-size: 80px;
            font-weight: bold;
            color: #6c757d;
            cursor: pointer;
        }
        .outer-container {
            display: flex;
            justify-content: space-between;
            padding: 0 50px;
            margin-top: 120px;
        }
        .search-container {
            width: 25%;
        }
        .club-container {
            display: flex;
            flex-wrap: wrap;
            gap: 50px;
            justify-content: flex-start;
            width: 75%;
        }
        .club-card {
            flex: 1 1 calc(35%);
            max-width: 20%;
            box-sizing: border-box;
            margin: 20px;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }
        .club-avatar img {
            width: 150px;
            height: 150px;
            object-fit: cover;
        }
        .club-name {
            margin-top: 10px;
            font-size: 1.2em;
            font-weight: bold;
        }
        .club-info {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .category-filters {
            margin-top: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            background-color: #f9f9f9;
        }

        .category-filters h3 {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .category-filters ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .category-filters ul li {
            margin-bottom: 5px;
        }

        .category-filters ul li a {
            display: block;
            padding: 8px 16px;
            text-decoration: none;
            color: #333;
            transition: background-color 0.3s ease;
        }

        .category-filters ul li a:hover {
            background-color: #ddd;
        }
    </style>



</head>
<body>
    <%@include file="commonFunction/header.jsp" %>
    <main>
        <div class="outer-container">
            <div class="search-container">
                <div class="blog_right_sidebar">
                    <aside class="single_sidebar_widget search_widget" style="padding: 0px">
                        <form action="#">
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" placeholder='Search'
                                           onfocus="this.placeholder = ''"
                                           onblur="this.placeholder = 'Search'"  <input type="text" name="search" placeholder="Search clubs" value="<%= request.getAttribute("searchQuery") != null ? request.getAttribute("searchQuery") : "" %>">
                                    <div class="input-group-append">
                                        <button class="btns" type="button"><i class="ti-search"></i></button>
                                    </div>
                                </div>
                            </div>
                            <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">Search</button>
                        </form>


                        <form action="add_club" method="get">
                            <c:if test="${sessionScope.account.roleId != null }">
                                <div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                            type="submit">ADD</button> 
                                </div>
                            </c:if>
                        </form>
                    </aside>
                </div>
                <div class="category-filters">
                    <h3>Categories</h3>
                    <ul>
                        <li><a href="ClubList">All</a></li>
                        <li><a href="ClubList?category=Võ%20Thuật">Võ Thuật</a></li>
                        <li><a href="ClubList?category=Nghệ%20Thuật">Nghệ Thuật</a></li>
                        <li><a href="ClubList?category=Học%20Thuật">Học Thuật</a></li>
                        <li><a href="ClubList?category=Cộng%20Đồng">Cộng Đồng</a></li>
                    </ul>
                </div>

            </div>
            <div class="club-container">
                <%
                    List<Club> cList = (List<Club>) request.getAttribute("cList");
                    String selectedCategory = (String) request.getAttribute("selectedCategory");
                    if (cList != null && !cList.isEmpty()) {
                        for (Club club : cList) {
                %>
                <div class="club-card">
                    <div class="club-avatar">
                        <a href="club_detail?id=<%= club.getId() %>">
                            <img src="<%= club.getAvatar() %>" alt="<%= club.getName() %>">
                        </a>
                    </div>
                    <div class="club-info">
                        <div class="club-name">
                            <h1><%= club.getName() %></h1>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p>Not found clubs</p>
                <%
                    }
                %>
            </div>
        </div>
        <c:if test="${sessionScope.account.roleId != null}">
            <a href="add_club">
                <div class="add-club-button">
                    +
                </div>
            </a>
        </c:if>
        <nav class="blog-pagination justify-content-center d-flex">
            <ul class="pagination">
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a href="ClubList?page=${currentPage - 1}" class="page-link" aria-label="Previous">
                            <i class="previous">prev</i>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a href="ClubList?page=${i}" class="page-link">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a href="ClubList?page=${currentPage + 1}" class="page-link" aria-label="Next">
                            <i class="next">next</i>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </main>
    <%@include file="commonFunction/footer.jsp" %>
    <!-- Scroll Up -->
    <div id="back-top">
        <a title="Go to Top" href="#"><i class="fas fa-level-up-alt"></i></a>
    </div>
</body>
</html>
