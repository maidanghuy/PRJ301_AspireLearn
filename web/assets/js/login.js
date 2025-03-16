/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// JS for hidden append password buttons
const togglePassword = document.getElementById('toggle-password');
const passwordField = document.getElementById('password');
const passwordIcon = togglePassword.querySelector('i');

togglePassword.addEventListener('click', function () {
  // Toggle the type attribute
  const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
  passwordField.setAttribute('type', type);

  // Toggle the eye icon based on the password visibility
  passwordIcon.classList.toggle('fa-eye-slash');
  passwordIcon.classList.toggle('fa-eye');
});

passwordField.addEventListener("focus", () => {
  document.querySelector("#toggle-password i").style.color = "black"; // Màu khi focus
});

passwordField.addEventListener("blur", () => {
  document.querySelector("#toggle-password i").style.color = "#9E988F"; // Màu khi mất focus
});
