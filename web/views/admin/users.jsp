<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management - G-Easy Learning</title>
        <%@ include file="../includes/head.jsp" %>
        <link rel="stylesheet" href="${css}/admin/dashboard.css">
        <link rel="stylesheet" href="${css}/admin/users.css">
    </head>

    <body>
        <div class="dashboard-container">
            <!-- Include Sidebar -->
            <%@ include file="../includes/sidebar.jsp" %>

            <!-- Main Content -->
            <div class="dashboard-main">
                <div class="dashboard-nav">
                    <div class="nav-left">
                        <h2>Users Management</h2>
                    </div>
                    <!--                                <div class="nav-right">
                                                        <button class="btn btn-primary" onclick="openAddUserModal()">
                                                            <i class="fas fa-plus"></i> Add New User
                                                        </button>
                                                    </div>-->
                </div>

                <!-- Search and Filter Section -->
                <div class="search-filter-container">
                    <div class="search-box">
                        <input type="text" id="searchUser" placeholder="Search users..." value="${search}">
                        <i class="fas fa-search"></i>
                    </div>
                    <div class="filter-box">
                        <select id="roleFilter" onchange="updateFilter('roleFilter', this.value)">
                            <option value="">All Roles</option>
                            <option value="Student" ${roleFilter=='Student' ? 'selected' : '' }>Student
                            </option>
                            <option value="Teacher" ${roleFilter=='Teacher' ? 'selected' : '' }>Teacher
                            </option>
                            <option value="Admin" ${roleFilter=='Admin' ? 'selected' : '' }>Admin</option>
                        </select>
                        <select id="statusFilter" onchange="updateFilter('statusFilter', this.value)">
                            <option value="">All Status</option>
                            <option value="Active" ${statusFilter=='Active' ? 'selected' : '' }>Active
                            </option>
                            <option value="Inactive" ${statusFilter=='Inactive' ? 'selected' : '' }>Inactive
                            </option>
                            <option value="Banned" ${statusFilter=='Banned' ? 'selected' : '' }>Banned
                            </option>
                        </select>
                        <select id="pageSize" onchange="changePageSize(this.value)">
                            <option value="5" ${pageSize==5 ? 'selected' : '' }>5 per page</option>
                            <option value="15" ${pageSize==15 ? 'selected' : '' }>15 per page</option>
                            <option value="25" ${pageSize==25 ? 'selected' : '' }>25 per page</option>
                        </select>
                    </div>
                </div>

                <!-- Users Table -->
                <c:if test="${not empty sessionScope.error}">
                    <div class="alert alert-danger text-center">${sessionScope.error}</div>
                    <c:remove var="error" scope="session" />
                </c:if>

                <c:if test="${not empty sessionScope.message}">
                    <div class="alert alert-success text-center">${sessionScope.message}</div>
                    <c:remove var="message" scope="session" />
                </c:if>
                <div class="table-container">
                    <table class="users-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Avatar</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Created Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.userID}</td>
                                    <td>
                                        <img src="${img}/avatar.png" alt="Avatar" class="user-avatar">
                                    </td>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <span class="badge ${user.role.toLowerCase()}">${user.role}</span>
                                    </td>
                                    <td>
                                        <span
                                            class="status-badge ${user.status.toLowerCase()}">${user.status}</span>
                                    </td>
                                    <td>${user.createdAt}</td>
                                    <td class="actions">
                                        <button onclick="viewUser(this)" class="btn-action view">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <button onclick="editUser(this)" class="btn-action edit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button onclick="confirmDelete(${user.userID})"
                                                class="btn-action delete">
                                            <i class="fas fa-trash"></i>
                                        </button>
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
                                  1*totalUsers)} of ${totalUsers} entries
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

        <!-- Add/Edit User Modal -->
        <div id="userModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2 id="modalTitle">Add New User</h2>
                <form id="userForm" action="${url}/DivideServlet" method="POST">
                    <input type="hidden" id="userId" name="id">
                    <input type="text" id="formName" name="formName" value="editAccount" hidden>
                    <input type="text" id="formType" name="formType" value="adminUpdate" hidden>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password">
                        <small id="infomation" >Leave blank to keep current password when editing</small>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <select id="role" name="role" required>
                            <option value="Student">Student</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Admin">Admin</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select id="status" name="status" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                            <option value="Banned">Banned</option>
                        </select>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-info">Save</button>
                        <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Delete Confirmation Modal -->
        <div id="deleteModal" class="modal">
            <div class="modal-content">
                <form action="${url}/DivideServlet" method="POST">
                    <h2>Confirm Delete</h2>
                    <p>Are you sure you want to ban user?</p>
                    <div class="modal-actions">
                        <input type="text" id="userIdForDelete" name="id" hidden>
                        <input type="text" id="formName" name="formName" value="banAccount" hidden>
                        <button type="submit" onclick="deleteUser()" class="btn btn-danger">Ban</button>
                        <button type="button" onclick="closeDeleteModal()"
                                class="btn btn-secondary">Cancel</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- View User Modal -->
        <div id="viewUserModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeViewModal()">&times;</span>
                <h2>User Details</h2>
                <div class="user-detail-container">
                    <div class="user-profile-header">
                        <div class="user-avatar-large">
                            <img id="viewUserAvatar" src="${img}/avatar.png" alt="User Avatar">
                        </div>
                        <div class="user-header-info">
                            <h3 id="viewUserName"></h3>
                            <div class="badge-container">
                                <span id="viewUserRole" class="badge"></span>
                                <span id="viewUserStatus" class="status-badge"></span>
                            </div>
                        </div>
                    </div>

                    <div class="user-info-sections">
                        <div class="info-section">
                            <h4>Account Information</h4>
                            <div class="info-row">
                                <div class="info-label">User ID:</div>
                                <div id="viewUserId" class="info-value"></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Email:</div>
                                <div id="viewUserEmail" class="info-value"></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Created:</div>
                                <div id="viewUserCreated" class="info-value"></div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Last Login:</div>
                                <div id="viewUserLastLogin" class="info-value">NULL</div>
                            </div>
                        </div>

                        <div class="info-section">
                            <h4>Personal Information</h4>
                            <div class="info-row">
                                <div class="info-label">Full Name:</div>
                                <div id="viewUserFullName" class="info-value">NULL</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Phone:</div>
                                <div id="viewUserPhone" class="info-value">NULL</div>
                            </div>
                        </div>

                        <div class="info-section">
                            <h4>Activity Statistics</h4>
                            <div class="info-row">
                                <div class="info-label">Courses Enrolled:</div>
                                <div id="viewUserCourses" class="info-value">NULL</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Tests Taken:</div>
                                <div id="viewUserTests" class="info-value">NULL</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Average Score:</div>
                                <div id="viewUserScore" class="info-value">NULL</div>
                            </div>
                        </div>
                    </div>

                    <div class="view-user-actions">
                        <button onclick="closeViewModal()" class="btn-cancel">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="${js}/admin/sidebar.js"></script>
        <script src="${js}/admin/users.js"></script>
    </body>

</html>