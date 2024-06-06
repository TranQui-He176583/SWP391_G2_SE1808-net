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
    <body>
                    
        <div style="margin-top: 150px" class="login-container">
        <h2 style="font-size: 50px; text-align: center;" >Add new Event</h2>
        <form action="add_Event" method="post" enctype="multipart/form-data" >
            <div>
    <label for="name">Tên sự kiện:</label>
    <input type="text" id="name" name="name" required>
  </div>
  
  <div>
  
      <label style="" for="image">Avatar of Event</label> <br>
      <input style="font-size: 15px;
    margin-top: 5px;
    margin-bottom: 5px;" type="file" id="image" name="image" accept="image/*" >
  </div>
  
  <div>
    <label for="time">Thời gian:</label>
    <input type="datetime-local" id="time" name="time" required>
  </div>
  
  <div>
    <label for="location">Địa điểm:</label>
    <input type="text" id="location" name="location" required>
  </div>
  
  <div>
    <label for="details">Chi tiết:</label>
    <textarea id="details" name="details" rows="10" required></textarea>
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
