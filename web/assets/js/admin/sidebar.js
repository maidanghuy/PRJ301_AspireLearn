/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function updateNavText() {
    const links = document.querySelectorAll(".nav-item");

    if (window.innerWidth <= 768) {
        links.forEach(link => {
            const icon = link.querySelector("i");
            if (icon) {
                link.innerHTML = "";
                link.appendChild(icon); // Chỉ giữ lại icon
            }
        });
    } else {
        links.forEach(link => {
            const icon = link.querySelector("i");
            const text = link.getAttribute("data-text");
            if (icon && text) {
                link.innerHTML = ""; // Xóa nội dung cũ
                link.appendChild(icon); // Giữ lại icon
                link.innerHTML += ` ${text}`; // Thêm lại chữ
            }
        });
    }
}

// Lưu text gốc của các link
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".nav-item").forEach(link => {
        link.setAttribute("data-text", link.textContent.trim());
    });

    updateNavText(); // Gọi khi trang load
    window.addEventListener("resize", updateNavText); // Lắng nghe thay đổi kích thước màn hình
});
