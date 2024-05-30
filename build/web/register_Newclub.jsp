<%-- 
    Document   : register_Newclub
    Created on : May 29, 2024, 11:02:56 AM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" href="assets/css/register_Newclub.css">
<%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>

<form  style="margin-top: 120px">
    
    <h2 style="font-size: 40px">Register New Club</h2>
  
  <label for="club-name">Tên câu lạc bộ:</label>
  <input type="text" id="club-name" name="club-name" required>
  
   <label for="image">Logo Câu Lạc Bộ:</label>
    <input type="file" id="image" name="image" accept="image/*" >
  
  <label for="club-purpose">Mục đích của câu lạc bộ:</label>
  <textarea id="club-purpose" name="club-purpose" required></textarea>
  
  <label for="club-leader">Tên chủ nhiệm câu lạc bộ:</label>
  <input type="text" id="club-leader" name="club-leader" required>
  
  <label for="club-members">Số lượng thành viên dự kiến (tối thiểu 10 thành viên):</label>
  <input type="number" id="club-members" name="club-members" min="10" required>
  

  
  <label for="club-contact">Thông tin liên hệ (email câu lạc bộ):</label>
  <input type="email" id="club-contact" name="club-contact" required>
  
  <button style="margin-top: 20px" type="submit">Đăng ký</button>
  
</form>
<%@include file="commonFunction/js.jsp" %>