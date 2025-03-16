<%-- Document : navbar Created on : Mar 14, 2025, 10:05:04 PM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<nav class="navbar navbar-light d-md-none">
    <button style="    border: none;
            background-color: transparent;
            font-size: 4rem;
            /* line-height: 100%; */
            color: #bbb;
            line-height: 2.8rem;" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar">
        ☰
    </button>
</nav>

<div class="sidebar offcanvas offcanvas-start d-md-none" tabindex="-1" id="offcanvasSidebar"
     style="width: 14rem;">
    <a class="sidebar__logo">
        <img src="${img}/navbar_icon/Logo.svg" alt="G-easy Learning" class="sidebar__logo-image" />
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </a>
    <nav class="sidebar__nav">
        <a href="${url}/view/home" class="sidebar__item sidebar__item--active">
            <img class="sidebar__icon" src="${img}/navbar_icon/Icon.svg" alt="Home" />
            <span class="sidebar__link sidebar__text">Home</span>
        </a>
        <a href="${url}/view/material" class="sidebar__item">
            <img class="sidebar__icon" src="${img}/navbar_icon/Book.svg" alt="Document" />
            <span class="sidebar__link sidebar__text">Material</span>
        </a>
        <a href="${url}/view/course" class="sidebar__item">
            <img class="sidebar__icon" src="${img}/navbar_icon/Leaf.svg" alt="Course-Online" />
            <span class="sidebar__link sidebar__text">Course</span>
        </a>
        <a href="${url}/view/test" class="sidebar__item">
            <img class="sidebar__icon" src="${img}/navbar_icon/News.svg" alt="Testing" />
            <span class="sidebar__link sidebar__text">Test</span>
        </a>
        <c:if test="${not empty sessionScope.user}">
            <a href="${url}/view/account" class="sidebar__item">
                <img class="sidebar__icon" src="${img}/navbar_icon/User.svg" alt="User-Information" />
                <span class="sidebar__link sidebar__text">Account</span>
            </a>
        </c:if>

    </nav>
</div>

<div class="sidebar d-none d-md-block">
    <a href="${url}" class="sidebar__logo">
        <img src="${img}/navbar_icon/Logo.svg" alt="G-easy Learning" id="sidebar__logo-image" class="sidebar__logo-image" />
    </a>
    <nav class="sidebar__nav">
        <a href="${url}/view/home" class="sidebar__item sidebar__item--active">
            <img class="sidebar__icon" src="${img}/navbar_icon/Icon.svg" alt="Home" />
            <span class="sidebar__link sidebar__text">Home</span>
        </a>
        <a href="${url}/view/material" class="sidebar__item">
            <img class="sidebar__icon" src="${img}/navbar_icon/Book.svg" alt="Document" />
            <span class="sidebar__link sidebar__text">Material</span>
        </a>
        <a href="${url}/view/course" class="sidebar__item">
            <img class="sidebar__icon" src="${img}/navbar_icon/Leaf.svg" alt="Course-Online" />
            <span class="sidebar__link sidebar__text">Course</span>
        </a>
        <a href="${url}/view/test" class="sidebar__item">
            <img class="sidebar__icon" src="${img}/navbar_icon/News.svg" alt="Testing" />
            <span class="sidebar__link sidebar__text">Test</span>
        </a>
        <c:if test="${not empty sessionScope.user}">
            <a href="${url}/view/account" class="sidebar__item">
                <img class="sidebar__icon" src="${img}/navbar_icon/User.svg" alt="User-Information" />
                <span class="sidebar__link sidebar__text">Account</span>
            </a>
        </c:if>

    </nav>
</div>