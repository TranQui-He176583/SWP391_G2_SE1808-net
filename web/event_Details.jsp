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
         List<Event> eList = (List<Event>) request.getAttribute("eList");
%>

<html>
    <%@include file="commonFunction/CSS.jsp" %>
    <%@include file="commonFunction/header.jsp" %>
    
    <body >
        <div class="row" style="margin-top: 180px;">
          <div class="col-9" style="">
              <c:if test="${requestScope.manager==true}"> 
              <a href="add_Task?eventid=<%=e.getId()%>&clubid=<%=c.getId()%>">
                <button style="margin-left: 50px; background: black; margin-bottom: 20px;border-radius: 5px;border: #f05123; width: 60px; height: 40px" >Add Task</button>
                </a>
                 </c:if>     
              <div style="margin-left: 50px">
               <div style="display: flex; align-items: center; justify-content: center;">
                    <h1 style="font-family: Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 500; margin-right: 10px;">
                        <%= e.getName()%>
                         </h1>
                        <c:if test="${requestScope.manager==true}">         
                         <a href="edit_Event?id=<%=e.getId()%>">
                                          <img style="width: 20px;" src="assets/img/logo/edit.jpg" alt="alt" />
                                            </a>
                                        
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
  <div class="col-3">
     <form id="formSearch"action="get_EvenList_ClubId" method="get"> 
                    <label style="border: 1px solid; padding: 5px">
                        <input style="width: 200px; height: 40px; font-size: 15px"  type="text" value="${requestScope.search}" name="search" placeholder="Seach...." >
                        <input type="hidden" name="cPage" value=1>
                        <input type="hidden" name="clubid" value=0>
                                                 <span> 
                                     <button style="width: 40px; background: #f05123;border: none;border-radius: 5px;margin-top: -5px;background-color: transparent;">
                            <img style="width:40px;background: #f05123;border-radius: 5px;padding: 10px;margin-top:-5px;margin-left: -5px  "
                                 src="assets/img/logo/searchlogo.webp" alt="alt"/></span> 
                                      </button>
                    </label>
                </form>
                                                 <br><br><br><br><br><br><br>
    <%
        for (int i=0;i<eList.size();i++) {

    %>
    <div style="margin-left: 30px;width: 200px">
        <a href="event_Details?id=<%=eList.get(i).getId()%>" style=" width: 150px; height: 100px">
            <img style="width: 160px; height: 150px" src="<%=eList.get(i).getAvatar()%>" alt="alt"/>
            <p style="width: 100%; font-weight: bold"> <%=eList.get(i).getName()%></p>
            <p style="font-size: 13px; margin-top: -20px"><%=eList.get(i).getDate().toLocalDate()%></p>
            
        </a>
    </div>
       <%}%> 
  </div>
 
</div>
        
    </body>
</html>
 <%@include file="commonFunction/footer.jsp" %>