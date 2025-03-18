<%-- Document : dashboard Created on : Mar 18, 2025, 10:51:39 PM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                            <img src="${sessionScope.admin.avatarUrl}" alt="Admin Avatar">
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
                            <p class="stat-number">${totalUsers}</p>
                            <span class="stat-change positive">+5.2% <i class="fas fa-arrow-up"></i></span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: #4CAF50;">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="stat-info">
                            <h3>Active Courses</h3>
                            <p class="stat-number">${activeCourses}</p>
                            <span class="stat-change positive">+2.4% <i class="fas fa-arrow-up"></i></span>
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

        <!-- JavaScript for Charts -->
        <script>
            // User Growth Chart
            const userGrowthCtx = document.getElementById('userGrowthChart').getContext('2d');
            new Chart(userGrowthCtx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                    datasets: [{
                            label: 'New Users',
                            data: [65, 78, 90, 85, 99, 105],
                            borderColor: '#FB9400',
                            tension: 0.4
                        }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            // Course Engagement Chart
            const courseEngagementCtx = document.getElementById('courseEngagementChart').getContext('2d');
            new Chart(courseEngagementCtx, {
                type: 'bar',
                data: {
                    labels: ['Course A', 'Course B', 'Course C', 'Course D', 'Course E'],
                    datasets: [{
                            label: 'Active Students',
                            data: [45, 39, 55, 75, 35],
                            backgroundColor: '#4CAF50'
                        }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        </script>
    </body>

</html>