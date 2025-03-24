// Global variable để lưu course ID đang xem/xóa
let currentViewingCourseId = null;
let courseToDelete = null;

// Mở modal chi tiết course
function viewCourse(button) {
    document.getElementById('viewCourseModal').style.display = 'block';

    // Tìm phần tử <tr> gần nhất chứa nút xem chi tiết
    const row = button.closest('tr');

    // Lấy tất cả <td> trong hàng đó    
    const cells = row.getElementsByTagName('td');

    // Gán dữ liệu vào modal
    document.getElementById('viewCourseId').textContent = cells[0].textContent.trim();  // courseID
    document.getElementById('viewCourseImage').src = cells[1].querySelector("img").src;
    document.getElementById('viewCourseName').textContent = cells[2].textContent.trim();  // courseName
    document.getElementById('viewCourseLevel').textContent = cells[3].textContent.trim();  // level
    // Lấy level từ bảng
    let level = cells[3].textContent.trim();
    document.getElementById('viewCourseLevel').textContent = level;

    // Xét thời gian dựa trên level
    let time;
    switch (level) {
        case "Beginner":
            time = "10 hours";
            break;
        case "Intermediate":
            time = "20 hours";
            break;
        case "Advanced":
            time = "30 hours";
            break;
        default:
            time = "Unknown";
    }

    // Gán giá trị thời gian vào thẻ HTML
    document.getElementById('viewCourseTimes').textContent = time;

    document.getElementById('viewCourseCreated').textContent = cells[5].textContent.trim();  // createdAt
    document.getElementById('viewCourseUpdated').textContent = cells[6].textContent.trim();  // updatedAt
    document.getElementById('viewCourseDescription').textContent = cells[7].textContent.trim();  // description
    document.getElementById('viewCourseDetails').textContent = cells[8].textContent.trim();  // details
    document.getElementById('viewCourseCommit').textContent = cells[9].textContent.trim();  // commitment
}


// Đóng các modal
function closeModal() {
    document.getElementById('courseModal').style.display = 'none';
}

function closeViewModal() {
    document.getElementById('viewCourseModal').style.display = 'none';
    currentViewingCourseId = null;
}

function closeDeleteModal() {
    document.getElementById('deleteModal').style.display = 'none';
    courseToDelete = null;
}

// Phân trang
function gotoPage(page) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('page', page);
    window.location.href = currentUrl.toString();
}

function changePageSize(size) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('pageSize', size);
    currentUrl.searchParams.set('page', 1);
    window.location.href = currentUrl.toString();
}

// Xử lý tìm kiếm
document.getElementById('searchCourse').addEventListener('input', debounce(function (e) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('search', e.target.value);
    currentUrl.searchParams.set('page', 1);
    window.location.href = currentUrl.toString();
}, 1000)); //1s sau khi dung

// Filter by level
document.getElementById('levelFilter').addEventListener('change', function (e) {
    const currentUrl = new URL(window.location.href);
    if (e.target.value) {
        currentUrl.searchParams.set('levelFilter', e.target.value);
    } else {
        currentUrl.searchParams.delete('levelFilter');
    }
    currentUrl.searchParams.set('page', 1);
    window.location.href = currentUrl.toString();
});

// Preview hình ảnh khi chọn file
document.getElementById('imageUpload').addEventListener('change', function () {
    const file = this.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('imagePreview').src = e.target.result;
        }
        reader.readAsDataURL(file);
    }
});

// Helper functions
function formatDate(dateString) {
    if (!dateString)
        return 'Not available';
    const options = {year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit'};
    return new Date(dateString).toLocaleDateString('en-US', options);
}

function formatTextWithLineBreaks(text) {
    if (!text)
        return '<p>Not available</p>';
    return text.split('\n').map(para => `<p>${para}</p>`).join('');
}

function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Đóng modal khi click bên ngoài
window.onclick = function (event) {
    const courseModal = document.getElementById('courseModal');
    const viewModal = document.getElementById('viewCourseModal');
    const deleteModal = document.getElementById('deleteModal');

    if (event.target == courseModal) {
        closeModal();
    }
    if (event.target == viewModal) {
        closeViewModal();
    }
    if (event.target == deleteModal) {
        closeDeleteModal();
    }
} 