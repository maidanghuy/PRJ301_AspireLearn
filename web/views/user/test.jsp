<%-- 
    Document   : test
    Created on : Mar 24, 2025, 11:27:08 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <link rel="stylesheet" href="${css}/test.css" />
    </head>

    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                                        <div class="content-wrapper">
                        <div class="test-header">
                            <div class="test-filters">
                                <button class="filter-btn active" data-type="all">
                                    <i class="fas fa-list"></i> All
                                </button>
                                <button class="filter-btn" data-type="listening">
                                    <i class="fas fa-headphones"></i> Listening
                                </button>
                                <button class="filter-btn" data-type="reading">
                                    <i class="fas fa-book-reader"></i> Reading
                                </button>
                            </div>
                        </div>


                        <div class="test-container">
                            <c:forEach var="test" items="${list}">
                                <div class="test-item" data-type="${test.category.toLowerCase()}">
                                    <div class="test-item-header">
                                        <div class="header-main">
                                            <span class="test-badge ${test.category.toLowerCase()}">
                                                ${test.category}
                                            </span>
                                            <h3 class="test-name">${test.testName}</h3>
                                        </div>
                                        <div class="test-time">
                                            <i class="fas fa-clock"></i>
                                            <span>${test.duration} min</span>
                                        </div>
                                    </div>
                                    <div class="test-details">
                                        <div class="meta-info">
                                            <div class="info-item">
                                                <i class="fas fa-calendar-alt"></i>
                                                <span><fmt:formatDate value="${test.createdAt}" pattern="dd-MM-yyyy" type="date" /></span>
                                            </div>
                                            <div class="info-item">
                                                <i class="fas fa-tasks"></i>
                                                <span>100 Questions</span>
                                            </div>
                                        </div>
                                        <p class="test-desc">
                                            ${test.description}
                                        </p>
                                    </div>
                                    <div class="test-actions">
                                        <a href="${contextPath}/view/test/${test.testID}" class="btn-start-test">
                                            <span>Start</span>
                                            <i class="fas fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
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
        <script src="${js}/test.js"></script>

    </body>

</html>