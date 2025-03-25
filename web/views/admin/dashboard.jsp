<%-- Document : dashboard Created on : Mar 18, 2025, 10:51:39 PM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - G-Easy Learning</title>
        <%@ include file="../includes/head.jsp" %>
        <link rel="stylesheet" href="${css}/admin/dashboard.css">
        <!-- Chart.js for statistics -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>

    <body>
        <div class="dashboard-container">
            <!-- Sidebar -->
            <%@ include file="../includes/sidebar.jsp" %>


            <!-- Main Content -->
            <div class="dashboard-main">
                <!-- Top Navigation -->
                <div class="dashboard-nav">
                    <div class="nav-left">
                        <h2>Dashboard Overview</h2>
                    </div>
                    <div class="nav-right">
                        <div class="admin-profile">
                            <img src="${img}/avatar_admin.png" alt="Admin Avatar">
                            <span>${sessionScope.admin.username}</span>
                            <a href="${url}/logout" class="logout-btn">
                                <i class="fas fa-sign-out-alt"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Statistics Cards -->
                <div class="stats-container">
                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: #FB9400;">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Total Users</h3>
                            <c:set var="totalUsers" value="${allUser.size()}" />
                            <c:set var="monthUsers" value="${monthUser.size()}" />
                            <c:set var="growthPercentage" value="${totalUsers > 0 ? (monthUsers * 100.0 / totalUsers) : 0}" />

                            <p class="stat-number">${totalUsers}</p> <!-- Hiển thị tổng số user -->
                            <span class="stat-change ${growthPercentage >= 0 ? 'positive' : 'negative'}">
                                <fmt:formatNumber value="${growthPercentage}" type="number" maxFractionDigits="1"/>% 
                                <i class="fas ${growthPercentage >= 0 ? 'fa-arrow-up' : 'fa-arrow-down'}"></i>
                            </span>


                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: #4CAF50;">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Total Courses</h3>
                            <c:set var="totalCourses" value="${allCourse.size()}" />
                            <c:set var="monthCourses" value="${monthCourse.size()}" />
                            <c:set var="courseGrowth" value="${totalCourses > 0 ? (monthCourses * 100.0 / totalCourses) : 0}" />

                            <p class="stat-number">${totalCourses}</p> <!-- Hiển thị tổng số khóa học -->
                            <span class="stat-change ${courseGrowth >= 0 ? 'positive' : 'negative'}">
                                <fmt:formatNumber value="${courseGrowth}" type="number" maxFractionDigits="1"/>% 
                                <i class="fas ${courseGrowth >= 0 ? 'fa-arrow-up' : 'fa-arrow-down'}"></i>
                            </span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: #2196F3;">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Total Materials</h3>
                            <p class="stat-number">${totalMaterials}</p>
                            <span class="stat-change positive">+3.7% <i class="fas fa-arrow-up"></i></span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: #9C27B0;">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Tests Created</h3>
                            <p class="stat-number">${totalTests}</p>
                            <span class="stat-change positive">+1.8% <i class="fas fa-arrow-up"></i></span>
                        </div>
                    </div>
                </div>

                <!-- Charts Section -->
                <div class="charts-container">
                    <div class="chart-card">
                        <h3>User Growth</h3>
                        <canvas id="userGrowthChart"></canvas>
                    </div>
                    <div class="chart-card">
                        <h3>Course Engagement</h3>
                        <canvas id="courseEngagementChart"></canvas>
                    </div>
                </div>

                <!-- Recent Activities -->
                <div class="recent-activities">
                    <h3>Recent Activities</h3>
                    <div class="activity-list">
                        <c:forEach items="${recentActivities}" var="activity">
                            <div class="activity-item">
                                <div class="activity-icon">
                                    <i class="${activity.icon}"></i>
                                </div>
                                <div class="activity-details">
                                    <p>${activity.description}</p>
                                    <span class="activity-time">${activity.timeAgo}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <script src="${js}/admin/sidebar.js"></script>
        <script src="${js}/admin/dashboard.js"></script>
    </body>

</html>