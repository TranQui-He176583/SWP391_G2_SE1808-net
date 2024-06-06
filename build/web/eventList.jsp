<%-- 
    Document   : eventList
    Created on : Jun 4, 2024, 1:15:35 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>
<%@page import = "java.util.*" %>
<%
     List<Event> eList = (List<Event>) request.getAttribute("eList");
    
    %>
 <%@include file="commonFunction/CSS.jsp" %>
         <%@include file="commonFunction/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="position: relative;">
  <img style="margin-top: 120px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Event List</div>
</div>
     <%
     for (int i=1;i<=(eList.size())/3+1;i++) {
                      
     %>   
       <div  style="display: flex; margin-top: 30px;margin-left: 100px">
           <%
   if (i*3>eList.size()) {
            for (int j=(i-1)*3;j<eList.size();j++) { 
  
     %> 
     <div  style="margin-left: 50px;width: 370px; height: 230px; margin-top: 80px">
               <a href="event_Details?id=<%=eList.get(j).getId()%>">
                   <img style="width: 370px; height: 230px; " src="<%= eList.get(j).getAvatar()%>" alt="alt"/>
               </a>
               <div  >
                   <h2  style="font-size:20px; font-family: none; width: 100%;  " ><%=eList.get(j).getName()%></h2>
                   <svg style="width: 20px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path 
                   d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm0 18c-4.411 0-8-3.589-8-8s3.589-8 8-8 8 3.589 8 8-3.589 8-8 8z">
                           
                   </path><path d="M13 7h-2v6h6v-2h-4z"></path></svg> <span style="font-size: 15px"> <%=eList.get(j).getDate().toLocalDate()%>  </span>
               </div>
           </div>
               <%}
} else {
                for (int j=(i-1)*3;j<=i*3-1;j++) { 
            
     %> 
           <div style="margin-left: 50px;width: 370px; height: 230px; margin-top: 100px" >
               <a href="event_Details?id=<%=eList.get(j).getId()%>">
                   <img style="width: 370px; height: 230px; " src="<%= eList.get(j).getAvatar()%>" alt="alt"/>
               </a>
               
                   <h2  style="font-size:20px; font-family: none; width: 100%; " ><%=eList.get(j).getName()%></h2>
                   <svg style="width: 13px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path 
                   d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm0 18c-4.411 0-8-3.589-8-8s3.589-8 8-8 8 3.589 8 8-3.589 8-8 8z">
                           
                   </path><path d="M13 7h-2v6h6v-2h-4z"></path></svg> <span style="font-size: 13px"> <%=eList.get(j).getDate().toLocalDate()%>  </span>
               
           </div>
               <%}
}
        %>
               </div>
        <%}

        %>
       
    </body>
    
    <% int nPage = (int) request.getAttribute("nPage");
        
    %>
    <div style="text-align: center; margin-top: 80px">
        <%  for (int i=1;i<=nPage;i++) {        
            %>
            <a href="get_EvenList_ClubId?cPage=<%=i%>">
            <span style="font-size: 15px; margin-left: 7px; border: 2px solid  orangered; padding: 7px; color: black"><%=i%></span>
          </a>
    
    <%}%>
    </div>
</html>
