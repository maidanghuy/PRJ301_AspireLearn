<%-- 
    Document   : forgotpassword
    Created on : Mar 25, 2025, 11:29:21 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ForgotPassword Page</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger text-center">${sessionScope.error}</div>
            <c:remove var="error" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-success text-center">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>
        <form action="ForgotPassword" method="post">
            Nhập email: <input type="email" name="email" required>
            <button type="submit">Gửi yêu cầu</button>
        </form>
    </body>
</html>
