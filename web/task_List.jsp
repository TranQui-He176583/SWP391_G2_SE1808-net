<%-- 
    Document   : task_List
    Created on : Jun 15, 2024, 10:30:12 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>
<%@page import = "Model.Task.*" %>
<%@page import = "java.util.*" %>
    
<link rel="stylesheet" href="assets/css/task_list.css"/>
<!DOCTYPE html>
<%
         List<Task> tList = (List<Task>) request.getAttribute("tList");
         int nPage = (int) request.getAttribute("nPage");
%>
<html>
    <%@include file="commonFunction/CSS.jsp" %>
<%@include file="commonFunction/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <div style="position: relative;">
  <img style="margin-top: 110px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Task List</div>
</div>

    </head>
    
    <body>
        <c:if test="${requestScope.typeSearch == true}">                                                                         
        <form style="margin-left :10%; margin-top: 3%" id="formSearch"action="task_List" method="post"> 
                    <label style="border: 1px solid; padding: 5px">
                        <input style="width: 300px; height: 40px; font-size: 15px"  type="text" value="${requestScope.search}" name="search" placeholder="Seach...." >
                        <input type="hidden" name="club_id" value="${requestScope.club_id}">
                        <input type="hidden" name="cPage" value="1">
                                                 <span> 
                                     <button style="width: 40px; background: #f05123;border: none;border-radius: 5px;margin-top: -5px;background-color: transparent;">
                            <img style="width:40px;background: #f05123;border-radius: 5px;padding: 10px;margin-top:-5px;margin-left: -5px  "
                                 src="assets/img/logo/searchlogo.webp" alt="alt"/></span> 
                                      </button>
                    </label>
                </form>
       </c:if>
        <c:if test="${requestScope.typeSearch == false}">                                                                         
        <form style="margin-left :10%; margin-top: 3%" id="formSearch"action="task_List" method="get"> 
                    <label style="border: 1px solid; padding: 5px">
                        <input style="width: 300px; height: 40px; font-size: 15px"  type="text" value="${requestScope.search}" name="search" placeholder="Seach...." >                      
                        <input type="hidden" name="cPage" value="1">
                                                 <span> 
                                     <button style="width: 40px; background: #f05123;border: none;border-radius: 5px;margin-top: -5px;background-color: transparent;">
                            <img style="width:40px;background: #f05123;border-radius: 5px;padding: 10px;margin-top:-5px;margin-left: -5px  "
                                 src="assets/img/logo/searchlogo.webp" alt="alt"/></span> 
                                      </button>
                    </label>
                </form>
       </c:if>
         <div class="containerr">
   
    <ul class="task-list">
        <li>
            <div style="font-size: 35px" class="task-name">Task Name</div>
            <c:if test="${requestScope.typeSearch == true}"> 
            <div  style="font-size: 35px;text-align: center;" class="task-name">Update</div>      
            </c:if>
            <div  style="font-size: 35px;text-align: right;" class="task-name">Status</div>
        </li>
        
        
    <%
        for (int i=0;i<tList.size();i++) {
    %>  
    <a href="task_Details?task_id=<%=tList.get(i).getId()%>">
      <li>
        <div class="task-name"><%=tList.get(i).getName()%></div>
        <c:if test="${requestScope.typeSearch == true}">  
            <form action="task_Update" method="get" style="margin-right: 25%">
                <input type ="hidden" name="task_id" value="<%=tList.get(i).getId()%>">
            <button style="width: 100px; height: 30px; border-radius: 20px; background: lightblue;color: black; border: none;" type="submit">Update</button>
        </form>
        </c:if>
      <%if (tList.get(i).isStatus()) {%> 
        <div class="status in-progress">Đang thực hiện</div>
        <%} else {%>
        <div class="status completed">Đã hoàn thành</div>
        <%}%>
      </li>
     </a>
     <%
        }
        
    %>
    </ul>
  </div>
     
<div style="text-align: center; margin-top: 150px">
      <c:if test="${requestScope.typeSearch == true}">   
  <% for (int i = 1; i <= nPage; i++) { %>
  <form style="display: inline-block;" action="task_List" method="post">
      <input type="hidden" name ="search" value="${requestScope.serach}">
      <input type="hidden" name ="club_id" value="${requestScope.club_id}">
      <input type="hidden" name ="cPage" value="<%=i%>">
    <button style="font-size: 15px; margin-left: 7px; border: 2px solid orangered; padding: 7px; color: black; background: white;width: 40px"><%=i%></button>
  </form>
  <% } %>
   </c:if>
    
    <c:if test="${requestScope.typeSearch == false}">   
  <% for (int i = 1; i <= nPage; i++) { %>
  <form style="display: inline-block;" action="task_List" method="get">
      <input type="hidden" name ="search" value="${requestScope.serach}">
      <input type="hidden" name ="cPage" value="<%=i%>">
    <button style="font-size: 15px; margin-left: 7px; border: 2px solid orangered; padding: 7px; color: black; background: white;width: 40px"><%=i%></button>
  </form>
  <% } %>
   </c:if>
</div>

    </body>
</html>
<%@include file="commonFunction/footer.jsp" %>