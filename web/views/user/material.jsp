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
        <title>Home Page</title>
        <%@ include file="../includes/head.jsp" %>
        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
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
                            <h2 class="mb-5">Tài Liệu Học Tập</h2>

                            <c:if test="${empty sessionScope.user}">
                                <div class="alert alert-warning text-center mb-4" role="alert">
                                    <i class="fas fa-exclamation-circle me-2"></i>
                                    Vui lòng <a href="${pageContext.request.contextPath}/login?returnUrl=${pageContext.request.contextPath}/material" class="alert-link">đăng nhập</a> để mua và xem chi tiết tài liệu!
                                </div>
                            </c:if>

                            <!-- Thanh tìm kiếm -->
                            <div class="search-container">
                                <i class="fas fa-search search-icon" onclick="focusSearch()"></i>
                                <input type="text" class="search-box" id="searchInput" placeholder="Tìm kiếm tài liệu..." oninput="searchMaterials()">
                                <div id="searchResponse" class="search-response"></div>
                            </div>

                            <!-- Tài liệu miễn phí -->
                            <div class="mb-5">
                                <h3>Tài Liệu Miễn Phí</h3>
                                <div class="row">
                                    <div class="col-md-4 mb-4">
                                        <div class="card h-100">
                                            <span class="badge-corner">FREE</span>
                                            <img src="${img}/material/Material_BigStep1.jpg" class="card-img-top" alt="Big Step TOEIC 1">
                                            <div class="card-body">
                                                <h5 class="card-title">Big Step TOEIC 1</h5>
                                                <p class="card-text">Khóa học TOEIC cơ bản cho người mới bắt đầu. Bao gồm các chủ đề ngữ pháp và từ vựng thiết yếu.</p>
                                                <p class="card-text"><small class="text-muted">Miễn phí</small></p>
                                                <c:choose>
                                                    <c:when test="${not empty sessionScope.user}">
                                                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#toeic1DetailModal">Xem chi tiết</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-secondary" onclick="showLoginAlert()">Xem chi tiết</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal Chi tiết TOEIC 1 -->
                            <div class="modal fade" id="toeic1DetailModal" tabindex="-1">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content" style="border-radius: 15px; overflow: hidden;">
                                        <div class="modal-header" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); color: white; border: none;">
                                            <h5 class="modal-title d-flex align-items-center">
                                                <i class="fas fa-graduation-cap me-2"></i>
                                                Big Step TOEIC 1
                                            </h5>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body p-4">
                                            <div class="row mb-5">
                                                <div class="col-md-4">
                                                    <div class="text-center course-info-box p-4" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <img src="${img}/material/Material_BigStep1.jpg" class="img-fluid rounded-3 mb-4" style="max-width: 200px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" alt="Big Step TOEIC 1">
                                                        <span class="badge bg-success p-2 px-3 mb-3" style="font-size: 1rem; border-radius: 8px;">Miễn phí</span>
                                                        <div class="d-flex align-items-center justify-content-center text-muted">
                                                            <i class="far fa-clock me-2"></i>
                                                            <span>30 giờ học</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="course-intro p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <h4 class="text-primary mb-4" style="font-weight: 600;">Giới thiệu khóa học</h4>
                                                        <p class="lead mb-4" style="color: #495057;">Khóa học TOEIC cơ bản dành cho người mới bắt đầu, giúp bạn xây dựng nền tảng vững chắc cho hành trình chinh phục TOEIC.</p>
                                                        <div class="mt-4">
                                                            <h5 class="text-success mb-4">
                                                                <i class="fas fa-check-circle me-2"></i>
                                                                Bạn sẽ học được:
                                                            </h5>
                                                            <div class="row learning-outcomes">
                                                                <div class="col-md-6">
                                                                    <ul class="list-unstyled">
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Ngữ pháp cơ bản TOEIC
                                                                        </li>
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            3000+ từ vựng thiết yếu
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <ul class="list-unstyled">
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Kỹ năng làm bài Reading
                                                                        </li>
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Kỹ năng làm bài Listening
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="course-content mt-5">
                                                <div class="features-section mb-5 p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                    <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                        <i class="fas fa-star me-2"></i>
                                                        Đặc điểm nổi bật
                                                    </h4>
                                                    <div class="row g-4">
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-book-reader text-primary me-2"></i>
                                                                Giáo trình TOEIC cơ bản dành cho người mới bắt đầu
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-chart-line text-primary me-2"></i>
                                                                Phù hợp cho người học từ 0 điểm TOEIC
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-headphones text-primary me-2"></i>
                                                                Tài liệu kèm file Audio chất lượng cao
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-laptop text-primary me-2"></i>
                                                                Học trực tuyến mọi lúc mọi nơi
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="content-section p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                    <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                        <i class="fas fa-list-alt me-2"></i>
                                                        Nội dung sách
                                                    </h4>
                                                    <div class="row g-4">
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                Bài học ngữ pháp cơ bản
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                Từ vựng TOEIC thiết yếu
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                Bài tập thực hành sau mỗi bài học
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                File nghe MP3 chất lượng cao
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer border-0">
                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Đóng</button>
                                            <a href="https://drive.google.com/drive/folders/1MMBwCIOP5syjeM5iHmo0yLuu1ZB0-Fxt" target="_blank" 
                                               class="btn btn-primary" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); border: none;">
                                                <i class="fas fa-download me-2"></i>
                                                Tải tài liệu
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tài liệu trả phí -->
                            <div class="mb-5">
                                <h3>Tài Liệu Trả Phí</h3>
                                <div class="row">
                                    <div class="col-md-4 mb-4">
                                        <div class="card h-100">
                                            <span class="price-icon">$</span>
                                            <img src="${img}/material/Material_BigStep2.jpg" class="card-img-top" alt="Big Step TOEIC 2">
                                            <div class="card-body">
                                                <h5 class="card-title">Big Step TOEIC 2</h5>
                                                <p class="card-text">Khóa học TOEIC trung cấp với các bài tập và đề thi thực hành.</p>
                                                <p class="card-text"><strong>Giá: 199.000 VNĐ</strong></p>
                                                <c:choose>
                                                    <c:when test="${not empty sessionScope.user}">
                                                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#toeic2DetailModal">Xem chi tiết</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-secondary" onclick="showLoginAlert()">Xem chi tiết</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-4">
                                        <div class="card h-100">
                                            <span class="price-icon">$</span>
                                            <img src="${img}/material/Material_BigStep3.jpg" class="card-img-top" alt="Big Step TOEIC 3">
                                            <div class="card-body">
                                                <h5 class="card-title">Big Step TOEIC 3</h5>
                                                <p class="card-text">Khóa học TOEIC nâng cao, hướng tới điểm số 700+.</p>
                                                <p class="card-text"><strong>Giá: 299.000 VNĐ</strong></p>
                                                <c:choose>
                                                    <c:when test="${not empty sessionScope.user}">
                                                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#toeic3DetailModal">Xem chi tiết</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-secondary" onclick="showLoginAlert()">Xem chi tiết</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-4">
                                        <div class="card h-100">
                                            <span class="price-icon">$</span>
                                            <img src="${img}/material/business.jpg" class="card-img-top" alt="Business English Essentials">
                                            <div class="card-body">
                                                <h5 class="card-title">Business English Essentials</h5>
                                                <p class="card-text">Improve your business communication.</p>
                                                <p class="card-text"><strong>Giá: 399.000 VNĐ</strong></p>
                                                <c:choose>
                                                    <c:when test="${not empty sessionScope.user}">
                                                        <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#businessDetailModal">Xem chi tiết</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-secondary" onclick="showLoginAlert()">Xem chi tiết</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal Chi tiết TOEIC 2 -->
                            <div class="modal fade" id="toeic2DetailModal" tabindex="-1">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content" style="border-radius: 15px; overflow: hidden;">
                                        <div class="modal-header" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); color: white; border: none;">
                                            <h5 class="modal-title d-flex align-items-center">
                                                <i class="fas fa-graduation-cap me-2"></i>
                                                Big Step TOEIC 2
                                            </h5>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body p-4">
                                            <div class="row mb-5">
                                                <div class="col-md-4">
                                                    <div class="text-center course-info-box p-4" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <img src="${img}/material/Material_BigStep2.jpg" class="img-fluid rounded-3 mb-4" style="max-width: 200px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" alt="Big Step TOEIC 2">
                                                        <span class="badge bg-primary p-2 px-3 mb-3" style="font-size: 1rem; border-radius: 8px;">199.000 VNĐ</span>
                                                        <div class="d-flex align-items-center justify-content-center text-muted">
                                                            <i class="far fa-clock me-2"></i>
                                                            <span>40 giờ học</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="course-intro p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <h4 class="text-primary mb-4" style="font-weight: 600;">Giới thiệu khóa học</h4>
                                                        <p class="lead mb-4" style="color: #495057;">Khóa học TOEIC trung cấp dành cho người đã có nền tảng, giúp nâng cao kỹ năng và hướng tới điểm số 500+.</p>
                                                        <div class="mt-4">
                                                            <h5 class="text-success mb-4">
                                                                <i class="fas fa-check-circle me-2"></i>
                                                                Bạn sẽ học được:
                                                            </h5>
                                                            <div class="row learning-outcomes">
                                                                <div class="col-md-6">
                                                                    <ul class="list-unstyled">
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Ngữ pháp nâng cao TOEIC
                                                                        </li>
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            5000+ từ vựng chuyên sâu
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <ul class="list-unstyled">
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Chiến thuật làm bài thi
                                                                        </li>
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Đề thi thử TOEIC
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="course-content mt-5">
                                                <div class="features-section mb-5 p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                    <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                        <i class="fas fa-star me-2"></i>
                                                        Đặc điểm nổi bật
                                                    </h4>
                                                    <div class="row g-4">
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-book-reader text-primary me-2"></i>
                                                                Giáo trình TOEIC trung cấp
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-chart-line text-primary me-2"></i>
                                                                Phù hợp cho mục tiêu 500+ TOEIC
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-headphones text-primary me-2"></i>
                                                                Tài liệu kèm file Audio HD
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-laptop text-primary me-2"></i>
                                                                Bài tập online và offline
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="content-section p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                    <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                        <i class="fas fa-list-alt me-2"></i>
                                                        Nội dung sách
                                                    </h4>
                                                    <div class="row g-4">
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                Ngữ pháp và từ vựng nâng cao
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                Chiến thuật làm bài Reading
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                Kỹ năng Listening chuyên sâu
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                <i class="fas fa-check-circle text-success me-2"></i>
                                                                10 đề thi thử TOEIC
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer border-0">
                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Đóng</button>
                                            <a href="#" class="btn btn-primary" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); border: none;">
                                                <i class="fas fa-shopping-cart me-2"></i>
                                                Thanh toán - 199.000 VNĐ
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal Chi tiết TOEIC 3 -->
                            <div class="modal fade" id="toeic3DetailModal" tabindex="-1">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content" style="border-radius: 15px; overflow: hidden;">
                                        <div class="modal-header" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); color: white; border: none;">
                                            <h5 class="modal-title d-flex align-items-center">
                                                <i class="fas fa-graduation-cap me-2"></i>
                                                Big Step TOEIC 3
                                            </h5>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body p-4">
                                            <div class="row mb-5">
                                                <div class="col-md-4">
                                                    <div class="text-center course-info-box p-4" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <img src="${img}/material/Material_BigStep3.jpg" class="img-fluid rounded-3 mb-4" style="max-width: 200px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" alt="Big Step TOEIC 3">
                                                        <span class="badge bg-primary p-2 px-3 mb-3" style="font-size: 1rem; border-radius: 8px;">299.000 VNĐ</span>
                                                        <div class="d-flex align-items-center justify-content-center text-muted">
                                                            <i class="far fa-clock me-2"></i>
                                                            <span>50 giờ học</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="course-intro p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <h4 class="text-primary mb-4" style="font-weight: 600;">Giới thiệu khóa học</h4>
                                                        <p class="lead mb-4" style="color: #495057;">Khóa học TOEIC nâng cao dành cho người học muốn đạt điểm số 700+, tập trung vào các kỹ năng và chiến thuật làm bài thi chuyên sâu.</p>
                                                        <div class="mt-4">
                                                            <h5 class="text-success mb-4">
                                                                <i class="fas fa-check-circle me-2"></i>
                                                                Bạn sẽ học được:
                                                            </h5>
                                                            <div class="row learning-outcomes">
                                                                <div class="col-md-6">
                                                                    <ul class="list-unstyled">
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Ngữ pháp và từ vựng nâng cao
                                                                        </li>
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Chiến thuật làm bài thi TOEIC
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <ul class="list-unstyled">
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Kỹ năng phân tích đề thi
                                                                        </li>
                                                                        <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                            <i class="fas fa-check text-success me-2"></i>
                                                                            Luyện đề thi thử TOEIC
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="course-content mt-5">
                                                    <div class="features-section mb-5 p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                            <i class="fas fa-star me-2"></i>
                                                            Đặc điểm nổi bật
                                                        </h4>
                                                        <div class="row g-4">
                                                            <div class="col-md-6">
                                                                <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-book-reader text-primary me-2"></i>
                                                                    Giáo trình TOEIC nâng cao
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-chart-line text-primary me-2"></i>
                                                                    Hướng tới mục tiêu 700+ TOEIC
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-headphones text-primary me-2"></i>
                                                                    File nghe chất lượng cao
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-laptop text-primary me-2"></i>
                                                                    Đề thi thử online
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="content-section p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                        <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                            <i class="fas fa-list-alt me-2"></i>
                                                            Nội dung sách
                                                        </h4>
                                                        <div class="row g-4">
                                                            <div class="col-md-6">
                                                                <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-check-circle text-success me-2"></i>
                                                                    Ngữ pháp và từ vựng nâng cao
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-check-circle text-success me-2"></i>
                                                                    Kỹ năng Reading & Listening
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-check-circle text-success me-2"></i>
                                                                    15 đề thi thử TOEIC
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                                    <i class="fas fa-check-circle text-success me-2"></i>
                                                                    Giải thích chi tiết đáp án
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer border-0">
                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Đóng</button>
                                            <a href="#" class="btn btn-primary" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); border: none;">
                                                <i class="fas fa-shopping-cart me-2"></i>
                                                Thanh toán - 299.000 VNĐ
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal Chi tiết Business English -->
                    <div class="modal fade" id="businessDetailModal" tabindex="-1">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content" style="border-radius: 15px; overflow: hidden;">
                                <div class="modal-header" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); color: white; border: none;">
                                    <h5 class="modal-title d-flex align-items-center">
                                        <i class="fas fa-graduation-cap me-2"></i>
                                        Business English Essentials
                                    </h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body p-4">
                                    <div class="row mb-5">
                                        <div class="col-md-4">
                                            <div class="text-center course-info-box p-4" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                <img src="${img}/material/business.jpg" class="img-fluid rounded-3 mb-4" style="max-width: 200px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);" alt="Business English Essentials">
                                                <span class="badge bg-primary p-2 px-3 mb-3" style="font-size: 1rem; border-radius: 8px;">399.000 VNĐ</span>
                                                <div class="d-flex align-items-center justify-content-center text-muted">
                                                    <i class="far fa-clock me-2"></i>
                                                    <span>45 giờ học</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="course-intro p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                <h4 class="text-primary mb-4" style="font-weight: 600;">Giới thiệu khóa học</h4>
                                                <p class="lead mb-4" style="color: #495057;">Khóa học tiếng Anh chuyên sâu về giao tiếp trong môi trường kinh doanh, giúp bạn tự tin trong các tình huống công việc.</p>
                                                <div class="mt-4">
                                                    <h5 class="text-success mb-4">
                                                        <i class="fas fa-check-circle me-2"></i>
                                                        Bạn sẽ học được:
                                                    </h5>
                                                    <div class="row learning-outcomes">
                                                        <div class="col-md-6">
                                                            <ul class="list-unstyled">
                                                                <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                    <i class="fas fa-check text-success me-2"></i>
                                                                    Từ vựng kinh doanh
                                                                </li>
                                                                <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                    <i class="fas fa-check text-success me-2"></i>
                                                                    Kỹ năng thuyết trình
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <ul class="list-unstyled">
                                                                <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                    <i class="fas fa-check text-success me-2"></i>
                                                                    Email business
                                                                </li>
                                                                <li class="mb-3 p-3" style="background: #f8f9fa; border-radius: 10px;">
                                                                    <i class="fas fa-check text-success me-2"></i>
                                                                    Đàm phán trong kinh doanh
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="course-content mt-5">
                                            <div class="features-section mb-5 p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                    <i class="fas fa-star me-2"></i>
                                                    Đặc điểm nổi bật
                                                </h4>
                                                <div class="row g-4">
                                                    <div class="col-md-6">
                                                        <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-book-reader text-primary me-2"></i>
                                                            Giáo trình Business English
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-chart-line text-primary me-2"></i>
                                                            Tình huống thực tế
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-headphones text-primary me-2"></i>
                                                            Audio đàm thoại thực tế
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="feature-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-laptop text-primary me-2"></i>
                                                            Bài tập tương tác
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="content-section p-4" style="background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);">
                                                <h4 class="text-primary mb-4" style="font-weight: 600;">
                                                    <i class="fas fa-list-alt me-2"></i>
                                                    Nội dung sách
                                                </h4>
                                                <div class="row g-4">
                                                    <div class="col-md-6">
                                                        <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-check-circle text-success me-2"></i>
                                                            Giao tiếp trong văn phòng
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-check-circle text-success me-2"></i>
                                                            Viết email chuyên nghiệp
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-check-circle text-success me-2"></i>
                                                            Kỹ năng thuyết trình
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="content-item p-3" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%); border-radius: 10px;">
                                                            <i class="fas fa-check-circle text-success me-2"></i>
                                                            Đàm phán và họp
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer border-0">
                                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Đóng</button>
                                    <a href="#" class="btn btn-primary" style="background: linear-gradient(135deg, #0061f2 0%, #6900f2 100%); border: none;">
                                        <i class="fas fa-shopping-cart me-2"></i>
                                        Thanh toán - 399.000 VNĐ
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
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
</body>

</html>
