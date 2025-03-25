<%-- 
    Document   : detailscourse
    Created on : Mar 24, 2025, 3:35:00 PM
    Author     : Asus
--%>

<%@page import="model.Course"%>
<%-- Document : home Created on : Mar 13, 2025, 5:30:19 PM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@ include file="../includes/head.jsp" %>
        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />
        <link rel="stylesheet" href="${css}/detailscourse.css"/>
    </head>
    <body>
        <%
            Course course = new Course();
            if (request.getAttribute("course") != null) {
                course = (Course) request.getAttribute("course");
                session.setAttribute("course", course);
            }
        %>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="course">
                        <div class="course__banner">
                            <img
                                src="<%=course.getLinkimg()%>"
                                alt="<%=course.getCourseName()%>"
                                class="course_banner_img"
                                />
                            <div class="course__info">
                                <h1 class="course__title"><%=course.getCourseName()%></h1>
                                <p class="course__description">
                                    <%=course.getDescription()%>
                                </p>
                            </div>
                        </div>
                        <div class="course__tabs">
                            <button class="btn course__tab course__tab--active">
                                Thông tin khóa học
                            </button>
                            <button class="btn course__tab">Lịch học</button>
                            <button class="btn course__tab">Lộ trình học tập</button>
                            <button class="btn course__tab">Cam kết sau khóa học</button>
                        </div>
                        <div class="course__details">
                            <h2 class="course__title">
                                <%=course.getDescription()%>
                            </h2>
                            <% String[] detailsList = course.getDetails().split(";");%>
                            <ul class="course__list">
                                <% for (int i = 0; i < detailsList.length - 3; i++) {%>
                                <li class="course__description">- <%= detailsList[i]%></li>
                                    <% } %>
                            </ul>

                            <% for (int i = detailsList.length - 3; i < detailsList.length; i++) {%>
                            <p class="course__description"><%= detailsList[i]%></p>
                            <% } %>
                        </div>
                    </div>

                    <div class="calendar hidden">
                        <div class="calendar-header">
                            <button id="prevMonth">&#9665;</button>
                            <h2 id="monthYear"></h2>
                            <button id="nextMonth">&#9655;</button>
                        </div>
                        <div class="weekdays">
                            <div>Sun</div>
                            <div>Mon</div>
                            <div>Tue</div>
                            <div>Wed</div>
                            <div>Thu</div>
                            <div>Fri</div>
                            <div>Sat</div>
                        </div>
                        <div class="days" id="calendarDays"></div>
                    </div>

                    <div class="accordion hidden">
                        <c:forEach var="entry" items="${learningPathway}">
                            <div class="accordion-item">
                                <div class="accordion-header">${entry.key}</div>
                                <div class="accordion-content">
                                    <c:forEach var="content" items="${entry.value.split('/')}">
                                        <p>${content}</p>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                    <%
                        String[] commitList = course.getCommit().split(";");
                    %>
                    <div class="commit hidden">
                        <% for (String commit : commitList) {%>
                        <p class="course__description"><%= commit%></p>
                        <%
                            }
                        %>
                    </div>


                    <div class="course_footer_btn">
                        <a href="${url}/view/course"
                           ><button class="btn course__register-btn">
                                Another Course
                            </button></a
                        >
                        <a href="${url}/LoadVnpay"
                           ><button class="btn course__register-btn">
                                Enroll
                            </button></a
                        >
                    </div>
                </div>
                <footer>
                    <%@ include file="../includes/footer.jsp" %>
                </footer>
            </div>
        </div> 
        <%@ include file="../includes/chatbot.jsp" %>      
        <!-- Xóa logoutMessage ngay lập tức -->
        <c:remove var="logoutMessage" scope="session" />
        <%@ include file="../includes/scripts.jsp" %>
        <script src="${js}/banner.js"></script>
        <script src="${js}/detailscourse.js"></script>  
    </body>

</html>


