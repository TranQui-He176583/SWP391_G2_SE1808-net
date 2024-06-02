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
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="164431467380-npfbq2oqttd0peo0fhjjnfj1vorq39he.apps.googleusercontent.com">
    <script>
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            document.getElementById('googleEmail').value = profile.getEmail();
             document.getElementById('googleFullName').value = profile.getName();
        document.querySelector('googleLogin').submit();
            
        }
    </script>
</head>
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>

<body>
    
    <div style="margin-top: 100px" class="login-container">
        <h2 style="font-size: 50px" >Change Password</h2>
        <form action=   "change_F_Password" method="post">
            <p>Password can be from 6 to 20 characters</p>
            <input type="hidden"  name="email" value="${requestScope.email}" readonly required>
            <input type="password" placeholder="New Password" name="npassword" minlength="6" maxlength="20" value="${requestScope.np}" required>
            <input type="password" placeholder="Confirm New Password" name="cpassword" minlength="6" maxlength="20" value="${requestScope.cp}" required>
            <p style="color:red" >${requestScope.wrong}</p>
         <button type="submit">Change</button>
        </form>
       
</body>

</html>

