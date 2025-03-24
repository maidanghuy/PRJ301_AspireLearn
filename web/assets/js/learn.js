// document.addEventListener("DOMContentLoaded", function () {
//     const lessons = document.querySelectorAll(".lesson"); // Lấy danh sách bài học
//     const contents = document.querySelectorAll(".lesson-content"); // Lấy nội dung bài học

//     lessons.forEach((lesson) => {
//         lesson.addEventListener("click", function () {
//             const lessonId = lesson.getAttribute("data-id"); // Lấy ID bài học

//             // 1️⃣ Ẩn tất cả nội dung bài học
//             contents.forEach(content => content.classList.remove("lesson-content--active"));

//             // 2️⃣ Hiển thị bài học được chọn
//             const activeContent = document.querySelector(`.lesson-content[data-id='${lessonId}']`);
//             if (activeContent) {
//                 activeContent.classList.add("lesson-content--active");
//             }

//             // 3️⃣ Cập nhật icon play/pause
//             lessons.forEach(l => l.querySelector(".lesson__icon i").classList.replace("fa-pause-circle", "fa-play-circle"));
//             lesson.querySelector(".lesson__icon i").classList.replace("fa-play-circle", "fa-pause-circle");

//             // 4️⃣ Cập nhật tiến trình học
//             lessons.forEach(l => l.querySelector(".lesson__progress").textContent = "0%");
//             lesson.querySelector(".lesson__progress").textContent = "100%";
//         });
//     });
// });

// document.addEventListener("DOMContentLoaded", function () {
//     const lessons = document.querySelectorAll(".lesson"); // Lấy danh sách bài học
//     const contents = document.querySelectorAll(".lesson-content"); // Lấy nội dung bài học

//     // 🟢 Bước 1: Khôi phục tiến trình từ Local Storage (nếu có)
//     const savedProgress = JSON.parse(localStorage.getItem("lessonProgress")) || {};

//     lessons.forEach(lesson => {
//         const lessonId = lesson.getAttribute("data-id");

//         // Kiểm tra nếu bài học đã có tiến trình lưu trữ thì cập nhật
//         if (savedProgress[lessonId]) {
//             lesson.querySelector(".lesson__progress").textContent = savedProgress[lessonId] + "%";
//         } else {
//             lesson.querySelector(".lesson__progress").textContent = "0%"; // Mặc định 0% nếu chưa học
//         }
//     });

//     lessons.forEach((lesson) => {
//         lesson.addEventListener("click", function () {
//             const lessonId = lesson.getAttribute("data-id"); // Lấy ID bài học

//             // 1️⃣ Ẩn tất cả nội dung bài học
//             contents.forEach(content => content.classList.remove("lesson-content--active"));

//             // 2️⃣ Hiển thị bài học được chọn
//             const activeContent = document.querySelector(`.lesson-content[data-id='${lessonId}']`);
//             if (activeContent) {
//                 activeContent.classList.add("lesson-content--active");
//             }

//             // 3️⃣ Cập nhật icon play/pause
//             lessons.forEach(l => l.querySelector(".lesson__icon i").classList.replace("fa-pause-circle", "fa-play-circle"));
//             lesson.querySelector(".lesson__icon i").classList.replace("fa-play-circle", "fa-pause-circle");

//             // 4️⃣ Cập nhật tiến trình học
//             lessons.forEach(l => l.querySelector(".lesson__progress").textContent = "0%");
//             lesson.querySelector(".lesson__progress").textContent = "100%";

//             // 🟢 Bước 2: Lưu tiến trình vào Local Storage
//             savedProgress[lessonId] = 100; // Lưu tiến trình 100% cho bài đã học
//             localStorage.setItem("lessonProgress", JSON.stringify(savedProgress));
//         });
//     });
// });

document.addEventListener("DOMContentLoaded", function () {
    const lessons = document.querySelectorAll(".lesson"); 
    const contents = document.querySelectorAll(".lesson-content"); 

    // 🟢 Bước 1: Tạo đối tượng để lưu tiến trình học
    let lessonProgress = {}; // Lưu trạng thái của từng bài học

    lessons.forEach(lesson => {
        lesson.addEventListener("click", function () {
            const lessonId = lesson.getAttribute("data-id");

            // 1️⃣ Ẩn tất cả nội dung bài học
            contents.forEach(content => content.classList.remove("lesson-content--active"));

            // 2️⃣ Hiển thị bài học được chọn
            const activeContent = document.querySelector(`.lesson-content[data-id='${lessonId}']`);
            if (activeContent) {
                activeContent.classList.add("lesson-content--active");
            }

            // 3️⃣ Cập nhật icon play/pause
            lessons.forEach(l => l.querySelector(".lesson__icon i").classList.replace("fa-pause-circle", "fa-play-circle"));
            lesson.querySelector(".lesson__icon i").classList.replace("fa-play-circle", "fa-pause-circle");

            // 4️⃣ Cập nhật tiến trình học
            lessonProgress[lessonId] = 100; // Đánh dấu bài học này là hoàn thành

            // 🔥 Cập nhật giao diện tiến trình
            lessons.forEach(l => {
                const id = l.getAttribute("data-id");
                l.querySelector(".lesson__progress").textContent = lessonProgress[id] ? lessonProgress[id] + "%" : "0%";
            });
        });
    });
});


