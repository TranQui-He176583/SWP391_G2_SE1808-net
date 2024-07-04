<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác nhận xóa</title>
</head>
<body>
 <form id="delete-form" method="post" action="/delete-servlet">
  <input type="hidden" id="record-id" name="recordId">
  <button type="button" onclick="confirmDelete(1, 'Bản ghi 1')">Xóa</button>
</form>


</body>
</html>