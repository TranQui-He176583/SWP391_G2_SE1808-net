<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>

<%@page import = "java.util.*" %>
<%
     EventDAO eDAO = new EventDAO();
List<Event> eList = new ArrayList<Event>();
String scid = request.getParameter("k");
int cid = Integer.parseInt(scid);
eList = eDAO.get_Event_List(cid,"", 1);
if (eList.size()<5) {
    
    } else {
            if (eList.size()<9) {
               eList.subList(5, eList.size()).clear(); 
    } else {
            eList.subList(5, 9).clear(); 
    }
    }
   ClubDAO cDAO = new ClubDAO();
        List<Club> cList = new ArrayList<Club> () ;
        cList = cDAO.getClubs();     

       
%>

<h2 style="margin-left: 15%; font-size: 30px">New Event:</h2>

<form style="margin-top: 30px" id="formSearch"action="get_EvenList_ClubId" method="get"> 
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
                </form >                       
                         <div style=" height: 40px; font-size: 18px; margin-top: 5px;">
                             <form action="event_sendPublic" method="get" id="selectClub" onchange="submitForm() ">        
                    <select style="color:#f05123;height: 40px; padding: 5px; width: 255px" id="options" name="clubid">

                        <option value="0"> All Club</option> 
                        <%   for (int i=0;i<(cList.size());i++) { 
                               if (cList.get(i).getId() == cid ) {
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
                                                 <br><br>
    <%
        for (int i=0;i<eList.size();i++) {

    %>
    <div style="margin-left: 10%;width: 200px; margin-top: 30px">
        <a href="event_Details?id=<%=eList.get(i).getId()%>&k=0&c=0" style=" width: 150px; height: 100px">
            <img style="width: 160px; height: 150px; border-radius: 5px " src="<%=eList.get(i).getAvatar()%>" alt="alt"/>
            <p style="width: 100%; font-weight: bold"> <%=eList.get(i).getName()%></p>
            <p style="font-size: 13px; margin-top: -20px"><%=eList.get(i).getDate().toLocalDate()%></p>
            
        </a>
    </div>
       <%}%> 