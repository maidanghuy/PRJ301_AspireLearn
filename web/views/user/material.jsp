<%-- 
    Document   : material
    Created on : Mar 23, 2025, 12:59:39 AM
    Author     : NITRO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Tài Liệu Học Tập</title>
        <%@ include file="../includes/head.jsp" %>
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />
        <link rel="stylesheet" href="${css}/material.css" />
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
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="../includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="../includes/header.jsp" %>

                    <div class="material-content">
                        <div class="container">
                            <h2 class="section-title">Tài Liệu Học Tập</h2>

                            <c:if test="${empty sessionScope.user}">
                                <div class="alert alert-warning text-center mb-4" role="alert">
                                    <i class="fas fa-exclamation-circle me-2"></i>
                                    Vui lòng <a href="${pageContext.request.contextPath}/login?returnUrl=${pageContext.request.contextPath}/material" class="alert-link">đăng nhập</a> để mua và xem chi tiết tài liệu!
                                </div>
                            </c:if>

                            <!-- Thanh tìm kiếm -->
                            <div class="search-container">
                                <i class="fas fa-search search-icon"></i>
                                <input type="text" class="search-box" id="searchInput" placeholder="Tìm kiếm tài liệu..." oninput="searchMaterials()">
                            </div>

                            <!-- Tài liệu miễn phí -->
                            <div class="mb-5">
                                <h3 class="section-title">Tài Liệu Miễn Phí</h3>
                                <div class="row">
                                    <c:forEach items="${materials}" var="material">
                                        <c:if test="${material.price == 0}">
                                            <div class="col-md-4 mb-4">
                                                <div class="card h-100">
                                                    <span class="badge-corner badge-free">MIỄN PHÍ</span>
                                                    <img src="${pageContext.request.contextPath}${material.imagePath}" class="card-img-top" alt="${material.title}">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${material.title}</h5>
                                                        <p class="card-text">${material.shortDescription}</p>
                                                        <div class="study-time">
                                                            <i class="far fa-clock"></i>
                                                            <span>${material.studyTime} giờ học</span>
                                                        </div>
                                                        <c:choose>
                                                            <c:when test="${not empty sessionScope.user}">
                                                                <button class="btn btn-primary btn-view-detail" 
                                                                        data-bs-toggle="modal" 
                                                                        data-bs-target="#material${material.materialId}DetailModal">
                                                                    <i class="fas fa-info-circle me-2"></i>Xem chi tiết
                                                                </button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button class="btn btn-secondary btn-view-detail" 
                                                                        onclick="showLoginAlert()">
                                                                    <i class="fas fa-lock me-2"></i>Đăng nhập để xem
                                                                </button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Tài liệu trả phí -->
                            <div class="mb-5">
                                <h3 class="section-title">Tài Liệu Trả Phí</h3>
                                <div class="row">
                                    <c:forEach items="${materials}" var="material">
                                        <c:if test="${material.price > 0}">
                                            <div class="col-md-4 mb-4">
                                                <div class="card h-100">
                                                    <span class="badge-corner badge-paid">
                                                        <i class="fas fa-tags me-1"></i>
                                                        ${material.price} VNĐ
                                                    </span>
                                                    <img src="${pageContext.request.contextPath}${material.imagePath}" class="card-img-top" alt="${material.title}">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${material.title}</h5>
                                                        <p class="card-text">${material.shortDescription}</p>
                                                        <div class="study-time">
                                                            <i class="far fa-clock"></i>
                                                            <span>${material.studyTime} giờ học</span>
                                                        </div>
                                                        <div class="price-tag">${material.price} VNĐ</div>
                                                        <c:choose>
                                                            <c:when test="${not empty sessionScope.user}">
                                                                <button class="btn btn-success btn-view-detail" 
                                                                        data-bs-toggle="modal" 
                                                                        data-bs-target="#material${material.materialId}DetailModal">
                                                                    <i class="fas fa-info-circle me-2"></i>Xem chi tiết
                                                                </button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button class="btn btn-secondary btn-view-detail" 
                                                                        onclick="showLoginAlert()">
                                                                    <i class="fas fa-lock me-2"></i>Đăng nhập để xem
                                                                </button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <%@ include file="../includes/scripts.jsp" %> 
        <script src="${js}/material.js"></script>
        <script>
            function searchMaterials() {
                const searchInput = document.getElementById('searchInput');
                const searchTerm = searchInput.value.toLowerCase();
                const cards = document.querySelectorAll('.card');
                
                cards.forEach(card => {
                    const title = card.querySelector('.card-title').textContent.toLowerCase();
                    const description = card.querySelector('.card-text').textContent.toLowerCase();
                    
                    if (title.includes(searchTerm) || description.includes(searchTerm)) {
                        card.closest('.col-md-4').style.display = '';
                    } else {
                        card.closest('.col-md-4').style.display = 'none';
                    }
                });
            }

            function showLoginAlert() {
                alert('Vui lòng đăng nhập để xem chi tiết tài liệu!');
            }
        </script>

        <!-- Modal cho từng tài liệu -->
        <c:forEach items="${materials}" var="material">
            <div class="modal fade" id="material${material.materialId}DetailModal" tabindex="-1" aria-labelledby="materialDetailModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="materialDetailModalLabel">${material.title}</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="course-info-box">
                                        <img src="${pageContext.request.contextPath}${material.imagePath}" class="card-img-top" alt="${material.title}">
                                        <div class="study-time mb-3">
                                            <i class="far fa-clock me-2"></i>
                                            <span>${material.studyTime} giờ học</span>
                                        </div>
                                        <c:if test="${material.price > 0}">
                                            <div class="price-tag mb-3">${material.price} VNĐ</div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="highlights-content">
                                        <h6 class="fw-bold mb-3">Điểm nổi bật:</h6>
                                        <ul>
                                            <c:forTokens items="${material.highlights}" delims=";" var="highlight">
                                                <li>${highlight}</li>
                                            </c:forTokens>
                                        </ul>
                                    </div>
                                    <div class="detail-content">
                                        <h6 class="fw-bold mb-3">Mô tả chi tiết:</h6>
                                        <ul>
                                            <c:forTokens items="${material.detailContent}" delims=";" var="detail">
                                                <li>${detail}</li>
                                            </c:forTokens>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <c:if test="${material.price > 0}">
                                <button type="button" class="btn btn-primary">Mua ngay</button>
                            </c:if>
                            <c:if test="${material.price == 0}">
                                <a href="${material.pathLink}" class="btn btn-success download-btn" onclick="console.log('Link being clicked:', '${material.pathLink}'); handleGoogleDriveDownload('${material.pathLink}'); return false;">Tải xuống</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </body>

</html>
