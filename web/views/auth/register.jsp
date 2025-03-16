<%-- 
    Document   : register
    Created on : Mar 16, 2025, 11:26:39 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Register Page</title>
        <%@ include file="../includes/head.jsp" %>
        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
        <link rel="stylesheet" href="${css}/login.css" />
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    </head>

    <body>
        <div id="form__login" class="form">
            <div class="auth">
                <div class="auth__header">
                    <div class="auth__header-img">
                        <img src="${img}/Rectangle239.svg" alt="Logo">
                    </div>
                    <div class="auth__header-content">
                        <h1 class="auth__header-title">Good <span
                                class="auth__header-title--highlight">Morning</span>!</h1>
                        <p class="auth__header-subtitle">Let's learn English with G-easy every day</p>
                    </div>
                </div>

                <c:if test="${not empty sessionScope.error}">
                    <div class="alert alert-danger text-center">${sessionScope.error}</div>
                    <c:remove var="error" scope="session"/>
                </c:if>

                <div class="auth__body">
                    <form action="${url}/DivideServlet" method="post">
                        <input type="text" id="formName" name="formName" value="register" hidden>
                        <!-- Form Login -->
                        <div class="auth__input-group">
                            <input type="text" id="username" name="username" class="auth__input"
                                   placeholder="Tài khoản" value="${sessionScope.username}" required>
                        </div>
                        <div class="auth__input-group">
                            <input type="password" id="password" name="password" class="auth__input"
                                   placeholder="Mật khẩu" required>
                            <span toggle="#password" class="auth__eye-icon" id="toggle-password">
                                <i class="fas fa-eye-slash"></i>
                            </span>
                        </div>
                        <div class="auth__input-group">
                            <input type="password" id="confirmPassword" name="confirmPassword" class="auth__input" placeholder="Nhập lại mật khẩu" required>
                        </div>

                        <!-- Email -->
                        <div class="auth__input-group">
                            <input type="email" id="email" name="email" class="auth__input" placeholder="Email" value="${sessionScope.email}" required>
                        </div>

                        <!-- Ngày sinh -->
                        <div class="auth__input-group">
                            <input type="date" id="dateOfBirth" name="dateOfBirth" class="auth__input" placeholder="Ngày sinh" value="${sessionScope.dateOfBirth}" required>
                        </div>
                        <div class="auth__button-group">
                            <button type="submit" class="auth__button auth__button--login append">
                                Đăng Ký
                            </button>
                        </div>
                    </form>
                </div>
                <div class="dividerTB"></div>
                <div class="auth__footer">
                    <p class="auth__footer-text">Chưa đã có tài khoản? 
                        <a href="${url}/auth/login" class="auth__footer-link">
                            Đăng Nhập
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <script src="${js}/login.js"></script>
    </body>
</html>
