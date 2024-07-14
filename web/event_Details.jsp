<%-- 
    Document   : event_Details
    Created on : Jun 5, 2024, 8:51:31 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>

<%@page import = "java.util.*" %>
<!DOCTYPE html>
<%
        Event e = new Event();
        e = (Event)request.getAttribute("Event");
        Club c = new Club();
        c = (Club)request.getAttribute("club");
         
%>

<html>
    <%@include file="commonFunction/CSS.jsp" %>
    <%@include file="commonFunction/header.jsp" %>
    
    <body >
        <div class="row" style="margin-top: 180px;">
          <div class="col-9" style="">
                  
              <div style="margin-left: 50px">
               <div style="display: flex; align-items: center; justify-content: center;">
                    <h1 style="font-family: Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 500; margin-right: 10px;">
                        <%= e.getName()%>
                         </h1>
                        <c:if test="${requestScope.manager==true}">         
<!--                         <a href="edit_Event?id=<%=e.getId()%>">
                                          <img style="width: 20px;" src="assets/img/logo/edit.jpg" alt="alt" />
                                            </a>-->
                                        
                      </c:if>                    
</div>
                <p style="margin-top: 20px;font-weight: bold">Time: <%=e.getDate().toLocalDate()%> At:<%=e.getDate().toLocalTime()%> </p>
                <p style="font-weight: bold;">Location: <%=e.getLocation()%></p>
                <a href="club_detail?id=<%=c.getId()%>">
                    <p style="font-weight: bold;"> Club: <%=c.getName()%> </p> 
                </a>
                <p><%=e.getDetails()%></p>
            </div>
         </div>
            <div  class="col-3">

<!--          <div style="display: flex">
              <a href="add_Task?eventid=<%=e.getId()%>&clubid=<%=c.getId()%>">
                <button style=" background: white; color: black; margin-bottom: 20px;
                        border-radius: 5px;border: 2px  solid #f05123; width: 60px; height: 40px" >Add Task</button>
                </a>
                
              <a style="margin-left: 5%" href="edit_Event?id=<%=e.getId()%>">
                <button style=" background: white; color: black; margin-bottom: 20px;
                        border-radius: 5px;border: 2px  solid #f05123; width: 60px; height: 40px" >Update</button>
                </a>
                 <form style="margin-left: 5%" id="delete-form" method="post" action="event_Delete">
                     <input type="hidden" id="record-id" name="event_id" value="<%=e.getId()%>">  
  <button type="button" onclick="confirmDelete(1, 'Bản ghi 1')" style=" background: white; color: black; margin-bottom: 20px;
                        border-radius: 5px;border: 2px  solid #f05123; width: 60px; height: 40px" >Delete</button>
                    </form>
             </div>    
   <script>
function confirmDelete(recordId, recordName) {
  if (confirm("Bạn có chắc chắn muốn xóa Event này không?")) {
    document.getElementById('delete-form').submit();
  } else {
    console.log("Hủy bỏ thao tác xóa");
  }
}
</script>             -->
 <%@include file="commonFunction/slider_newEvent.jsp" %>
      
    
  </div>
 
</div>
        
    </body>
</html>
 <%@include file="commonFunction/footer.jsp" %>