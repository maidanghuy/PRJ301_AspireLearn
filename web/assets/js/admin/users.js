// Modal handling
function openAddUserModal() {
    document.getElementById('modalTitle').textContent = 'Add New User';
    document.getElementById('userForm').reset();
    document.getElementById('infomation').textContent = '';
    document.getElementById('userId').value = '';
    document.getElementById('userModal').style.display = 'block';
}

function editUser(button) {
    // Tìm phần tử <tr> gần nhất chứa nút Edit
    const row = button.closest('tr');

    // Lấy tất cả <td> trong hàng đó
    const cells = row.getElementsByTagName('td');

    // Gán dữ liệu vào form modal
    document.getElementById('modalTitle').textContent = 'Edit User';
    document.getElementById('infomation').textContent = 'Leave blank to keep current password when editing';
    document.getElementById('userId').value = cells[0].textContent.trim();  // userID
    document.getElementById('username').value = cells[2].textContent.trim();  // username
    document.getElementById('email').value = cells[3].textContent.trim();  // email
    document.getElementById('role').value = cells[4].textContent.trim();  // role
    document.getElementById('status').value = cells[5].textContent.trim();  // status

    // Hiển thị modal chỉnh sửa user
    document.getElementById('userModal').style.display = 'block';
}


function closeModal() {
    document.getElementById('userModal').style.display = 'none';
}

// Delete handling
let userToDelete = null;

function confirmDelete(userId) {
    userToDelete = userId;
    document.getElementById('deleteModal').style.display = 'block';

    // Gán dữ liệu vào form modal
    document.getElementById('userIdForDelete').value = userId;
}

function closeDeleteModal() {
    document.getElementById('deleteModal').style.display = 'none';
}

// Search and Filter
document.getElementById('searchUser').addEventListener('input', function (e) {
    // Implement search functionality
});

document.getElementById('roleFilter').addEventListener('change', function (e) {
    // Implement role filter
});

document.getElementById('statusFilter').addEventListener('change', function (e) {
    // Implement status filter
});

// Close modal when clicking outside
window.onclick = function (event) {
    if (event.target === document.getElementById('userModal')) {
        closeModal();
    }
    if (event.target === document.getElementById('deleteModal')) {
        closeDeleteModal();
    }
};

// Pagination handling
function gotoPage(page) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('page', page);
    window.location.href = currentUrl.toString();
}

function changePageSize(size) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('pageSize', size);
    currentUrl.searchParams.set('page', 1); // Reset về trang 1 khi đổi page size
    window.location.href = currentUrl.toString();
}

function updateFilter(param, value) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set(param, value);
    window.location.href = currentUrl.toString();
}

// Thêm vào phần search và filter
document.getElementById('searchUser').addEventListener('input', debounce(function (e) {
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('search', e.target.value);
    currentUrl.searchParams.set('page', 1); // Reset về trang 1 khi search
    window.location.href = currentUrl.toString();
}, 1000)); //1s sau khi dung

// Debounce function để tránh gọi quá nhiều request khi search
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

// Mở modal chi tiết user
function viewUser(button) {
    document.getElementById('viewUserModal').style.display = 'block';
    
    // Tìm phần tử <tr> gần nhất chứa nút Edit
    const row = button.closest('tr');

    // Lấy tất cả <td> trong hàng đó
    const cells = row.getElementsByTagName('td');
    
    //add class
    document.getElementById('viewUserRole').classList.remove("teacher", "student", "admin");
    document.getElementById('viewUserRole').classList.add("badge", cells[4].textContent.trim().toLowerCase());
    document.getElementById('viewUserStatus').classList.remove("active", "inactive", "banned");
    document.getElementById('viewUserStatus').classList.add("badge", cells[5].textContent.trim().toLowerCase());


    // Gán dữ liệu vào form modal
    document.getElementById('viewUserName').textContent = cells[2].textContent.trim();  // username
    document.getElementById('viewUserRole').textContent = cells[4].textContent.trim();  // role
    document.getElementById('viewUserStatus').textContent = cells[5].textContent.trim();  // userStatus
    document.getElementById('viewUserId').textContent = cells[0].textContent.trim();  // userID
    document.getElementById('viewUserEmail').textContent = cells[3].textContent.trim();  // email
    document.getElementById('viewUserCreated').textContent = cells[6].textContent.trim();  // createAt
}
// Đóng modal chi tiết user
function closeViewModal() {
    document.getElementById('viewUserModal').style.display = 'none';
}