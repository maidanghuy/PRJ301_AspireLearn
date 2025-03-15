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
                                                Nâng cao kỹ năng lập trình với G-Easy Learning.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner2.jpg"
                                             alt="Banner 2">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Learn Anywhere!</h1>
                                            <p class="banner__description">
                                                Học tập mọi lúc, mọi nơi với các khóa học chất lượng.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner3.jpg"
                                             alt="Banner 3">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Master Your Skills!</h1>
                                            <p class="banner__description">
                                                Trở thành chuyên gia với lộ trình học phù hợp cho bạn.
                                            </p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner4.jpg"
                                             alt="Banner 4">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Join Our Community!</h1>
                                            <p class="banner__description">Tham gia cộng đồng học tập và
                                                chia sẻ kiến thức.</p>
                                        </div>
                                    </div>
                                    <div class="banner__slides">
                                        <img class="banner__image" src="${img}/banner/banner5.jpg"
                                             alt="Banner 5">
                                        <div class="banner__content">
                                            <h1 class="banner__title title">Your Future Starts Here!</h1>
                                            <p class="banner__description">Bắt đầu hành trình học tập và
                                                phát triển ngay hôm nay.</p>
                                        </div>
                                    </div>
                                    <span class="banner__control banner__control--prev">&#10094;</span>
                                    <span class="banner__control banner__control--next">&#10095;</span>
                                </div>
                            </div>
                            <div class="mgb-5">
                                <div class="wrapper__about">
                                    <div class="about__text">
                                        <h2 class="about__title title">Về G-Easy Learning</h2>
                                        <p class="about__description">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                            Quibusdam, tenetur
                                            optio iste rem ad voluptatem ullam quis odio inventore sequi
                                            illo, commodi atque
                                            in voluptatibus aliquid fugiat possimus repellendus. Placeat,
                                            hic totam ad
                                            voluptatum saepe quidem voluptatem beatae, fugit, sunt explicabo
                                            ullam.
                                            Blanditiis necessitatibus placeat odio facere itaque voluptatem
                                            numquam?
                                        </p>
                                        <a class="btn btn-detail" href="#">
                                            <span class="text text-white">Xem chi tiết</span>
                                        </a>
                                    </div>
                                    <div class="about__img">
                                        <img class="crile-2" src="${img}/banner/banner.png" alt="About">
                                    </div>
                                </div>
                            </div>
                            <div class="mgb-5">
                                <div class="wrapper__services">
                                    <div class="services__text">
                                        <h2 class="title services__title">G-Easy English</h2>
                                        <p class="services__description">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem
                                            enim ratione
                                            obcaecati, dolorum repudiandae praesentium a quis ab similique,
                                            exercitationem
                                            velit incidunt. Atque, error mollitia saepe amet ipsa in
                                            delectus.
                                        </p>
                                    </div>
                                    <div class="services__feature">
                                        <div class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/Leaf.svg" alt="">
                                            </div>
                                            <div class="feature__text">Tài liệu <br /> miễn phí</div>
                                        </div>
                                        <div class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/Book.svg" alt="">
                                            </div>
                                            <div class="feature__text">Tài liệu <br /> Trả phí</div>
                                        </div>
                                        <div class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/Video.svg" alt="">
                                            </div>
                                            <div class="feature__text">Khóa học <br /> Online</div>
                                        </div>
                                        <div class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/navbar_icon/User.svg" alt="">
                                            </div>
                                            <div class="feature__text">Quản lý <br /> tài khoản</div>
                                        </div>
                                        <div class="feature feature--item">
                                            <div class="feature__icon">
                                                <img src="${img}/icon/Chat.svg" alt="">
                                            </div>
                                            <div class="feature__text">Tư vấn <br /> miễn phí</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mgb-5">
                                <div class="wrapper__about">
                                    <div class="about__text">
                                        <h2 class="about__title title">Làm bài kiểm tra thử</h2>
                                        <p class="about__description">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                            Quibusdam, tenetur
                                            optio iste rem ad voluptatem ullam quis odio inventore sequi
                                            illo, commodi atque
                                            in voluptatibus aliquid fugiat possimus repellendus. Placeat,
                                            hic totam ad
                                            voluptatum saepe quidem voluptatem beatae, fugit, sunt explicabo
                                            ullam.
                                            Blanditiis necessitatibus placeat odio facere itaque voluptatem
                                            numquam?
                                        </p>
                                        <a class="btn btn-detail" href="#">
                                            <span class="text text-white">Làm bài ngay</span>
                                        </a>
                                    </div>
                                    <div class="about__img">
                                        <img class="crile-2" src="${img}/banner/banner.png" alt="About">
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
        <script>
                    const imgPath = "${img}";
        </script>
        <%@ include file="./includes/scripts.jsp" %>
        <script src="${js}/banner.js"></script>
    </body>

</html>