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
         ClubDAO cDAO = new ClubDAO();
         List<Club> cList = (List<Club>) request.getAttribute("cList");
         List<Event> eList = (List<Event>) request.getAttribute("eList");
         String cE =(String) request.getAttribute("cE");
        String cC =(String) request.getAttribute("cC");
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
        <div style="display: flex; justify-content: space-between"> 
            <div>
        <c:if test="${requestScope.typeSearch == true}">                                                                         
        <form style="margin-left :5%; margin-top: 2%; width: 400px" id="formSearch"action="task_List" method="post"> 
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
        <form style="margin-left :5%; margin-top: 2%; width: 400px" id="formSearch"action="task_List" method="get"> 
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
                 
       </div>
             <c:if test="${requestScope.typeSearch == false}"> 
         <div style=" height: 35px; font-size: 18px; margin-top: 10px">
             <form action="task_List" id="selectClub" onchange="submitForm()" method="get" >
                    <input type="hidden" name="event_id" value="${requestScope.cE}">
                    <input type="hidden" name="cPage" value="1">
                    <input type="hidden" name ="search"value="${requestScope.search}" >
                    <label style="border: 1px solid; background:#f05123; border-radius: 5px;width: 120px; height: 35px; padding: 4px " for="options">Select Club:</label>
                    <select style="color:#f05123;height: 35px; padding: 4px" id="options" name="club_id">

                        <option value=""> All Club</option> 
                        <%   for (int i=0;i<(cList.size());i++) { 
                               if (String.valueOf(cList.get(i).getId()).equals(cC) ) {
                        %>
                        <option value="<%=cList.get(i).getId()%>" selected> <%=cList.get(i).getName()%> </option >
                        <%} else {
                        %>
                        <option value="<%=cList.get(i).getId()%>" > <%=cList.get(i).getName()%> </option >
                        <%}}%>
                    </select>       
                </form>
                <script>
                    function submitForm() {
                        document.getElementById("selectClub").submit();
                    }
                </script>

            </div> 
           </c:if>
          <div style=" height: 35px; font-size: 17px; margin-top: 15px; margin-right: 2%">
               <c:if test="${requestScope.typeSearch == false}"> 
                   <form id="selectEvent" onchange="submit()" action="task_List" method="get">
               </c:if>
                 <c:if test="${requestScope.typeSearch == true}">       
                <form id="selectEvent" onchange="submit()" action="task_List" method="post">
                 </c:if>
                    <input type="hidden" name="cPage" value="1">
                    <input type="hidden" name="club_id" value="${requestScope.club_id}">
                    <input type="hidden" name ="search"value="${requestScope.search}" >
                    <label style="border: 1px solid; background:#f05123; border-radius: 5px;width: 120px; height: 35px; padding: 4px " for="options">Select Event:</label>
                    <select style="color:black;height: 35px; padding: 4px; width: 200px;" id="options" name="event_id">
                        <option value=""> All Event</option>
                  <%    
                  if ("0".equals(cE) ) {
                  %>     
                  <option value="0" selected=""> None Event</option> <% }else {%>
                   <option value="0" > None Event</option>      <%}%>
                   
                        <%   for (int i=0;i<(eList.size());i++) { 
                               if (String.valueOf(eList.get(i).getId()).equals(cE) ) {
                        %>
                        <option value="<%=eList.get(i).getId()%>" selected> <%=eList.get(i).getName()%> </option >
                        <%} else {
                        %>
                        <option value="<%=eList.get(i).getId()%>" > <%=eList.get(i).getName()%> </option >
                        <%}}%>
                    </select>       
                </form>
                <script>
                    function submit() {
                        document.getElementById("selectEvent").submit();
                    }
                </script>

            </div>   
         </div>           
        
        <table style="margin-top: 20px">
    <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Assigner</th>
        <th>Club</th>
        <th>Status</th>
          <c:if test="${requestScope.typeSearch == true}">  
        <th>Action</th>
         </c:if>
      </tr>
    </thead>
    <tbody>
         <%
        for (int i=0;i<tList.size();i++) {
        Club c = new Club();
        c = cDAO.getClubById(tList.get(i).getClub_id());
    %>  
    
        
      
    <tr onclick="window.location.href='task_Details?task_id=<%=tList.get(i).getId()%>'">
  
        <td><%=tList.get(i).getId()%></td>
        
        <td><%=tList.get(i).getName()%></td>
        
        <td>-</td>
        <td><%=c.getName()%></td>
    <%if (tList.get(i).isStatus()==false) {    
    %>    
        <td><span class="status-complete">Complete</span></td>
       <%} else {
%> 
         <td><span class="status-going">Going On</span></td>
         <%}%>
          <c:if test="${requestScope.typeSearch == true}">  
              <td><a style="color:  #0077B6" href="task_Update?task_id=<%=tList.get(i).getId()%>">Update</a></td>
         </c:if>


      </tr> 
     <%
        }
        
    %>
    </tbody>
  </table>     
<div style="text-align: center;">
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