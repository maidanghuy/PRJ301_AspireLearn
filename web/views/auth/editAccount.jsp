<%-- Document : editAccount Created on : Mar 17, 2025, 3:39:59 AM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" href="${css}/editAccount.css" />

    </head>

    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="editAccount">
                        <div class="edit-card">
                            <div class="edit-header">
                                <h2>Edit Profile</h2>
                                <p>Update your personal information</p>
                            </div>

                            <form action="${url}/DivideServlet" method="POST" class="edit-form">
                                <input type="text" id="formName" name="formName" value="editAccount" hidden>
                                <!-- Avatar Section -->
                                <div class="avatar-section">
                                    <div class="current-avatar">
                                        <img src="${img}/avatar.png"
                                             alt="User Avatar" id="avatarPreview">
                                    </div>
                                    <div class="avatar-upload">
                                        <label for="avatar" class="upload-btn">
                                            <i class="fas fa-camera"></i>
                                            Change Avatar
                                        </label>
                                        <input type="file" id="avatar" name="avatar" accept="image/*"
                                               hidden>
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
                                <!-- Personal Information -->
                                <div class="form-section">
                                    <h3>Personal Information</h3>
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" id="username" name="username"
                                               value="${sessionScope.user.username}" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="email" id="email" name="email"
                                               value="${sessionScope.user.email}" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="username">Birthday</label>
                                        <input type="date" id="dateOfBirth" name="dateOfBirth" class="auth__input" placeholder="Ngày sinh" value="${sessionScope.user.dateOfBirth}" required>
                                    </div>
                                </div>

                                <!-- Change Password Section -->
                                <div class="form-section">
                                    <h3>Change Password</h3>
                                    <div class="form-group">
                                        <label for="currentPassword">Current Password</label>
                                        <input type="password" id="currentPassword" name="currentPassword" value="${sessionScope.user.password}">
                                    </div>

                                    <div class="form-group">
                                        <label for="newPassword">New Password</label>
                                        <input type="password" id="newPassword" name="newPassword">
                                    </div>

                                    <div class="form-group">
                                        <label for="confirmPassword">Confirm New Password</label>
                                        <input type="password" id="confirmPassword" name="confirmPassword">
                                    </div>
                                </div>

                                <!-- Action Buttons -->
                                <div class="form-actions">
                                    <button type="submit" class="btn-save">Save Changes</button>
                                    <a href="${url}/view/account" class="btn-cancel">Cancel</a>
                                </div>
                            </form>
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