<%-- 
    Document   : confirmRegister
    Created on : May 21, 2024, 8:40:25 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
 
<html>
    
    <body>
       <div class="login-container"> 
        <h2 style="font-size: 50px" >Email Verify</h2>
       
        <p> Enter Code in ${requestScope.email}: </p>
        <form action="confirmRegisterPassword" method="post">
            <input type="text" placeholder="Code" name="code" value="${requestScope.ucode}" required>
            <input type="hidden"  name="realcode" value="${requestScope.code}" >
            <input type="hidden"  name="email" value="${requestScope.email}" >
            <input type="hidden"  name="fullname" value="${requestScope.fullname}" >
            <input type="hidden"  name="password" value="${requestScope.password}" >
            <input type="hidden"  name="gender" value="${requestScope.gender}" >
           <p style="color: red">${requestScope.wrongCode}</p> 
         <button type="submit">Confirm</button>
        </form>
             
          </div>
    </body>
</html>
