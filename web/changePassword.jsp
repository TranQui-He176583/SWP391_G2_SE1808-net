<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
           
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #333333;
        }
        .login-container input {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .login-container button {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            background-color: #313831;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
       
        .login-container .separator {
            margin: 20px 0;
            text-align: center;
            border-bottom: 1px solid #ddd;
            line-height: 0.1em;
        }
        .login-container .separator span {
            background: #fff;
            padding: 0 10px;
            color: #888;
        }
        .g-signin2 {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        .login-container .links {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .login-container .links a {
            color: black;
            text-decoration: none;
        }
        .login-container .links a:hover {
            text-decoration: underline;
        }
    </style>
    
</head>
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>

<body>
    <c:if test="${sessionScope.account.email != null}"> 
        <div style="margin-top: 100px" class="login-container">
        <h2 style="font-size: 50px" >Change Password</h2>
        <form action="changePassword" method="post">
            <p>Password can be from 6 to 20 characters</p>
            <input type="hidden" name="email"  value="${sessionScope.account.email}" required>
            <input type="password" placeholder="Old Password" name="oldPassword"  value="${requestScope.password}" >
            <p style="font-size: 14px; color: red; text-align: left; margin-left: 4%">${requestScope.wrongLogin}</p>
            
            <input type="password" placeholder="New Password" name="newPassword" value="${requestScope.newpassword}">
            <p style="font-size: 14px; color: red; text-align: left; margin-left: 4%">${requestScope.wrong1}</p>
            
            <input type="password" placeholder="Confirm Password" name="confirmPassword"  value="${requestScope.confirmpassword}">
            <p style="font-size: 14px; color: red; text-align: left; margin-left: 4%">${requestScope.wrong2}</p>
            
            <button type="submit">Change</button>
        </form>
             </div>
    </c:if>
        
   
    <c:if test="${sessionScope.account.email == null}">      
                    <% request.getRequestDispatcher("login.jsp").forward(request, response); %>
           </c:if>
    </body>

</html>