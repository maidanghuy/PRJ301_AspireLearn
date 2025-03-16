<%-- Document : home Created on : Mar 13, 2025, 5:30:19 PM Author : macbookpro --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="./includes/path-config.jsp" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@ include file="./includes/head.jsp" %>
        <!-- styles.css: Chứa các quy tắc CSS chính của trang -->
        <link rel="stylesheet" href="${css}/home.css" />
        <link rel="stylesheet" href="${css}/navbar.css" />
        <link rel="stylesheet" href="${css}/header.css" />
        <link rel="stylesheet" href="${css}/footer.css" />
    </head>
    <body>
        <div class="container-custom">
            <div class="container-left">
                <%@ include file="./includes/navbar.jsp" %>
            </div>
            <div class="container-right">
                <div class="main-content">
                    <%@ include file="./includes/header.jsp" %>
                    <div class="home">
                        <div class="container">
                            <div class="mgb-5">
                                <div class="wrapper__banner">
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner1.jpg"
                                             alt="Banner 1">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">G-Easy Learning!</h1>
                                            <p class="banner__description">
                                                Enhance Your Skills with G-Easy Learning! 🚀
                                            </p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner2.jpg"
                                             alt="Banner 2">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Learn Anywhere!</h1>
                                            <p class="banner__description">
                                                Learn Anytime, Anywhere with High-Quality Courses! 🎓🌍
                                            </p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner3.jpg"
                                             alt="Banner 3">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Master Your Skills!</h1>
                                            <p class="banner__description">
                                                Become an Expert with a Learning Path Tailored for You! 🚀🎓
                                            </p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner4.jpg"
                                             alt="Banner 4">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Join Our Community!</h1>
                                            <p class="banner__description">
                                                Join the Learning Community & Share Knowledge! 🌍📚
                                            </p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner5.jpg"
                                             alt="Banner 5">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Your Future Starts Here!</h1>
                                            <p class="banner__description">
                                                Start Your Learning & Growth Journey Today! 🚀📚
                                            </p>
                                        </div>
                                    </div>
                                    <span class="banner__control banner__control--prev">&#10094;</span>
                                    <span class="banner__control banner__control--next">&#10095;</span>
                                </div>
                            </div>
                            <div class="mgb-5">
                                <div class="wrapper__about">
                                    <div class="about__text">
                                        <h2 class="about__title title">About G-Easy Learning</h2>
                                        <p class="about__description">
                                            At G-Easy English Center, we believe that learning English
                                            should be an easy and enjoyable journey for everyone. Our
                                            mission is to provide high-quality English education through
                                            modern teaching methods, experienced instructors, and a dynamic
                                            learning environment. Whether you are a student looking to
                                            improve your academic English, a professional aiming for career
                                            advancement, or someone who simply wants to communicate
                                            fluently, G-Easy has the right program for you.
                                        </p>
                                        <a class="btn btn-detail" href="#">
                                            <span class="text text-white">View Detail</span>
                                        </a>
                                    </div>
                                    <div class="about__img">
                                        <img class="crile-2" src="${img}/about/about-1.jpg" alt="About">
                                    </div>
                                </div>
                            </div>
                            <div class="mgb-5">
                                <div class="wrapper__services">
                                    <div class="services__text">
                                        <h2 class="title services__title">G-Easy Learning</h2>
                                        <p class="services__description">
                                            Our website offers a seamless learning experience with free
                                            practice tests, interactive courses, and a rich library of study
                                            materials. Easily track your progress, manage your account, and
                                            get expert guidance—all in one place. Start learning today! 🚀
                                        </p>
                                    </div>
                                    <div class="services__feature">
                                        <a href="${url}/view/material" class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/Leaf.svg" alt="">
                                            </div>
                                            <div class="feature__text">Material <br /> Free</div>
                                        </a>

                                        <a href="${url}/view/material" class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/Book.svg" alt="">
                                            </div>
                                            <div class="feature__text">Material <br /> Premium</div>
                                        </a>
                                        <a href="${url}/view/course" class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/Video.svg" alt="">
                                            </div>
                                            <div class="feature__text">Course</div>
                                        </a>
                                        <a href="${url}/view/account" class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/User.svg" alt="">
                                            </div>
                                            <div class="feature__text">Manager <br /> Account</div>
                                        </a>
                                        <a href="#" class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/icon/Chat.svg" alt="">
                                            </div>
                                            <div class="feature__text">Consultation</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="mgb-5">
                                <div class="wrapper__about">
                                    <div class="about__text">
                                        <h2 class="about__title title">Take a Practice Test Now!</h2>
                                        <p class="about__description">
                                            Are you ready to test your English skills? Our practice test is
                                            designed to help you assess your current level, identify areas
                                            for improvement, and gain confidence before taking an official
                                            exam. Whether you are preparing for an academic test, a job
                                            interview, or simply want to measure your progress, this is the
                                            perfect opportunity to evaluate yourself.
                                        </p>
                                        <a class="btn btn-detail" href="#">
                                            <span class="text text-white">Test Now</span>
                                        </a>
                                    </div>
                                    <div class="about__img">
                                        <img class="crile-2" src="${img}/about/about-3.jpg" alt="About">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer>
                    <%@ include file="./includes/footer.jsp" %>
                </footer>
            </div>
        </div>
        <%@ include file="./includes/chatbot.jsp" %>      
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
        <%@ include file="./includes/scripts.jsp" %>
        <script src="${js}/banner.js"></script>
    </body>

</html>