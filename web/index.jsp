<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "Model.*" %>

<%@page import = "java.util.*" %>
<%
     List<Event> eList = (List<Event>) request.getAttribute("eList");
%>
<c:if test="${not empty requestScope.complete}">
  <script>
    alert(" ${requestScope.complete} ");
    
  </script>
</c:if>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title> Health & Fitness | Template </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
<link rel="stylesheet" href="assets/css/bootstrap.min_2.css">
 <link rel="stylesheet" href="assets/css/templatemo-snapx-photography.css">
        <%@include file="commonFunction/CSS.jsp" %>

    </head>
            <div style="width: 100%; height: 400px; margin-top: 200px">
            <section class="popular-categories">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-6">
          <div class="section-heading">
            
              <h4 style="font-family: sans-serif" ><em>New Events </em></h4>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="main-button">
            <a href="get_EvenList_ClubId?search=&cPage=1&clubid=0">Discover All Events</a>
          </div>
        </div>
        <% for(int i=0 ;i<4;i++) {%>
        
          <div class="col-lg-3 col-sm-6">
          <div class="popular-item">
            <div class="top-content">
              <div class="right">
              <% if (eList.get(i).getName().length()>33) {
              String name = eList.get(i).getName().substring(0,33);
              name=name+"...";
                  
              %>    
              <a href="event_Details?id=<%=eList.get(i).getId()%>&k=0&c=0">
              <h4 style="font-size: 20px;  margin-top: 5px; font-weight: 700;font-family: sans-serif"><%=name%></h4> 
                <%} else {%>
                <a href="event_Details?id=<%=eList.get(i).getId()%>&k=0&c=0">
                    <h4 style="font-size: 20px;  margin-top: 5px; font-weight: 700; font-family: sans-serif"><%=eList.get(i).getName()%></h4> 
                    </a>
                <%}%>
                </a>
              <%
                  Club c = new Club();
                  ClubDAO cDAO = new ClubDAO();
                  c= cDAO.getClubById(eList.get(i).getClub_id());    
            if (eList.get(i).getLocation().length()>20) {
              String location = eList.get(i).getLocation().substring(0,20);
              location=location+"...";
              %>  
                <span><em>Location:</em></span> <span style="font-size: 14px"> <%=location%></span>
                <%} else {%>
                <span><em>Location:</em></span> <span style="font-size: 14px"> <%=eList.get(i).getLocation()%></span>
                <%}%> <br>
                <span><em>Date :</em> </span> <span style="margin-left: 10%;font-size: 14px"> <%=eList.get(i).getDate().toLocalDate()%></span>
              </div>
            </div>
               <a href="event_Details?id=<%=eList.get(i).getId()%>&k=0&c=0">
            <div class="thumb">
                <img style="width:260px; height: 170px  " src="<%=eList.get(i).getAvatar()%>" alt="">
              <span class="category">Top Contest</span>
              <span class="likes"><i class="fa fa-heart"></i> 256</span>
            </div>
               </a>
            <div class="border-button">
              <a href="get_EvenList_ClubId?cPage=1&search=&clubid=<%=c.getId()%>">Discover more about <%=c.getName()%></a>
            </div>
          </div>
        </div>
            
            <%}%>
      </div>
    </div>
  </section>
        
      </div>    
    <body>

        <%@include file="commonFunction/header.jsp" %>
        <main >
            <!--? About-2 Area Start -->
            <section style="background : white" class="about-area2 testimonial-area section-padding30 fix">
                <div class="container">
                    <div style=" margin-top: 100px;" class="row align-items-center">

                        <div class="col-lg-6 col-md-9 col-sm-9">
                            <div class="about-caption">
                                <!-- Section Tittle -->
                                <div class="section-tittle mb-55">
                                    <span>FPT Teakwondo</span>
                                </div>
                                <!-- Testimonial Start -->
                                <div class="h1-testimonial-active">
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">Câu lạc bộ Taekwondo FPT University là nơi tạo ra không khí đầy cảm hứng và năng động, nơi mà sinh viên không chỉ rèn luyện kỹ năng võ thuật mà còn tạo ra mối quan hệ gắn kết và sự tự tin vững chắc.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Cu Duc Binh <span>Truong CLB</span> </span>
                                                <a href="https://www.facebook.com/FTCTaekwondo" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">FPTU Taekwondo Club is a place that creates an inspiring and dynamic atmosphere, where students not only practice martial arts skills but also create strong relationships and confidence.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Binh Cu <span>Leader</span> </span>
                                                <a href="https://www.facebook.com/FTCTaekwondo" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Testimonial End -->
                            </div>
                        </div>

                        <div class="col-lg-5 col-md-11 col-sm-11">
                            <!-- about-img -->
                            <div class="about-img2">
                                <img src="assets/img/anhclb/anhclb2.jpg" alt="">

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About-2 Area End -->
            <section style="background : #f5f5f5" class="about-area2 testimonial-area section-padding30 fix">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-5 col-md-11 col-sm-11">
                            <!-- about-img -->
                            <div class="about-img2">
                                <img src="assets/img/anhclb/anhclb3.jpg" alt="">

                            </div>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-9">
                            <div class="about-caption">
                                <!-- Section Tittle -->
                                <div class="section-tittle mb-55">
                                    <span>FPT Street Workout</span>
                                </div>
                                <!-- Testimonial Start -->
                                <div class="h1-testimonial-active">
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">Câu lạc bộ Street Workout FPT University là nơi hội tụ những người yêu thích thể dục và rèn luyện cơ thể dưới ánh nắng mặt trời, tạo ra không gian đầy sức sống và đam mê, khuyến khích sinh viên thể hiện bản thân và tạo nên cộng đồng sôi động.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Nguyen Huy <span>Truong CLB</span></span>
                                                <a href="https://www.facebook.com/FuStreetWorkout" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">FPT University Street Workout Club is a gathering place for people who love fitness and exercising under the sun, creating a space full of vitality and passion, encouraging students to express themselves and create vibrant community.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Huy Nguyen <span>Leader</span></span>
                                                <a href="https://www.facebook.com/FuStreetWorkout" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Testimonial End -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--? About-2 Area Start -->
            <section style="background : white" class="about-area2 testimonial-area section-padding30 fix">
                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-lg-6 col-md-9 col-sm-9">
                            <div class="about-caption">
                                <!-- Section Tittle -->
                                <div class="section-tittle mb-55">
                                    <span>FPTU - Melody Club</span>
                                </div>
                                <!-- Testimonial Start -->
                                <div class="h1-testimonial-active">
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">Câu lạc bộ Melody tại FPT University là nơi tạo ra không gian sôi động và sáng tạo cho sinh viên yêu thích âm nhạc, thúc đẩy sự phát triển cá nhân và sự sáng tạo trong lĩnh vực âm nhạc.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Dao Duc Hai <span>Truong CLB</span></span>
                                                <a href="https://www.facebook.com/fptu.melody.club" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">Melody Club at FPT University is a place that creates a vibrant and creative space for students who love music, promoting personal development and creativity in the field of music.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Hai Duc <span>Leader</span></span>
                                                <a href="https://www.facebook.com/fptu.melody.club" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Testimonial End -->
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-11 col-sm-11">
                            <!-- about-img -->
                            <div class="about-img2">
                                <img src="assets/img/anhclb/anhclb4.jpg" alt="">

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- About-2 Area End -->

            <section style="background : #f5f5f5" class="about-area2 testimonial-area section-padding30 fix">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-5 col-md-11 col-sm-11">
                            <!-- about-img -->
                            <div class="about-img2">
                                <img src="assets/img/anhclb/anhclb5.jpg" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-9">
                            <div class="about-caption">
                                <!-- Section Tittle -->
                                <div class="section-tittle mb-55">
                                    <span>Chinese Club</span>
                                </div>
                                <!-- Testimonial Start -->
                                <div class="h1-testimonial-active">
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">Câu lạc bộ Tiếng Trung tại FPT University là nơi sinh viên có cơ hội học và thực hành tiếng Trung một cách sâu sắc, tạo điều kiện cho việc hiểu rõ văn hóa và giao tiếp hiệu quả trong cộng đồng quốc tế ngày nay.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Tran Tung Duong <span>Truong CLB</span></span>
                                                <a href="https://www.facebook.com/tiengtrungFPT" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single Testimonial -->
                                    <div class="single-testimonial">
                                        <div class="testimonial-caption">
                                            <p style="font:inherit; font-size:25px">The Chinese Club at FPT University is where students have the opportunity to learn and practice Chinese deeply, facilitating cultural understanding and effective communication in today's international community.</p>
                                            <div class="rattiong-caption" style="display: flex; justify-content: space-between; align-items: center;">
                                                <span>Duong Tran <span>Leader</span></span>
                                                <a href="https://www.facebook.com/tiengtrungFPT" target="_blank" class="btn">Fanpage</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Testimonial End -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--? Gallery Area Start -->
            <div class="gallery-area">
                <div class="container-fluid p-0 fix">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="box snake mb-30">
                                <div class="gallery-img big-img" style="background-image: url(assets/img/anhclb/anhclb6.jpg);"></div>
                                <div class="overlay">
                                    <div class="overlay-content">
                                        <a href="https://www.facebook.com/clbvothuatdienanhfptu" target="_blank"><i class="ti-arrow-top-right"></i></a>
                                        <h3>FPTU Cinema Martial Arts</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="box snake mb-30">
                                <div class="gallery-img big-img" style="background-image: url(assets/img/anhclb/anhclb7.jpg);"></div>
                                <div class="overlay">
                                    <div class="overlay-content">
                                        <a href="https://www.facebook.com/maymuaclub" target="_blank"><i class="ti-arrow-top-right"></i></a>
                                        <h3>FPTU Japanese</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4" >
                            <div class="box snake mb-30">
                                <div class="gallery-img big-img" style="background-image: url(assets/img/anhclb/anhclb8.jpg);"></div>
                                <div class="overlay">
                                    <div class="overlay-content">
                                        <a href="https://www.facebook.com/FTIC.FUHL" target="_blank"><i class="ti-arrow-top-right"></i></a>
                                        <h3>FPTU Traditional musical instrment</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Gallery Area End -->

        </main>
        <%@include file="commonFunction/footer.jsp" %>
        <!-- Scroll Up -->
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>

        <!-- JS here -->

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
      
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
        <!-- Nice-select, sticky -->
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>

        <!-- counter , waypoint,Hover Direction -->
        <script src="./assets/js/jquery.counterup.min.js"></script>
        <script src="./assets/js/waypoints.min.js"></script>
        <script src="./assets/js/jquery.countdown.min.js"></script>
        <script src="./assets/js/hover-direction-snake.min.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>

    </body>
</html>