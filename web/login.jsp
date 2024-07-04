<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
 
  <link rel="stylesheet" href="assets/css/Login.css">  
</head>
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>

<body>
    
    <div style="margin-top: 30px" class="login-container">
        <h2 style="font-size: 50px;" >Login</h2>
        <form action="login" method="post">
            <input type="text" placeholder="Username" name="username" value="${requestScope.email}" required>
            <input type="password" placeholder="Password" name="password" value="${requestScope.password}" required>
            
            
            <button type="submit">Login</button>
        </form>
        <p style="color: green; font-size: 14px" >${requestScope.completeRegister}</p>
        <p style="color: green; font-size: 14px" >${requestScope.cPassword}</p>
            <p style="color: red; font-size: 14px" >${requestScope.wrongLogin}</p>
        <div class="links">
            <a style="font-size: 13px" href=forgotPassword.jsp>Forgot Password?</a>
            <a style="font-size: 13px" href="register.jsp">Sign Up</a>
        </div>
        <div class="separator"><span>or</span></div>
        <a style="color: black" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid

&redirect_uri=http://localhost:9999/SWP/loginGoogle

&response_type=code

&client_id=164431467380-npfbq2oqttd0peo0fhjjnfj1vorq39he.apps.googleusercontent.com

&approval_prompt=force">
                Login With Google            
            </a>
        
        

                    

                    

                   

        
    </div>
    
    </body>
</html>
