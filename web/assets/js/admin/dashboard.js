/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// User Growth Chart
const userGrowthCtx = document.getElementById('userGrowthChart').getContext('2d');
new Chart(userGrowthCtx, {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
                label: 'New Users',
                data: [65, 78, 90, 85, 99, 105],
                borderColor: '#FB9400',
                tension: 0.4
            }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    }
});

// Course Engagement Chart
const courseEngagementCtx = document.getElementById('courseEngagementChart').getContext('2d');
new Chart(courseEngagementCtx, {
    type: 'bar',
    data: {
        labels: ['Course A', 'Course B', 'Course C', 'Course D', 'Course E'],
        datasets: [{
                label: 'Active Students',
                data: [45, 39, 55, 75, 35],
                backgroundColor: '#4CAF50'
            }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    }
});