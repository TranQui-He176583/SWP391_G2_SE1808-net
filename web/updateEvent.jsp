<%-- 
    Document   : changeEvent
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
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">
      Edit Event</div>
</div>
    <body>
                    
       <div  class="login-container">
        <form action="edit_Event" method="post" enctype="multipart/form-data" >
            <input type="hidden" name="id" value="${requestScope.id}" > 
            <input type="hidden" id="clubid" name="clubid" value="${requestScope.club_id}"  >
            <div style="display: flex; ">
                <div style="width: 65%">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="${requestScope.name}" >
    <p style="color: red">${requestScope.invalidName}</p>
    <p style="color: red">${requestScope.invalidlName}</p>
  </div>
  <div style="width: 15%; ">
      <label style="margin-left: 30%" for="time">Time:</label>
    <input style="margin-left: 30%" type="datetime-local" id="time" name="time" value="${requestScope.time}"  >

    <p style="color: red; margin-left: 30%">${requestScope.invalidTime}</p>
  </div>
          </div>
  <div style="display: flex; ">
      <div style="width: 65%">
          <label  for="location">Location:</label>
    <input type="text" id="location" name="location" value="${requestScope.location}">
    <p style="color: red">${requestScope.invalidLocation}</p>
    <p style="color: red">${requestScope.invalidlLocation}</p>
  </div>
  <div style="width: 15%; margin-left: 4.5%  ">
      <label  for="image">Avatar of Event:</label> <br>
      <input style=" font-size: 15px" type="file" id="image" name="image" accept="image/*" onchange="previewImage()">
       <p style="color: red">${requestScope.invalidImage}</p> 
    <br>
    <img id="preview" src="#" alt="Preview" style="max-width: 200px; max-height: 200px; display: none;">
    
</div>
  <script>
      function previewImage() {
    var preview = document.getElementById('preview');
    var file = document.getElementById('image').files[0];
    var reader = new FileReader();

    reader.onloadend = function () {
        preview.src = reader.result;
        preview.style.display = 'block';
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
        preview.style.display = 'none';
    }
}      
  </script>
      
    <input type="hidden" id="clubid" name="clubid" value="${requestScope.cid}">  

   </div>  
  <div>
    <label for="details">Details:</label>
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
