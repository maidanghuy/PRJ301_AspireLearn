<%-- 
    Document   : submit
    Created on : Mar 25, 2025, 11:55:07 PM
    Author     : Asus
--%>

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
        <link rel="stylesheet" href="${css}/submit.css" />
    </head>

    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="result-container">
                                <h1>Kết quả bài thi</h1>
                                <div class="score">
                                    ${score}/${totalQuestions}
                                </div>
                                <div class="btn-container">
                                    <a href="${pageContext.request.contextPath}/view/test/${testID}" class="btn btn-retry">Làm lại</a>
                                    <a href="${pageContext.request.contextPath}/view/home" class="btn btn-home">Quay về trang chủ</a>
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