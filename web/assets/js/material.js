/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function showLoginAlert() {
    Swal.fire({
        title: 'Yêu cầu đăng nhập',
        text: 'Vui lòng đăng nhập để sử dụng tính năng này!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Đăng nhập',
        cancelButtonText: 'Đóng',
        confirmButtonColor: '#3498db',
        cancelButtonColor: '#95a5a6'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = '${pageContext.request.contextPath}/login?returnUrl=${pageContext.request.contextPath}/material';
        }
    });
}

function searchMaterials() {
    const searchInput = document.getElementById('searchInput');
    const searchText = searchInput.value.toLowerCase().trim();
    const cards = document.querySelectorAll('.card');
    const searchResponse = document.getElementById('searchResponse');
    let foundCount = 0;

    cards.forEach(card => {
        const title = card.querySelector('.card-title').textContent.toLowerCase();
        const description = card.querySelector('.card-text').textContent.toLowerCase();

        if (title.includes(searchText) || description.includes(searchText)) {
            card.closest('.col-md-4').style.display = '';
            foundCount++;
        } else {
            card.closest('.col-md-4').style.display = 'none';
        }
    });

    // Hiển thị response
    if (searchText === '') {
        searchResponse.style.display = 'none';
m    } else {
        searchResponse.style.display = 'block';
        if (foundCount > 0) {
            searchResponse.innerHTML = `<i class="fas fa-check-circle me-2"></i>Tìm thấy ${foundCount} tài liệu phù hợp`;
            searchResponse.className = 'search-response found';
        } else {
            searchResponse.innerHTML = `<i class="fas fa-exclamation-circle me-2"></i>Không tìm thấy tài liệu phù hợp`;
            searchResponse.className = 'search-response not-found';
        }
    }
}

function focusSearch() {
    document.getElementById('searchInput').focus();
}


