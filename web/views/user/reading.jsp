<%-- 
    Document   : reading.jsp
    Created on : Mar 25, 2025, 10:39:08 PM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <link rel="stylesheet" href="${css}/account.css" />
        <link rel="stylesheet" href="${css}/reading.css" />
        <style>
            .testing {
                display: flex;
                gap: 20px;
                padding: 20px;
            }
            .question-container {
                width: 80%;
            }
            .question-nav {
                width: 20%;
                position: sticky;
                top: 20px;
                align-self: flex-start;
                background: white;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>

    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="testing">

                        <div class="question-container">

                            <c:set var="currentPart" value="" />

                            <!-- Danh sách các phần -->
                            <div class="part-navigation">
                                <c:forEach var="question" items="${list}" varStatus="status">
                                    <c:if test="${question.part != currentPart}">
                                        <button
                                            class="part-button"
                                            onclick="showPart('${question.part}')"
                                            >
                                            Part ${question.part}
                                        </button>
                                        <c:set var="currentPart" value="${question.part}" />
                                    </c:if>
                                </c:forEach>
                            </div>

                            <!-- Danh sách câu hỏi -->
                            <c:set var="currentPart" value="" />
                            <c:set var="questionNumber" value="1" />
                            <c:forEach var="question" items="${list}" varStatus="status">
                                <c:if test="${question.part != currentPart}">
                                    <div
                                        class="question-part-container"
                                        id="part${question.part}"
                                        style="display: none"
                                        >
                                        <c:set var="currentPart" value="${question.part}" />
                                    </div>

                                    <c:if test="${question.part != currentPart}">
                                        <img src="${pageContext.request.contextPath}/${question.part}" 
                                             alt="Part ${question.part}" 
                                             style="display: block; max-width: 100%; height: auto;">
                                        <c:set var="currentPart" value="${question.part}" />
                                    </c:if>

                                </c:if>




                                <div class="question-item part${question.part}">
                                    <c:if test="${not empty question.part && not empty question.paragraph}">
                                        <c:set var="formattedParagraph" value="${fn:replace(question.paragraph, '/', '<p></p>')}" />
                                        <div class="paragraph-text">
                                            Part ${question.part}: <p>${formattedParagraph}</p>
                                        </div>

                                    </c:if>

                                    <div class="question-text" id="question${questionNumber}" ">
                                        Question ${questionNumber}: ${question.question}
                                    </div>

                                    <ul class="answer-options">
                                        <li class="answer-option">
                                            <input
                                                type="radio"
                                                name="question${questionNumber}"
                                                value="${question.option1}"
                                                />${question.option1}
                                        </li>
                                        <li class="answer-option">
                                            <input
                                                type="radio"
                                                name="question${questionNumber}"
                                                value="${question.option2}"
                                                />${question.option2}
                                        </li>
                                        <li class="answer-option">
                                            <input
                                                type="radio"
                                                name="question${questionNumber}"
                                                value="${question.option3}"
                                                />${question.option3}
                                        </li>
                                        <li class="answer-option">
                                            <input
                                                type="radio"
                                                name="question${questionNumber}"
                                                value="${question.option4}"
                                                />${question.option4}
                                        </li>
                                    </ul>
                                </div>
                                <c:set var="questionNumber" value="${questionNumber + 1}" />
                            </c:forEach>


                        </div>

                        <div class="question-nav">
                            <div>
                                <div id="countdown" class="countdown-timer"></div>
                                <script>
                                    var countdownTime = ${timeTest} * 60;
                                </script>
                                <div class="question-numbers">
                                    <c:forEach var="question" items="${list}" varStatus="status">
                                        <a href="#question${status.index + 1}" 
                                           class="question-link part${question.part}"
                                           onclick="showQuestion(${status.index})">
                                            ${status.index + 1}
                                        </a>
                                    </c:forEach>
                                </div>
                                <button type="button" class="btn-submit" onclick="submitAnswers()">Submit</button>
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
        <script >
            const urlPath = "${url}";
        </script>
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
            document.addEventListener("DOMContentLoaded", function () {
                let paragraphDiv = document.querySelector(".paragraph-text");
                if (paragraphDiv) {
                    let text = paragraphDiv.innerHTML;
                    let parts = text.split("/").map(part => `<p>${part.trim()}</p>`).join("");
                    paragraphDiv.innerHTML = parts;
                }
            });
        </script>
        <!-- Xóa logoutMessage ngay lập tức -->
        <c:remove var="logoutMessage" scope="session" />
        <%@ include file="../includes/scripts.jsp" %>
        <script src="${js}/banner.js"></script>
        <script src="${js}/reading.js"></script>

    </body>

</html>
