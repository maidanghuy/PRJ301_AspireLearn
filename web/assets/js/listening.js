/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener('DOMContentLoaded', function () {
    const questions = document.querySelectorAll('.question-item');
    const imageContainer = document.getElementById('image-container');
    const imgElement = document.getElementById('question-image');
    const audioElement = document.getElementById('audio-player');
    const audioSource = document.getElementById('audio-source');
    const nextButtons = document.querySelectorAll('.btn-next');
    const backButtons = document.querySelectorAll('.btn-back');
    const submitContainer = document.getElementById('submit-container');
    let currentPart = null;
    let currentQuestion = 0;
    const questionNumbers = document.querySelectorAll('.question-number');

    // Ẩn tất cả câu hỏi trừ câu đầu tiên
    questions.forEach((question, index) => {
        if (index !== 0) {
            question.style.display = 'none';
        }
    });

    // Cập nhật media cho câu hỏi đầu tiên
    updateMedia(currentQuestion);

    // Cập nhật trạng thái câu hỏi khi chuyển câu
    function updateQuestionStatus() {
        questionNumbers.forEach((number, index) => {
            number.classList.remove('active');
            if (index === currentQuestion) {
                number.classList.add('active');
            }
        });
    }

    // Xử lý click vào số câu hỏi
    questionNumbers.forEach((number, index) => {
        number.addEventListener('click', function () {
            if (index === currentQuestion)
                return;

            // Ẩn câu hỏi hiện tại
            questions[currentQuestion].style.display = 'none';

            // Hiển thị câu hỏi được chọn
            currentQuestion = index;
            questions[currentQuestion].style.display = 'block';

            // Cập nhật media cho câu hỏi mới
            updateMedia(currentQuestion);

            // Cập nhật trạng thái câu hỏi
            updateQuestionStatus();

            // Ẩn nút Submit nếu không phải câu cuối
            if (currentQuestion < questions.length - 1) {
                submitContainer.style.display = 'none';
            } else {
                submitContainer.style.display = 'block';
            }
        });
    });

    // Cập nhật xử lý nút Back
    backButtons.forEach((button, index) => {
        button.addEventListener('click', function (e) {
            e.preventDefault();

            // Ẩn câu hỏi hiện tại
            questions[currentQuestion].style.display = 'none';

            // Hiển thị câu hỏi trước đó
            currentQuestion--;
            questions[currentQuestion].style.display = 'block';

            // Cập nhật media cho câu hỏi mới
            updateMedia(currentQuestion);

            // Cập nhật trạng thái câu hỏi
            updateQuestionStatus();

            // Ẩn nút Submit
            submitContainer.style.display = 'none';
        });
    });

    // Cập nhật xử lý nút Next
    nextButtons.forEach((button, index) => {
        button.addEventListener('click', function (e) {
            e.preventDefault();

            // Ẩn câu hỏi hiện tại
            questions[currentQuestion].style.display = 'none';

            // Hiển thị câu hỏi tiếp theo
            currentQuestion++;
            if (currentQuestion < questions.length) {
                questions[currentQuestion].style.display = 'block';

                // Cập nhật media cho câu hỏi mới
                updateMedia(currentQuestion);

                // Cập nhật trạng thái câu hỏi
                updateQuestionStatus();

                // Ẩn nút Submit nếu chưa phải câu hỏi cuối
                submitContainer.style.display = 'none';
            } else {
                // Nếu là câu hỏi cuối cùng, hiển thị nút Submit
                submitContainer.style.display = 'block';
            }
        });
    });

    // Hàm cập nhật media (hình ảnh và audio)
    function updateMedia(questionIndex) {
        if (questionIndex >= questions.length)
            return;

        const question = questions[questionIndex];
        const questionImg = question.getAttribute('data-img');
        const questionAudio = question.getAttribute('data-audio');

        // Cập nhật hình ảnh
        if (questionImg && questionImg !== 'null') {
            const imagePath = questionImg.startsWith("/") ? contextPath + questionImg : contextPath + "/" + questionImg;
            imgElement.src = imagePath;
            imageContainer.style.display = 'flex';
        } else {
            imageContainer.style.display = 'none';
        }

        // Cập nhật audio
        let audioToPlay = questionAudio;
        if (!audioToPlay || audioToPlay === 'null') {
            // Tìm audio gần nhất không null
            let foundAudio = null;
            let searchIndex = questionIndex;

            // Tìm về phía trước
            while (searchIndex > 0) {
                searchIndex--;
                const prevQuestion = questions[searchIndex];
                const prevAudio = prevQuestion.getAttribute('data-audio');
                if (prevAudio && prevAudio !== 'null') {
                    foundAudio = prevAudio;
                    break;
                }
            }

            // Nếu không tìm thấy ở phía trước, tìm về phía sau
            if (!foundAudio) {
                searchIndex = questionIndex;
                while (searchIndex < questions.length - 1) {
                    searchIndex++;
                    const nextQuestion = questions[searchIndex];
                    const nextAudio = nextQuestion.getAttribute('data-audio');
                    if (nextAudio && nextAudio !== 'null') {
                        foundAudio = nextAudio;
                        break;
                    }
                }
            }

            audioToPlay = foundAudio;
        }

        if (audioToPlay && audioToPlay !== 'null') {
            const audioPath = audioToPlay.startsWith("/") ? contextPath + audioToPlay : contextPath + "/" + audioToPlay;
            // Chỉ cập nhật source và load nếu audio khác với audio đang phát
            if (audioSource.src !== audioPath) {
                audioSource.src = audioPath;
                audioElement.load();
            }
            // Tiếp tục phát từ vị trí hiện tại
            audioElement.play();
        }
    }
});