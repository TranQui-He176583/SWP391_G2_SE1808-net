<!DOCTYPE html>
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
    
    <div class="login-container">
        <h2 style="font-size: 50px" >Login</h2>
        <form action="login" method="post">
            <input type="email" placeholder="Username" name="username" required>
            <input type="password" placeholder="Password" name="password" required>
            
            
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