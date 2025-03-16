<%-- 
    Document   : login
    Created on : Mar 16, 2025, 10:45:59 AM
    Author     : macbookpro
--%>


<%@page contentType="text/html" import="constant.GoogleInfo" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Login Page</title>
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

                <c:if test="${not empty sessionScope.message}">
                    <div class="alert alert-success text-center">${sessionScope.message}</div>
                    <c:remove var="message" scope="session"/>
                </c:if>


                <div class="auth__body">
                    <form action="${url}/DivideServlet" method="post">
                        <input type="text" id="formName" name="formName" value="login" hidden>
                        <!-- Form Login -->
                        <div class="auth__input-group">
                            <input type="text" id="username" name="username" class="auth__input"
                                   placeholder="Tài khoản" required>
                        </div>
                        <div class="auth__input-group">
                            <input type="password" id="password" name="password" class="auth__input"
                                   placeholder="Mật khẩu" required>
                            <span toggle="#password" class="auth__eye-icon" id="toggle-password">
                                <i class="fas fa-eye-slash"></i>
                            </span>
                        </div>
                        <div class="auth__input-group">
                            <a href="#" class="auth__forgot-password">Quên mật khẩu?</a>
                        </div>
                        <div class="auth__button-group">
                            <button type="submit" class="auth__button auth__button--login append">Đăng
                                Nhập</button>
                        </div>
                    </form>
                </div>
                <div class="dividerTB"></div>
                <div class="auth__footer">
                    <p class="auth__footer-text">Chưa có tài khoản?
                        <a href="${url}/auth/register" class="auth__footer-link">
                            Đăng Ký
                        </a>
                    </p>
                </div>
                <div style="margin: 0 auto;" class="col-12 col-lg-5 d-flex align-items-center">
                    <div class="d-flex gap-3 flex-column w-100 ">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/AspireLearn/auth/login&response_type=code&client_id=${GoogleInfo.GOOGLE_CLIENT_ID}&approval_prompt=force"
                           class="btn btn-lg btn-danger" style="
                           display: flex;
                           justify-content: center;
                           ">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-google" viewBox="0 0 16 16">
                            <path
                                d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                            </svg>
                            <span class="ms-2 fs-6">Sign in with Google</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <script src="${js}/login.js"></script>

    </body>
</html>