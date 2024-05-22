<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Information</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: white;
            display: flex;
            justify-contenxt: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .account-info-container {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 650px;
            margin: 0 auto;
        }
        
        .account-info {
            display: flex;
            align-items: center;
        }
        
        .account-info img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            margin-right: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        
        .account-info-details {
            flex-grow: 1;
        }
        
        .account-info-details .detail-row {
            display: flex;
            margin-bottom: 16px;
            font-size: 15px;
        }
        
        .account-info-details .detail-row .detail-label {
            width: 150px;
            font-weight: bold;
            color: #333333;
        }
        
        .account-info-details .detail-row .detail-value {
            flex-grow: 1;
            color: #555555;
        }
        
        .account-info-details h2 {
            color: #000000;
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
        }
        button {
  background-color: black;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  font-size: 20px;
}
    </style>
</head>
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
<body>
    <c:if test="${sessionScope.account.email == null}">      
                    <% request.getRequestDispatcher("login.jsp").forward(request, response); %>
           </c:if>
    <div class="account-info-container">
        <div class="account-info">
           <c:if test="${sessionScope.account.image == null}">      
                    <img src="assets/img/avatar/Avatar1.png" alt="Profile Picture">
           </c:if>  
                    
           <c:if test="${sessionScope.account.image != null}">   
<!--               <a href="changeAvatar.jsp"> -->
                   <img src="${sessionScope.account.image}" alt="Profile Picture">
<!--               </a>-->
           </c:if> 
                    
            <img src="profile-picture.jpg" alt="Profile Picture">
            <div class="account-info-details">
                <h2 style="text-align: left;" >Account Profile</h2>
                <div class="detail-row">
                    <div class="detail-label">Email:</div>
                    <div style="font-weight: bold" class="detail-value">${sessionScope.account.email}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Full Name:</div>
                    <div style="font-weight: bold" class="detail-value">${sessionScope.account.fullname}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Password:</div>
                    <div style="font-weight: bold" class="detail-value">********</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Gender:</div>
                    
                    <c:if test="${sessionScope.account.gender == 1}">   
                    <div style="font-weight: bold" class="detail-value">Male</div>
                    </c:if> 
                    <c:if test="${sessionScope.account.gender == 2}">   
                    <div style="font-weight: bold" class="detail-value">Female</div>
                    </c:if> 
                    <c:if test="${sessionScope.account.gender == 3}">   
                    <div style="font-weight: bold" class="detail-value">Other</div>
                    </c:if> 
                </div>
                <div class="detail-row">
                    <div class="detail-label">Phone:</div>
                    <div style="font-weight: bold" class="detail-value">${sessionScope.account.phone}</div>
                </div>
                
                <a href="changeInformation.jsp">
                <button>Change Information</button>
                </a>
            </div>
        </div>
    </div>
</body>
</html>