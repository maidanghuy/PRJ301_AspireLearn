<%-- 
    Document   : sidebar
    Created on : Mar 18, 2025, 11:18:37 PM
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="dashboard-sidebar">
    <a href="${url}/dashboard" style="display: block;" class="sidebar-header">
        <img src="${img}/navbar_icon/Logo_white.svg" alt="G-Easy Admin" class="admin-logo">
        <h3>Admin Panel</h3>
    </a>

    <nav class="sidebar-nav">
        <a href="${url}/dashboard" class="nav-item ${'dashboard'.equals(option) ? 'active':''}">
            <i class="fas fa-home"></i>
            Dashboard
        </a>
        <a href="${url}/dashboard/users" class="nav-item ${'users'.equals(option) ? 'active':''}">
            <i class="fas fa-users"></i>
            Users Management
        </a>
        <a href="${url}/dashboard/courses" class="nav-item ${'courses'.equals(option) ? 'active':''}">
            <i class="fas fa-book"></i>
            Courses
        </a>
        <a href="${url}/dashboard/materials" class="nav-item ${'meterials'.equals(option) ? 'active':''}">
            <i class="fas fa-file-alt"></i>
            Materials
        </a>
        <a href="${url}/dashboard/tests" class="nav-item ${'tests'.equals(option) ? 'active':''}">
            <i class="fas fa-tasks"></i>
            Tests
        </a>
        <a href="${url}/dashboard/settings" class="nav-item ${'settings'.equals(option) ? 'active':''}">
            <i class="fas fa-cog"></i>
            Settings
        </a>
    </nav>
</div>
