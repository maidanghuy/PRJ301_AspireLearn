/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener("DOMContentLoaded", function () {
    const filterButtons = document.querySelectorAll(".filter-btn");
    const testItems = document.querySelectorAll(".test-item");

    filterButtons.forEach((button) => {
        button.addEventListener("click", () => {
            // Xóa active class từ tất cả các nút
            filterButtons.forEach((btn) => btn.classList.remove("active"));
            // Thêm active class vào nút được click
            button.classList.add("active");

            const filterType = button.getAttribute("data-type");

            // Lọc các đề thi
            testItems.forEach((item) => {
                if (filterType === "all") {
                    item.style.display = "block";
                } else {
                    const itemType = item.getAttribute("data-type");
                    item.style.display = itemType === filterType ? "block" : "none";
                }
            });
        });
    });

    // Hiệu ứng animation khi hiển thị các đề thi
    testItems.forEach((item) => {
        item.style.opacity = "0";
        item.style.transform = "translateY(20px)";
    });

    // Hiển thị các đề thi với animation
    setTimeout(() => {
        testItems.forEach((item, index) => {
            setTimeout(() => {
                item.style.transition = "all 0.5s ease";
                item.style.opacity = "1";
                item.style.transform = "translateY(0)";
            }, index * 100);
        });
    }, 200);
});
