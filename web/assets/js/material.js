/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function showLoginAlert() {
    alert('Vui lòng đăng nhập để xem chi tiết tài liệu!');
}

function searchMaterials() {
    const searchInput = document.getElementById('searchInput');
    const searchTerm = searchInput.value.toLowerCase();
    const cards = document.querySelectorAll('.card');
    
    cards.forEach(card => {
        const title = card.querySelector('.card-title').textContent.toLowerCase();
        const shortDesc = card.querySelector('.card-text').textContent.toLowerCase();
        const longDesc = card.querySelector('.long-description').textContent.toLowerCase();
        
        if (title.includes(searchTerm) || shortDesc.includes(searchTerm) || longDesc.includes(searchTerm)) {
            card.closest('.col-md-4').style.display = '';
        } else {
            card.closest('.col-md-4').style.display = 'none';
        }
    });
}

function handleGoogleDriveDownload(pathLink) {
    if (pathLink) {
        window.open(pathLink, '_blank');
    } else {
        alert('Không tìm thấy link tải xuống!');
    }
}

function formatPrice(price) {
    if (price === 0) return 'Miễn phí';
    return new Intl.NumberFormat('vi-VN', { 
        style: 'currency', 
        currency: 'VND' 
    }).format(price);
}

function formatStudyTime(minutes) {
    return `${minutes} phút`;
}

function focusSearch() {
    document.getElementById('searchInput').focus();
}



