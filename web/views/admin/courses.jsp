<%-- Document : courses Created on : Mar 24, 2025, 2:03:30 AM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Management - G-Easy Learning</title>
        <%@ include file="../includes/head.jsp" %>
        <link rel="stylesheet" href="${css}/admin/dashboard.css">
        <link rel="stylesheet" href="${css}/admin/courses.css">
    </head>

    <body>
        <div class="dashboard-container">
            <!-- Include Sidebar -->
            <%@ include file="../includes/sidebar.jsp" %>

            <!-- Main Content -->
            <div class="dashboard-main">
                <div class="dashboard-nav">
                    <div class="nav-left">
                        <h2>Course Management</h2>
                    </div>
                    <div class="nav-right">
                        <button class="btn-add" onclick="openAddCourseModal()">
                            <i class="fas fa-plus"></i> Add New Course
                        </button>
                    </div>
                </div>

                <!-- Search and Filter Section -->
                <div class="search-filter-container">
                    <div class="search-box">
                        <input type="text" id="searchCourse" placeholder="Search courses..." value="${search}">
                        <i class="fas fa-search"></i>
                    </div>
                    <div class="filter-box">
                        <select id="levelFilter">
                            <option value="">All Levels</option>
                            <option value="Beginner" ${levelFilter=='Beginner' ? 'selected' : '' }>Beginner</option>
                            <option value="Intermediate" ${levelFilter=='Intermediate' ? 'selected' : '' }>Intermediate</option>
                            <option value="Advanced" ${levelFilter=='Advanced' ? 'selected' : '' }>Advanced</option>
                        </select>
                        <select id="pageSize" onchange="changePageSize(this.value)">
                            <option value="5" ${pageSize==5 ? 'selected' : '' }>5 per page</option>
                            <option value="15" ${pageSize==15 ? 'selected' : '' }>15 per page</option>
                            <option value="25" ${pageSize==25 ? 'selected' : '' }>25 per page</option>
                        </select>
                    </div>
                </div>

                <!-- Courses Table -->
                <div class="table-container">
                    <table class="courses-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Image</th>
                                <th>Course Name</th>
                                <th>Level</th>
                                <th>Commitment</th>
                                <th>Created Date</th>
                                <th>Updated Date</th>
                                <th style="display: none;">Description</th>
                                <th style="display: none;">Details</th>
                                <th style="display: none;">Commitment</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${courses}" var="course">
                                <tr>
                                    <td>${course.courseID}</td>
                                    <td>
                                        <img src="${img}/course/Japanese-N4.jpg" alt="Course Thumbnail"
                                             class="course-thumbnail">
                                    </td>
                                    <td>${course.courseName}</td>
                                    <td>
                                        <span
                                            class="level-badge ${course.level.toLowerCase()}">${course.level}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${fn:length(course.commit) > 100}">
                                                ${fn:substring(course.commit, 0, 100)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${course.commit}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${course.createdAt}</td>
                                    <td>${course.updatedAt}</td>
                                    <td style="display: none;">${course.description}</td>
                                    <td style="display: none;">${course.details}</td>
                                    <td style="display: none;">${course.commit}</td>
                                    <td>
                                        <div class="actions">
                                            <button onclick="viewCourse(this)"
                                                    class="btn-action view">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button onclick="editCourse(this)"
                                                    class="btn-action edit">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button onclick="confirmDelete(${course.courseID})"
                                                    class="btn-action delete">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>                                   
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="pagination-container">
                    <div class="pagination-info">
                        Showing ${(currentPage-1)*pageSize + 1} to ${Math.min(currentPage*pageSize,
                                  1*totalCourses)} of ${totalCourses} entries
                    </div>
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="javascript:void(0)" onclick="gotoPage(1)" class="page-link">
                                <i class="fas fa-angle-double-left"></i>
                            </a>
                            <a href="javascript:void(0)" onclick="gotoPage(${currentPage - 1})"
                               class="page-link">
                                <i class="fas fa-angle-left"></i>
                            </a>
                        </c:if>

                        <c:forEach begin="${Math.max(1, currentPage - 2)}"
                                   end="${Math.min(1*totalPages, currentPage + 2)}" var="i">
                            <a href="javascript:void(0)" onclick="gotoPage(${i})"
                               class="page-link ${currentPage == i ? 'active' : ''}">${i}</a>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="javascript:void(0)" onclick="gotoPage(${currentPage + 1})"
                               class="page-link">
                                <i class="fas fa-angle-right"></i>
                            </a>
                            <a href="javascript:void(0)" onclick="gotoPage(${totalPages})"
                               class="page-link">
                                <i class="fas fa-angle-double-right"></i>
                            </a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add/Edit Course Modal -->
        <div id="courseModal" class="modal">
            <div class="modal-content large-modal">
                <span class="close">&times;</span>
                <h2 id="modalTitle">Add New Course</h2>
                <form id="courseForm" action="${url}/dashboard/courses/save" method="POST"
                      enctype="multipart/form-data">
                    <input type="hidden" id="courseId" name="courseID">

                    <div class="form-row">
                        <div class="form-group">
                            <label for="courseName">Course Name*</label>
                            <input type="text" id="courseName" name="courseName" required>
                        </div>
                        <div class="form-group">
                            <label for="level">Level*</label>
                            <select id="level" name="level" required>
                                <option value="Beginner">Beginner</option>
                                <option value="Intermediate">Intermediate</option>
                                <option value="Advanced">Advanced</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="commitment">Commitment</label>
                            <input type="text" id="commitment" name="commitment"
                                   placeholder="E.g. 4-6 weeks">
                        </div>
                        <div class="form-group">
                            <label for="imageUpload">Course Thumbnail</label>
                            <div class="file-upload-container">
                                <div class="preview-container" id="imagePreviewContainer">
                                    <img id="imagePreview" src="${img}/course-placeholder.png"
                                         alt="Preview">
                                </div>
                                <input type="file" id="imageUpload" name="imageUpload" accept="image/*">
                                <label for="imageUpload" class="custom-file-upload">
                                    <i class="fas fa-upload"></i> Choose Image
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="description">Description*</label>
                        <textarea id="description" name="description" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="details">Details</label>
                        <textarea id="details" name="details" rows="5"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="learningPathway">Learning Pathway</label>
                        <textarea id="learningPathway" name="learningPathway" rows="4"></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-save">Save Course</button>
                        <button type="button" class="btn-cancel" onclick="closeModal()">Cancel</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- View Course Modal -->
        <div id="viewCourseModal" class="modal">
            <div class="modal-content large-modal">
                <span class="close" onclick="closeViewModal()">&times;</span>
                <div class="course-detail-container">
                    <div class="course-header">
                        <div class="course-thumbnail-large">
                            <img id="viewCourseImage" src="" alt="Course Thumbnail">
                        </div>
                        <div class="course-header-info">
                            <h2 id="viewCourseName"></h2>
                            <div class="course-meta">
                                <span id="viewCourseLevel" class="level-badge"></span>
                                <span id="viewCourseCommitment"><i class="far fa-clock"></i> <span
                                        id="viewCourseTimes"></span></span>
                            </div>
                        </div>
                    </div>

                    <div class="course-section">
                        <h3>Description</h3>
                        <p id="viewCourseDescription"></p>
                    </div>

                    <div class="course-section">
                        <h3>Details</h3>
                        <div id="viewCourseDetails"></div>
                    </div>

                    <div class="course-section">
                        <h3>Commitment</h3>
                        <div id="viewCourseCommit"></div>
                    </div>

                    <div class="course-section">
                        <h3>Course Information</h3>
                        <div class="info-grid">
                            <div class="info-item">
                                <span class="info-label">Course ID</span>
                                <span id="viewCourseId" class="info-value"></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Created Date</span>
                                <span id="viewCourseCreated" class="info-value"></span>
                            </div>
                            <div class="info-item">
                                <span class="info-label">Last Updated</span>
                                <span id="viewCourseUpdated" class="info-value"></span>
                            </div>
                        </div>
                    </div>

                    <div class="view-course-actions">
                        <button onclick="closeViewModal()" class="btn-cancel">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <h2>Confirm Delete</h2>
                <p>Are you sure you want to delete this course? This action cannot be undone.</p>
                <div class="modal-actions">
                    <button onclick="deleteCourse()" class="btn-delete">Delete</button>
                    <button onclick="closeDeleteModal()" class="btn-cancel">Cancel</button>
                </div>
            </div>
        </div>

        <script src="${js}/admin/sidebar.js"></script>
        <script src="${js}/admin/courses.js"></script>
    </body>

</html>