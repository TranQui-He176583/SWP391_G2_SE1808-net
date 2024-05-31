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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
    <c:if test="${sessionScope.account.email == null}">      
                    <% request.getRequestDispatcher("login.jsp").forward(request, response); %>
           </c:if>
    
    <div style="margin-top: 80px" class="signup-container">
        <h2 style="font-size: 50px;">Change Information</h2>
        <form action="changeInformation" method="post" enctype="multipart/form-data">
            <label for="image"></label>
    <input type="file" id="image" name="image" accept="image/*" ><br><br>
    <input type="text" value="${sessionScope.account.fullname}" name="fullname" id="fullname" required>
   
            
            <select required name="gender">
                <option value="" disabled selected>Gender</option>
                <option value="1">Male</option>
                <option value="2">Female</option>
                <option value="3">Other</option>
            </select>
    <input type="text" placeholder="Phone Number" value="${sessionScope.account.phone}" name="phone" minlength="10" maxlength="11" >     
            
            <button type="submit">Change</button>
        </form>
        
    </div>
</body>
</html>