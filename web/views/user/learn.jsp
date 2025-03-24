<%-- Document : index Created on : Mar 3, 2025, 12:39:54 AM Author : macbookpro --%>

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
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />
        <link rel="stylesheet" href="${css}/learn.css" />
    </head>

    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="learn">
                        <div class="container">
                            <!-- Sidebar -->
                            <aside class="sidebar__child">
                                <div class="sidebar__search">
                                    <input type="text" class="sidebar__input" placeholder="Tìm kiếm...">
                                    <button class="sidebar__button"><i class="fas fa-search"></i></button>
                                </div>
                                <!------------------------------------------------------------------------>
                                <ul class="lesson-list">
                                    <c:forEach items="${requestScope.listContent}" var="c" varStatus="count">
                                        <li class="lesson" data-id="lesson-${count.index + 1}">
                                            <div class="lesson__icon"><i class="fas fa-play-circle"></i></div>
                                            <div class="lesson__content">
                                                <h3 class="lesson__title">${c.title}</h3>
                                                <p class="lesson__description">${c.describe}</p>
                                            </div>
                                            <span class="lesson__progress">0%</span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </aside>
                            <!------------------------------------------------------------------------>
                            <main class="content">
                                <c:forEach items="${requestScope.listContent}" var="c" varStatus="count">
                                    <div class="lesson-content ${count.index == 0 ? 'lesson-content--active' : ''}"
                                         data-id="lesson-${count.index + 1}">

                                        <!-- Hiển thị video nếu contentType là Grammar -->
                                        <c:if
                                            test="${not empty c.contentType and c.contentType eq 'Grammar' and not empty c.videoPath}">
                                            <iframe src="${c.videoPath}" title="YouTube video player"
                                                    frameborder="0"
                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                                    referrerpolicy="strict-origin-when-cross-origin"
                                                    style="aspect-ratio: 16 / 9; width: 100%; max-width: 800px;"
                                                    allowfullscreen></iframe>
                                            </c:if>

                                        <h2 class="lesson-detail__title">${c.title}</h2>
                                        <p class="lesson-detail__description">${c.describe}</p>

                                        <!-- Hiển thị filePath nếu contentType là Vocabulary, Grammar hoặc Reading -->
                                        <c:if
                                            test="${not empty c.contentType and not empty c.filePath 
                                                    and (c.contentType eq 'Vocabulary' or c.contentType eq 'Grammar' or c.contentType eq 'Reading')}">
                                            <div class="lesson-file">
                                                <!-- <button><a href="${c.filePath}" target="_blank">Down LOad</a></button> -->
                                                <a href="${c.filePath}" class="download-btn">
                                                    <i class="fas fa-download"></i>
                                                    Download tài liệu
                                                </a>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </main>
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
        <script src="${js}/learn.js"></script>
    </body>

</html>