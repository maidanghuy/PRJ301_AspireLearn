<%-- 
    Document   : resetpassword
    Created on : Mar 25, 2025, 11:57:20 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.Base64" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/path-config.jsp" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ResetPassword Page</title>
        <%@ include file="../includes/head.jsp" %>

        <link rel="stylesheet" href="${css}/resetpassword.css" />

    </head>
    <body>
        <%
            String encodedEmail = request.getParameter("email");
            String email = new String(Base64.getUrlDecoder().decode(encodedEmail), "UTF-8");
        %>

        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger text-center">${sessionScope.error}</div>
            <c:remove var="error" scope="session"/>
        </c:if>

        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-success text-center">${sessionScope.message}</div>
            <c:remove var="message" scope="session"/>
        </c:if>
        <form action="${url}/ResetPassword" method="post">
            <input type="hidden" name="email" value="<%= email%>">
            Mật khẩu mới: <input type="password" name="password" required>
            <button type="submit">Đặt lại mật khẩu</button>
        </form>
    </body>
</html>
