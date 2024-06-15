<%-- 
    Document   : eventList
    Created on : Jun 4, 2024, 1:15:35 PM
    Author     : quyka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>
<%@page import = "java.util.*" %>
<%
     List<Club> cList = (List<Club>) request.getAttribute("cList");
      List<Event> eList = (List<Event>) request.getAttribute("eList");
    int nPage = (int) request.getAttribute("nPage");
     String cClubStr = (String) request.getAttribute("cClub");
    int cClub = Integer.parseInt(cClubStr);
    

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
  <img style="margin-top: 113.5px; width: 100%" src="assets/img/logo/header.jpg" alt="alt">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);"></div>
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: white; font-size: 48px; font-weight: 500;">Event List</div>
        </div>
        <div style="display: flex; margin-top: 3%">
            <div style="margin-left: 10%">
                <form id="formSearch"action="get_EvenList_ClubId" method="get"> 
                    <label style="border: 1px solid; padding: 5px">
                        <input style="width: 300px; height: 40px; font-size: 15px"  type="text" value="${requestScope.search}" name="search" placeholder="Seach...." >
                        <input type="hidden" name="cPage" value="1">
                        <input type="hidden" name="clubid" value="${requestScope.cClub}">
                                                 <span> 
                                     <button style="width: 40px; background: #f05123;border: none;border-radius: 5px;margin-top: -5px;background-color: transparent;">
                            <img style="width:40px;background: #f05123;border-radius: 5px;padding: 10px;margin-top:-5px;margin-left: -5px  "
                                 src="assets/img/logo/searchlogo.webp" alt="alt"/></span> 
                                      </button>
                    </label>
                </form>
                
            </div>
            <div style="margin-left: 40%; height: 40px; font-size: 18px;">
                <form id="selectClub" onchange="submitForm()">
                     <input type="hidden" name="cPage" value="1">
            <input type="hidden" name ="search"value="${requestScope.search}" >
                     <label style="border: 1px solid; background:#f05123; border-radius: 5px;width: 120px; height: 40px; padding: 5px " for="options">Select Club:</label>
                     <select style="color:#f05123;height: 40px; padding: 5px" id="options" name="clubid">
            
           <option value="0"> All Club</option> 
            <%   for (int i=0;i<(cList.size());i++) { 
                   if (cList.get(i).getId() == cClub ) {
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
            
        </div>  
     <%
     for (int i=1;i<=(eList.size())/3+1;i++) {
                      
     %>   
       <div  style="display: flex;margin-left: 100px">
           
           <%
   if (i*3>eList.size()) {
            for (int j=(i-1)*3;j<eList.size();j++) { 
  
     %> 
     <div  style="margin-left: 50px;width: 370px; height: 230px; margin-top: 130px">
               <a href="event_Details?id=<%=eList.get(j).getId()%>">
                   <img style="width: 370px; height: 230px; " src="<%= eList.get(j).getAvatar()%>" alt="alt"/>
               </a>
               <div  >
                   <h2  style="font-size:20px; font-family: none; width: 100%; margin-top: 15px " ><%=eList.get(j).getName()%></h2>
                   <svg style="width: 18px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path 
                   d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm0 18c-4.411 0-8-3.589-8-8s3.589-8 8-8 8 3.589 8 8-3.589 8-8 8z">
                           
                   </path><path d="M13 7h-2v6h6v-2h-4z"></path></svg> <span style="font-size: 15px">
                       <%=eList.get(j).getDate().toLocalDate()%>  </span>
               </div>
           </div>
               <%}
} else {
                for (int j=(i-1)*3;j<=i*3-1;j++) { 
            
     %> 
           <div style="margin-left: 50px;width: 370px; height: 230px; margin-top: 130px" >
               <a href="event_Details?id=<%=eList.get(j).getId()%>">
                   <img style="width: 370px; height: 230px; " src="<%= eList.get(j).getAvatar()%>" alt="alt"/>
               </a>
               
                   <h2  style="font-size:20px; font-family: none; width: 100%; margin-top: 15px " ><%=eList.get(j).getName()%></h2>
                   <svg style="width: 18px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                   <path 
                   d="M12 2C6.486 2 2 6.486 2 12s4.486 10 10 10 10-4.486 10-10S17.514 2 12 2zm0 18c-4.411 0-8-3.589-8-8s3.589-8 8-8 8 3.589 8 8-3.589 8-8 8z">
                           
                   </path><path d="M13 7h-2v6h6v-2h-4z"></path></svg> <span style="font-size: 15px">
                       <%=eList.get(j).getDate().toLocalDate()%>  </span>
               
           </div>
               <%}
}
        %>
               </div>
        <%}

        %>
       
    </body>
    
   
    <div style="text-align: center; margin-top: 150px">
        <%  for (int i=1;i<=nPage;i++) {        
            %>
            <a href="get_EvenList_ClubId?cPage=<%=i%>&clubid=<%=cClub%>&search=${requestScope.search}">
            <span style="font-size: 15px; margin-left: 7px; border: 2px solid  orangered; padding: 7px; color: black"><%=i%></span>
          </a>
    
    <%}%>
    </div>
  <%@include file="commonFunction/footer.jsp" %>
</html>

