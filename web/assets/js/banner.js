/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll(".banner__slides");
    const prevBtn = document.querySelector(".banner__control--prev");
    const nextBtn = document.querySelector(".banner__control--next");
    let currentIndex = 0;
    let autoSlide;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove("active");
        });
        slides[index].classList.add("active");
    }

    function nextSlide() {
        currentIndex = (currentIndex + 1) % slides.length;
        showSlide(currentIndex);
    }

    function prevSlide() {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
        showSlide(currentIndex);
    }

    function startAutoSlide() {
        autoSlide = setInterval(nextSlide, 3000);
    }

    function resetAutoSlide() {
        clearInterval(autoSlide);
        startAutoSlide(); // Bắt đầu lại sau khi click
    }

    prevBtn.addEventListener("click", function () {
        prevSlide();
        resetAutoSlide();
    });

    nextBtn.addEventListener("click", function () {
        nextSlide();
        resetAutoSlide();
    });

    showSlide(currentIndex);
    startAutoSlide();
});