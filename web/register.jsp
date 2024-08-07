<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #000000;
            color: black;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .signup-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .signup-container h2 {
            margin-bottom: 20px;
            color: black;
        }
        .signup-container input,
        .signup-container select {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #444444;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: white;
            color: black;
        }
        .signup-container button {
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
       
        .signup-container .links {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        .signup-container .links a {
            color: #4CAF50;
            text-decoration: none;
        }
        .signup-container .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>

 <link rel="stylesheet" href="assets/css/formI-A-PassWord.css">

<body>
    
    <div style="margin-top: 150px" class="signup-container">
        <h2 style="font-size: 50px;">Sign Up</h2>
        <form style="" action="sendMailRegister" method="post">
            <input type="text" placeholder="Full Name" name="fullname" id="fullname" value="${requestScope.fullname}" >
            <p style="color: red;  font-size: 15px; text-align: left; margin-left:3%">${requestScope.wrongName}</p>     
            
            <input type="email" placeholder="Email" name="email" value="${requestScope.email}" >
            <p style="color: red;  font-size: 15px; text-align: left; margin-left:3%">${requestScope.wrongEmail}</p>
            
            <input type="password" placeholder="Password" name="password" minlength="6" maxlength="20" value="${requestScope.password}">
            <p style="color: red;  font-size: 15px; text-align: left; margin-left:3% ">${requestScope.wrongPassWord}</p>
            
            <input type="password" placeholder="Confirm Password" name="cpassword"  value="${requestScope.cpassword}">  
            <p style="color: red;  font-size: 15px; text-align: left; margin-left:3%">${requestScope.wrongCPassWord}</p>
            
            <p style="color: red;  font-size: 15px; text-align: left; margin-left:3%">${requestScope.wrongRegister}</p>
            <button type="submit">Sign Up</button>
        </form>
        <div class="links">
            <a style="color: black;font-size: 15px" href="login.jsp">Already have an account? Login</a>
        </div>
    </div>
</body>
</html>