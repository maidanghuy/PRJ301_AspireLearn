<%-- 
    Document   : course
    Created on : Mar 21, 2025, 11:44:31 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" import="model.*,java.util.*, dao.*, controller.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Courses - G-easy Learning</title>
        <%@ include file="../includes/head.jsp" %>

        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />
        <link rel="stylesheet" href="${css}/course.css">

    </head>


    <body>
        <c:if test="${featureMessage == false}">
            <script>
                window.onload = function () {
                    setTimeout(function () {
                        alert("Tính năng này chưa có sẵn!");
                    }, 500); // Hiện alert sau 500ms
                };
            </script>
        </c:if>

        <% List<Course> courseL = new ArrayList<>();
            if (request.getAttribute("list") != null) {
                courseL = (List<Course>) request.getAttribute("list");
            }
        %>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>
                    <div class="course">
                        <div class="container">
                            <div class="course__banner">
                                <img src="${img}/course/bannercourse.jpg"
                                     alt="IELTS_Beginer" class="course_banner_img" />
                                <div class="course__info">
                                    <h1 class="course__title">Course online</h1>
                                    <p class="course__description">
                                        Join our online English course to improve your skills anytime, anywhere! Learn grammar, vocabulary, and conversation with expert instructors. Start today and boost your confidence!
                                    </p>
                                </div>
                            </div>

                            <div class="filter-bar">
                                <a href="#"><button class="filter-btn" onclick="showAllCourses()">Tất cả khóa học</button></a>
                                <a href="#"><button class="filter-btn" onclick="showPaidCourses()">Đã thanh toán</button></a>
                                <div>
                                    <button class="icon-btn">
                                        <img src="${img}/course/Filter.svg" alt="Filter" />
                                        <ul class="icon-catetory">
                                            <li class="icon-catetory-sub">
                                                <a href="#" onclick="filterByLevel('all')">Tất cả level</a>
                                            </li>
                                            <li class="icon-catetory-sub">
                                                <a href="#" onclick="filterByLevel('Beginner')">Beginner</a>
                                            </li>
                                            <li class="icon-catetory-sub">
                                                <a href="#" onclick="filterByLevel('Intermediate')">Intermediate</a>
                                            </li>
                                            <li class="icon-catetory-sub">
                                                <a href="#" onclick="filterByLevel('Advanced')">Advanced</a>
                                            </li>
                                        </ul>
                                    </button>
                                </div>
                                <div class="search-bar">
                                    <img src="${img}/course/Vector.svg" alt="Tìm kiếm">
                                    <input type="text" id="searchInput" placeholder="Tìm kiếm khóa học..." onkeyup="searchCourses()">
                                </div>
                            </div>

                            <div class="course-container">
                                <% for (Course course : courseL) {%>
                                <div class="course-card">
                                    <img src="${img}/course/<%= course.getLinkimg()%>"
                                         alt="<%= course.getCourseName()%>"
                                         class="course-img">
                                    <h3>
                                        <%= course.getCourseName()%>
                                    </h3>
                                    <p><strong>Level</strong>
                                        <%= course.getLevel()%>
                                    </p>
                                    <a href="${url}/view/course/<%= course.getCourseID()%>">
                                        <button class="detail-btn">Xem chi tiết</button>
                                    </a>
                                </div>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
                <footer>
                    <%@ include file="../includes/footer.jsp" %>
                </footer>
            </div>
        </div>
        <%@ include file="../includes/chatbot.jsp" %>
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <%@ include file="../includes/scripts.jsp" %>
        <script src="${js}/course.js"></script>
        <script>
        function filterByLevel(level) {
            const cards = document.querySelectorAll('.course-card');
            cards.forEach(card => {
                const courseLevel = card.querySelector('p strong').nextSibling.textContent.trim();
                if (level === 'all' || courseLevel === level) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
            
            // Update active filter button text
            const filterBtn = document.querySelector('.icon-btn');
            const filterText = level === 'all' ? 'Tất cả level' : level;
            filterBtn.setAttribute('data-active-filter', filterText);
        }
        </script>
        <script>
        function searchCourses() {
            const searchInput = document.getElementById('searchInput');
            const searchText = searchInput.value.toLowerCase();
            const cards = document.querySelectorAll('.course-card');
            
            cards.forEach(card => {
                const courseName = card.querySelector('h3').textContent.toLowerCase();
                const courseLevel = card.querySelector('p strong').nextSibling.textContent.toLowerCase();
                
                if (courseName.includes(searchText) || courseLevel.includes(searchText)) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
            
            // Add no results message
            const visibleCards = document.querySelectorAll('.course-card[style="display: block;"]');
            const noResultsMessage = document.getElementById('noResultsMessage');
            
            if (visibleCards.length === 0 && searchText !== '') {
                if (!noResultsMessage) {
                    const message = document.createElement('div');
                    message.id = 'noResultsMessage';
                    message.className = 'no-results-message';
                    message.innerHTML = `
                        <img src="${img}/course/no-results.svg" alt="Không tìm thấy kết quả">
                        <h3>Không tìm thấy khóa học</h3>
                        <p>Vui lòng thử lại với từ khóa khác</p>
                    `;
                    document.querySelector('.course-container').appendChild(message);
                }
            } else if (noResultsMessage) {
                noResultsMessage.remove();
            }
        }

        // Add debounce function to improve performance
        function debounce(func, wait) {
            let timeout;
            return function executedFunction(...args) {
                const later = () => {
                    clearTimeout(timeout);
                    func(...args);
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
            };
        }

        // Apply debounce to search function
        const debouncedSearch = debounce(searchCourses, 300);
        document.getElementById('searchInput').addEventListener('input', debouncedSearch);
        </script>
        <script>
        function showAllCourses() {
            const cards = document.querySelectorAll('.course-card');
            cards.forEach(card => {
                card.style.display = 'block';
            });
            
            // Remove no results message if exists
            const noResultsMessage = document.getElementById('noResultsMessage');
            if (noResultsMessage) {
                noResultsMessage.remove();
            }
            
            // Update active state of buttons
            updateActiveButton('all');
        }

        function showPaidCourses() {
            const cards = document.querySelectorAll('.course-card');
            let hasVisibleCards = false;
            
            cards.forEach(card => {
                // Check if course is paid (you'll need to add this data attribute to your course cards)
                const isPaid = card.getAttribute('data-paid') === 'true';
                if (isPaid) {
                    card.style.display = 'block';
                    hasVisibleCards = true;
                } else {
                    card.style.display = 'none';
                }
            });
            
            // Show no results message if no paid courses
            const noResultsMessage = document.getElementById('noResultsMessage');
            if (!hasVisibleCards) {
                if (!noResultsMessage) {
                    const message = document.createElement('div');
                    message.id = 'noResultsMessage';
                    message.className = 'no-results-message';
                    message.innerHTML = `
                        <img src="${img}/course/no-results.svg" alt="Không có khóa học đã thanh toán">
                        <h3>Chưa có khóa học đã thanh toán</h3>
                        <p>Hãy đăng ký và thanh toán khóa học để xem nội dung</p>
                    `;
                    document.querySelector('.course-container').appendChild(message);
                }
            } else if (noResultsMessage) {
                noResultsMessage.remove();
            }
            
            // Update active state of buttons
            updateActiveButton('paid');
        }

        function updateActiveButton(type) {
            const buttons = document.querySelectorAll('.filter-btn');
            buttons.forEach(button => {
                if (type === 'all' && button.textContent.includes('Tất cả')) {
                    button.classList.add('active');
                } else if (type === 'paid' && button.textContent.includes('Đã thanh toán')) {
                    button.classList.add('active');
                } else {
                    button.classList.remove('active');
                }
            });
        }

        // Update the course card HTML to include paid status
        document.querySelectorAll('.course-card').forEach(card => {
            // You'll need to replace this with actual paid status from your backend
            const isPaid = false; // This should come from your backend
            card.setAttribute('data-paid', isPaid);
        });
        </script>

    </body>

</html>