<%-- 
    Document   : home
    Created on : Mar 13, 2025, 5:30:19 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="./includes/path-config.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@ include file="./includes/head.jsp" %>
        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
        <link rel="stylesheet" href="${css}/index.css" />
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />

    </head>
    <body>

        <div class="container-custom">
            <div class="container-left">
                <%@ include file="./includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="./includes/header.jsp" %>
                    <div class="container"></div>
                    <%--<%@ include file="./includes/main.jsp" %>--%>
                </div>
                <footer>
                    <%@ include file="./includes/footer.jsp" %>
                </footer>
            </div>
        </div>
        <script>
            const imgPath = "${img}";
        </script>
        <%@ include file="./includes/scripts.jsp" %> 
    </body>
</html>
