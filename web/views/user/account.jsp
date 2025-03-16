<%-- Document : account Created on : Mar 17, 2025, 2:25:36 AM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@ include file="../includes/head.jsp" %>
        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
        <link rel="stylesheet" href="${css}/home.css" />
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />
        <link rel="stylesheet" href="${css}/account.css" />
    </head>

    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="account">
                        <div class="account-card">
                            <!-- Header Section -->
                            <div class="card-header">
                                <div class="user-avatar">
                                    <div class="avatar-container">
                                        <img src="${contextPath}/assets/images/avatar.png"
                                             alt="User Avatar">
                                        <div class="avatar-badge online"></div>
                                    </div>
                                </div>
                                <div class="user-name">
                                    <h2>${sessionScope.user.username}</h2>
                                    <span class="user-status">Active Member</span>
                                </div>
                            </div>

                            <!-- User Information Section -->
                            <div class="user-details">
                                <div class="info-group">
                                    <div class="info-item">
                                        <i class="fas fa-envelope"></i>
                                        <div class="info-content">
                                            <label>Email</label>
                                            <p>${sessionScope.user.email}</p>
                                        </div>
                                    </div>
                                    <div class="info-item">
                                        <i class="fas fa-calendar-alt"></i>
                                        <div class="info-content">
                                            <label>Member Since</label>
                                            <p>${sessionScope.user.createdAt}</p>
                                        </div>
                                    </div>
                                    <div class="info-item">
                                        <i class="fas fa-star"></i>
                                        <div class="info-content">
                                            <label>Account Status</label>
                                            <p>
                                                <c:choose>
                                                    <c:when test="${requestScope.listCourseOrder.size() >= 2}">
                                                        Premium Member
                                                    </c:when>
                                                    <c:otherwise>
                                                        Regular Member
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Stats Section -->
                            <div class="user-stats">
                                <div class="stat-item">
                                    <span class="stat-value">85%</span>
                                    <span class="stat-label">Progress</span>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-value">${requestScope.listCourseOrder.size()}</span>
                                    <span class="stat-label">Courses</span>
                                </div>
                                <div class="stat-item">
                                    <span class="stat-value">
                                        ${requestScope.listCourseOrder.size() >= 10 ? requestScope.listCourseOrder.size() * 15 
                                          : requestScope.listCourseOrder.size() >= 5 ? requestScope.listCourseOrder.size() * 12 
                                          : requestScope.listCourseOrder.size() * 10}
                                    </span>
                                    <span class="stat-label">Points</span>
                                </div>
                            </div>

                            <!-- Action Buttons -->
                            <div class="account-actions">
                                <a href="${contextPath}/editAccount" class="btn-edit">
                                    <i class="fas fa-edit"></i>
                                    Edit Profile
                                </a>
                                <a href="${contextPath}/settings" class="btn-settings">
                                    <i class="fas fa-cog"></i>
                                    Settings
                                </a>
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