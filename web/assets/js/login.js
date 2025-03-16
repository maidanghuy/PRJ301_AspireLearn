/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const togglePassword = document.getElementById('toggle-password');
const passwordIcon = togglePassword.querySelector('i');
const passwordField = document.getElementById('password');
const confirmPasswordField = document.getElementById('confirmPassword');

//console.log(confirmPasswordField + " " + passwordField);
function toggleVisibility(field, icon) {
  if (!field || !field.value) return; // Kiểm tra nếu ô nhập trống hoặc không tồn tại thì không làm gì cả

  const type = field.getAttribute('type') === 'password' ? 'text' : 'password';
  field.setAttribute('type', type);
  icon.classList.toggle('fa-eye-slash');
  icon.classList.toggle('fa-eye');
}

togglePassword.addEventListener('click', function () {
  toggleVisibility(passwordField, passwordIcon);
  if (confirmPasswordField) {
      const type = confirmPasswordField.getAttribute('type') === 'password' ? 'text' : 'password';
      confirmPasswordField.setAttribute('type', type);
}
});


