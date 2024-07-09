<%-- 
    Document   : add_Event
    Created on : Jun 1, 2024, 4:01:07 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <link rel="stylesheet" href="assets/css/add_Envent.css"> 
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <div style="position: relative;">
  <img style="margin-top: 110px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Add New Event</div>
</div>
    <body>
                    
        <div  class="login-container">
        <form action="add_Event" method="post" enctype="multipart/form-data" >
            <div>
    <label for="name">Tên sự kiện:</label>
    <input type="text" id="name" name="name" value="${requestScope.name}" >
    <p style="color: red">${requestScope.invalidName}</p>
    <p style="color: red">${requestScope.invalidlName}</p>
  </div>
  
  <div>
  
      <label style="" for="image">Avatar of Event</label> <br>
      <input style="font-size: 15px;
    margin-top: 5px;
    margin-bottom: 5px;" type="file" id="image" name="image" accept="image/*"" value="${requestScope.image}" >
  </div>
    <p style="color: red">${requestScope.invalidImage}</p>
            
    
    <input type="hidden" id="clubid" name="clubid" value="${requestScope.cid}"  >
   
  <div>
    <label for="time">Thời gian:</label>
    <input type="datetime-local" id="time" name="time" value="${requestScope.time}"  >
    <p style="color: red">${requestScope.invalidTime}</p>
  </div>
  
  <div>
    <label for="location">Địa điểm:</label>
    <input type="text" id="location" name="location" value="${requestScope.location}">
    <p style="color: red">${requestScope.invalidLocation}</p>
    <p style="color: red">${requestScope.invalidlLocation}</p>
  </div>
  
  <div>
    <label for="details">Chi tiết:</label>
    <textarea  id="details" name="details"  rows="10"  " > ${requestScope.detail} </textarea>
    <p style="color: red">${requestScope.invalidDetail}</p>
  </div>
  
  <button type="submit">Lưu sự kiện</button>
   
        </form>
                </div>
        <script>
           $(document).ready(function() {
  CKEDITOR.replace('details');
});
        </script>       
        
    </body>
  
  
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
   
</html>
