<%-- 
    Document   : lesson
    Created on : Mar 24, 2025, 5:24:24 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../includes/path-config.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
        <link rel="stylesheet" href="${css}/lesson.css" />
    </head>
    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>


                    <%-- Tính tổng thời gian và số lượng bài học --%>
                    <c:set var="totalDuration" value="0" />
                    <c:set var="lessonCount" value="0" />

                    <c:forEach var="lesson" items="${lessons}">
                        <c:set var="totalDuration" value="${totalDuration + lesson.duration}" />
                        <c:set var="lessonCount" value="${lessonCount + 1}" />
                    </c:forEach>

                    <div class="lesson">
                        <div class="container">
                            <div class="lesson-header-section">
                                <div class="breadcrumb-nav">
                                    <a href="${contextPath}/view/home">Home</a> /
                                    <a href="${contextPath}/view/course">Courses</a> /
                                    <a
                                        href="${contextPath}/view/course/${sessionScope.courseID}">${sessionScope.course.courseName}</a>
                                    /
                                    <span>Lessons</span>
                                </div>
                                <div class="course-progress">
                                    <div class="progress-info">
                                        <div class="progress-stats">
                                            <span class="completed-lessons">0/${totalLessons} lessons
                                                completed</span>
                                            <div class="progress-bar">
                                                <div class="progress" style="width: 0%"></div>
                                            </div>
                                        </div>
                                        <div class="course-meta">
                                            <span class="total-duration"><i class="fas fa-clock"></i>
                                                ${totalDuration} minutes</span>
                                            <span class="lesson-count"><i class="fas fa-book-open"></i>
                                                ${lessonCount} lessons</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="lesson-container">
                                <div class="course-info">
                                    <h1 class="course-title">${sessionScope.course.courseName}</h1>
                                    <p class="course-description">${sessionScope.course.description}</p>
                                </div>

                                <div class="lesson-list">
                                    <c:choose>
                                        <c:when test="${empty lessons}">
                                            <div class="no-lessons">
                                                <i class="fas fa-book-open"></i>
                                                <h3>No Lessons Available</h3>
                                                <p>This course doesn't have any lessons yet. Please check back
                                                    later.</p>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${lessons}" var="lesson">
                                                <div class="lesson-card"
                                                     onclick="showLessonContent(${lesson.lessonID})">
                                                    <div class="lesson-header">
                                                        <h3 class="lesson-title">${lesson.lessonTitle}</h3>
                                                        <span class="lesson-duration">${lesson.duration}
                                                            minutes</span>
                                                    </div>
                                                    <div class="lesson-preview">
                                                        <c:choose>
                                                            <c:when test="${fn:length(lesson.content) > 85}">
                                                                <p>${fn:substring(lesson.content, 0, 85)}...</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p>${lesson.content}</p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="lesson-footer">
                                                        <a href="${contextPath}/view/course/lesson/${lesson.lessonID}" class="btn-start">Start Lesson</a>
                                                        <span class="lesson-date">${lesson.createdAt}</span>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer>
                    <%@ include file="../includes/footer.jsp" %>
                </footer>
            </div>
        </div>
        <%@ include file="../includes/chatbot.jsp" %>      
        <script>
            const imgPath = "${img}";
            window.onload = function () {
                let message = "${sessionScope.logoutMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
        <!-- Xóa logoutMessage ngay lập tức -->
        <c:remove var="logoutMessage" scope="session" />
        <%@ include file="../includes/scripts.jsp" %>
        <script src="${js}/banner.js"></script>
    </body>

</html>