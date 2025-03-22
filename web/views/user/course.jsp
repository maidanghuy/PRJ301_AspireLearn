<%-- 
    Document   : course
    Created on : Mar 21, 2025, 11:44:31 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" import="model.*,java.util.*, dao.*, controller.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Courses - G-easy Learning</title>
        <%@ include file="../includes/head.jsp" %>

        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />
        <link rel="stylesheet" href="${css}/course.css">

    </head>


    <body>
        <c:if test="${featureMessage == false}">
            <script>
                window.onload = function () {
                    setTimeout(function () {
                        alert("Tính năng này chưa có sẵn!");
                    }, 500); // Hiện alert sau 500ms
                };
            </script>
        </c:if>

        <% List<Course> courseL = new ArrayList<>();
            if (request.getAttribute("list") != null) {
                courseL = (List<Course>) request.getAttribute("list");
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
                        <div class="container">
                            <div class="course__banner">
                                <img src="${img}/course/bannercourse.jpg"
                                     alt="IELTS_Beginer" class="course_banner_img" />
                                <div class="course__info">
                                    <h1 class="course__title">Course online</h1>
                                    <p class="course__description">
                                        Join our online English course to improve your skills anytime, anywhere! Learn grammar, vocabulary, and conversation with expert instructors. Start today and boost your confidence!
                                    </p>
                                </div>
                            </div>

                            <div class="filter-bar">
                                <a href="#"><button class="filter-btn">Tất cả khóa
                                        học</button></a>
                                <a href="#"><button class="filter-btn">Đã thanh toán</button></a>
                                <div>
                                    <button class="icon-btn">
                                        <img src="${img}/course/Filter.svg" alt="Filter" />
                                        <ul class="icon-catetory">
                                            <li class="icon-catetory-sub hidden">
                                                <a href="">Loại tài liệu</a>
                                            </li>
                                            <li class="icon-catetory-sub hidden"><a
                                                    href="">Tiến độ hoàn thành</a></li>
                                            <li class="icon-catetory-sub hidden"><a
                                                    href="">Giảng viên</a></li>
                                            <li class="icon-catetory-sub hidden"><a
                                                    href="">Trạng thái</a></li>
                                        </ul>
                                    </button>
                                </div>
                                <div class="search-bar">
                                    <img src="${img}/course/Vector.svg" alt="Tìm kiếm">
                                    <input type="text" placeholder="Tìm kiếm...">
                                </div>
                            </div>

                            <div class="course-container">
                                <% for (Course course : courseL) {%>
                                <div class="course-card">
                                    <img src="${img}<%= course.getLinkimg()%>"
                                         alt="<%= course.getCourseName()%>"
                                         class="course-img">
                                    <h3>
                                        <%= course.getCourseName()%>
                                    </h3>
                                    <p><strong>Level</strong>
                                        <%= course.getLevel()%>
                                    </p>
                                    <a href="${url}/view/course/<%= course.getCourseID()%>">
                                        <button class="detail-btn">Xem chi tiết</button>
                                    </a>
                                </div>
                                <% }%>
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
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <%@ include file="../includes/scripts.jsp" %>
        <script src="${js}/course.js"></script>

    </body>

</html>