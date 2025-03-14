/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function updateLogo() {
    const logoImage = document.querySelector('#sidebar__logo-image');
    if (window.innerWidth <= 992) {
        logoImage.src = imgPath + '/navbar_icon/Logo-min.svg';
        console.log(imgPath + '/navbar_icon/Logo-min.svg');
    } else {
        logoImage.src = imgPath + '/navbar_icon/Logo.svg';
        console.log(imgPath + '/navbar_icon/Logo.svg');

    }
}

window.addEventListener('resize', updateLogo);
window.addEventListener('load', updateLogo);