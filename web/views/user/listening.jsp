<%-- 
    Document   : listening
    Created on : Mar 25, 2025, 11:35:05 PM
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
        <link rel="stylesheet" href="${css}/listening.css" />
    </head>

    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="question-nav">
                        <div class="nav-left">
                            <div id="countdown" class="countdown-timer"></div>
                        </div>
                        <script>
                            var countdownTime = ${timeTest} * 60;
                        </script>    
                    </div>
                    <div class="testing"> 

                        <div class="left-section">
                            <div class="audio-section">
                                <div class="audio-player">
                                    <audio id="audio-player" controls preload="auto">
                                        <source id="audio-source" src="${audio}/" type="audio/mp3">
                                        Your browser does not support the audio element.
                                    </audio>
                                </div>
                                <div class="image-container" id="image-container" style="display: none;">
                                    <img id="question-image" src="${pageContext.request.contextPath}/" alt="Question Image">
                                </div>
                            </div>
                        </div>

                        <div class="right-section">
                            <c:forEach var="question" items="${listTest}" varStatus="status">
                                <div class="question-item ${status.index == 0 ? 'active' : ''}" 
                                     id="question${status.index + 1}" 
                                     data-img="${question.img}" 
                                     data-audio="${question.audio}" 
                                     data-part="${question.part}">

                                    <div class="question-text">
                                        Question ${status.index + 1}: ${question.question}
                                    </div>

                                    <input type="hidden" name="questionNumber" value="${status.index + 1}">
                                    <ul class="answer-options">
                                        <c:if test="${not empty question.option1}">
                                            <li class="answer-option">
                                                <input type="radio" name="question${status.index + 1}" value="${question.option1}" required />
                                                ${question.option1}
                                            </li>
                                        </c:if>
                                        <c:if test="${not empty question.option2}">
                                            <li class="answer-option">
                                                <input type="radio" name="question${status.index + 1}" value="${question.option2}" required />
                                                ${question.option2}
                                            </li>
                                        </c:if>
                                        <c:if test="${not empty question.option3}">
                                            <li class="answer-option">
                                                <input type="radio" name="question${status.index + 1}" value="${question.option3}" required />
                                                ${question.option3}
                                            </li>
                                        </c:if>
                                        <c:if test="${not empty question.option4}">
                                            <li class="answer-option">
                                                <input type="radio" name="question${status.index + 1}" value="${question.option4}" required />
                                                ${question.option4}
                                            </li>
                                        </c:if>
                                    </ul>
                                    <div class="button-group">
                                        <c:if test="${status.index > 0}">
                                            <button type="button" class="btn-back">Back</button>
                                        </c:if>
                                        <button type="button" class="btn-next">
                                            <c:choose>
                                                <c:when test="${status.index == listTest.size() - 1}">
                                                    Submit
                                                </c:when>
                                                <c:otherwise>
                                                    Next
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </div>

                                </div>
                            </c:forEach>
                            <div id="submit-container" style="display: none; text-align: center; margin-top: 20px;">
                                <button type="button" class="btn-submit" onclick="submitAnswers()">Submit All Answers</button>
                                <script >
                                    const urlPath = "${url}";
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
                <footer>
                    <%@ include file="../includes/footer.jsp" %>
                </footer>
            </div>
        </div>
        <%--<%@ include file="../includes/chatbot.jsp" %>--%>
        <script>
            const imgPath = "${img}";
            window.onload = function () {
                let message = "${sessionScope.logoutMessage}";
                if (message) {
                    alert(message);
                }
            };
        </script>
    <script>

        const contextPath = "${pageContext.request.contextPath}";
    </script>
    <!-- Xóa logoutMessage ngay lập tức -->
    <c:remove var="logoutMessage" scope="session" />
    <%@ include file="../includes/scripts.jsp" %>
    <script src="${js}/banner.js"></script>

    <script src="${js}/reading.js"></script>
    <script src="${js}/listening.js"></script>
</body>

</html>