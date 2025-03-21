<%-- 
    Document   : error
    Created on : Mar 21, 2025, 11:06:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="./includes/path-config.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404 - Page Not Found</title>
        <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Fredoka', sans-serif;
            }

            body {
                background: #FB9400;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
                position: relative;
                overflow: hidden;
            }

            /* Floating elements animation */
            body::before,
            body::after {
                content: '';
                position: absolute;
                width: 300px;
                height: 300px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.1);
                z-index: 0;
            }

            body::before {
                top: -100px;
                right: -100px;
                animation: float-slow 8s infinite alternate;
            }

            body::after {
                bottom: -100px;
                left: -100px;
                animation: float-slow 6s infinite alternate-reverse;
            }

            .error-container {
                background: white;
                padding: 40px;
                border-radius: 30px;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
                text-align: center;
                max-width: 600px;
                width: 100%;
                animation: fadeIn 1s ease;
                position: relative;
                z-index: 1;
            }

            .error-code {
                font-size: 140px;
                font-weight: 700;
                background: linear-gradient(45deg, #FB9400, #FF6B6B);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                line-height: 1;
                margin-bottom: 20px;
                animation: bounce 2s infinite;
                text-shadow: none;
            }

            .error-message {
                font-size: 32px;
                color: #333;
                margin-bottom: 20px;
                font-weight: 600;
            }

            .error-description {
                color: #666;
                margin-bottom: 30px;
                line-height: 1.6;
                font-size: 18px;
            }

            .back-button {
                display: inline-block;
                padding: 15px 40px;
                background: #FB9400;
                color: white;
                text-decoration: none;
                border-radius: 30px;
                font-weight: 600;
                font-size: 18px;
                transition: all 0.3s ease;
                border: none;
                cursor: pointer;
                box-shadow: 0 10px 20px rgba(251, 148, 0, 0.3);
            }

            .back-button:hover {
                transform: translateY(-3px) scale(1.05);
                box-shadow: 0 15px 30px rgba(251, 148, 0, 0.4);
                background: #ff9f1a;
            }

            .illustration {
                width: 250px;
                height: 250px;
                margin: 0 auto 30px;
                position: relative;
            }

            .illustration::before {
                content: '📚';
                font-size: 120px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                animation: float 3s ease-in-out infinite;
            }

            .illustration::after {
                content: '❓';
                font-size: 60px;
                position: absolute;
                top: 20%;
                right: 20%;
                animation: bounce 2s infinite alternate;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes bounce {
                0%, 100% {
                    transform: translateY(0);
                }
                50% {
                    transform: translateY(-15px);
                }
            }

            @keyframes float {
                0%, 100% {
                    transform: translate(-50%, -50%);
                }
                50% {
                    transform: translate(-50%, -60%);
                }
            }

            @keyframes float-slow {
                0% {
                    transform: translate(0, 0);
                }
                100% {
                    transform: translate(20px, 20px);
                }
            }

            /* Decorative elements */
            .decorative-dots {
                position: absolute;
                width: 100%;
                height: 100%;
                pointer-events: none;
            }

            .dot {
                position: absolute;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
            }

            @media (max-width: 480px) {
                .error-container {
                    padding: 30px;
                    border-radius: 20px;
                }
                .error-code {
                    font-size: 100px;
                }
                .error-message {
                    font-size: 24px;
                }
                .illustration::before {
                    font-size: 80px;
                }
                .illustration::after {
                    font-size: 40px;
                }
                .back-button {
                    padding: 12px 30px;
                    font-size: 16px;
                }
            }
        </style>
    </head>
    <body>
        <div class="decorative-dots"></div>
        <div class="error-container">
            <div class="illustration"></div>
            <div class="error-code">404</div>
            <div class="error-message">Oops! Lesson Not Found</div>
            <p class="error-description">
                Don't worry! Sometimes the best lessons are found when we're lost. 
                Let's get you back to your learning journey!
            </p>
            <a href="${url}/DivideActionServlet" class="back-button">Back to Learning</a>
        </div>

        <script>
            // Add decorative dots
            const dotsContainer = document.querySelector('.decorative-dots');
            for (let i = 0; i < 20; i++) {
                const dot = document.createElement('div');
                dot.className = 'dot';
                dot.style.width = Math.random() * 10 + 'px';
                dot.style.height = dot.style.width;
                dot.style.left = Math.random() * 100 + '%';
                dot.style.top = Math.random() * 100 + '%';
                dot.style.animation = `float-slow ${Math.random() * 4 + 3}s infinite alternate`;
                dotsContainer.appendChild(dot);
            }
        </script>
    </body>
</html>
