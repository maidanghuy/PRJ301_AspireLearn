/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Thời gian đếm ngược (ví dụ: 10 phút)

var countdownElement = document.getElementById("countdown");

function updateCountdown() {
    var minutes = Math.floor(countdownTime / 60);
    var seconds = countdownTime % 60;
    countdownElement.textContent = minutes + " min " + seconds + " s";
    if (countdownTime > 0) {
        countdownTime--;
    } else {
        clearInterval(countdownInterval);
        alert("Hết thời gian!");
    }
}

var countdownInterval = setInterval(updateCountdown, 1000);

document.addEventListener("DOMContentLoaded", function () {
    const questionLinks = document.querySelectorAll(".question-link");
    const radioInputs = document.querySelectorAll('input[type="radio"]');

    // Xử lý khi click vào số câu hỏi
    questionLinks.forEach((link) => {
        link.addEventListener("click", function (e) {
            questionLinks.forEach((l) => l.classList.remove("active"));
            this.classList.add("active");
        });
    });

    // Xử lý khi chọn câu trả lời
    radioInputs.forEach((input) => {
        input.addEventListener("change", function () {
            const questionNumber = this.name.replace("question", "");
            const correspondingLink = document.querySelector(
                    `.question-link[href="#question${questionNumber}"]`
                    );
            if (correspondingLink) {
                correspondingLink.classList.add("answered");
                updateAnsweredQuestions();
            }
        });
    });

    // Hàm cập nhật trạng thái cho tất cả các câu đã chọn
    function updateAnsweredQuestions() {
        // Xóa class answered của tất cả các câu
        questionLinks.forEach((link) => {
            link.classList.remove("answered");
        });

        // Thêm class answered cho các câu đã chọn
        radioInputs.forEach((input) => {
            if (input.checked) {
                const questionNumber = input.name.replace("question", "");
                const correspondingLink = document.querySelector(
                        `.question-link[href="#question${questionNumber}"]`
                        );
                if (correspondingLink) {
                    correspondingLink.classList.add("answered");
                }
            }
        });
    }

    // Kiểm tra trạng thái đã chọn của các câu hỏi khi trang load
    updateAnsweredQuestions();

    // Thêm xử lý scroll để cập nhật active state
    window.addEventListener("scroll", function () {
        const questionItems = document.querySelectorAll(".question-item");
        questionItems.forEach((item) => {
            const rect = item.getBoundingClientRect();
            if (rect.top <= 100 && rect.bottom >= 100) {
                const questionNumber = item.id.replace("question", "");
                questionLinks.forEach((link) => {
                    if (link.getAttribute("href") === `#question${questionNumber}`) {
                        link.classList.add("active");
                    } else {
                        link.classList.remove("active");
                    }
                });
            }
        });
    });
});

function showPart(part) {
    // Ẩn tất cả các phần
    document.querySelectorAll(".question-part-container").forEach((partDiv) => {
        partDiv.style.display = "none";
    });
    document.querySelectorAll(".question-item").forEach((question) => {
        question.style.display = "none";
    });

    // Hiển thị phần được chọn
    document.getElementById("part" + part).style.display = "block";
    document.querySelectorAll(".part" + part).forEach((question) => {
        question.style.display = "block";
    });
}

// Mặc định hiển thị phần đầu tiên
document.addEventListener("DOMContentLoaded", function () {
    let firstPartButton = document.querySelector(".part-button");
    if (firstPartButton) {
        firstPartButton.click();
    }
});



let userAnswers = [];

// Lắng nghe sự kiện khi người dùng chọn đáp án
document.querySelectorAll('input[type="radio"]').forEach(input => {
    input.addEventListener('change', function () {
        console.log("Before update:", userAnswers);  // 🔥 Kiểm tra trước khi cập nhật

        const questionName = this.name;
        const questionNum = questionName.replace("question", "");
        const choice = this.value;

        // Xóa câu trả lời cũ của câu hỏi này
        userAnswers = userAnswers.filter(ans => ans.num !== questionNum);

        // Thêm câu trả lời mới
        userAnswers.push({num: questionNum, choice: choice});

        console.log("After update:", userAnswers); // 🔥 Kiểm tra sau khi cập nhật
        console.log("User Answers before sending:", userAnswers);
        if (userAnswers.length === 0) {
            console.error("Error: userAnswers is empty!");
            return;
        }

    });
});


// Gửi dữ liệu lên SubmitServlet
function submitAnswers() {
    console.log("Data being sent:", JSON.stringify(userAnswers));
    fetch(urlPath + "/SubmitServlet", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(userAnswers)
    })
            .then(() => {
                // Chuyển hướng sau khi submit
                window.location.href = urlPath + "/view/viewSubmit";
            })
            .catch(error => console.error("Error submitting answers:", error));
}



