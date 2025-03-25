-- Chèn dữ liệu vào bảng Users
INSERT INTO Users (role, username, password, email, dateOfBirth, status, createdAt, updatedAt)
VALUES
    ('Student', 'maidanghuy', '123123', 'maidanghuy@example.com', '2004-05-15', 'Active', GETDATE(), GETDATE()),
    ('Student', 'nguyenlequan', '123123', 'nguyenlequan@example.com', '2003-07-20', 'Active', GETDATE(), GETDATE()),
    ('Teacher', 'hoangminhhien', '123123', 'hoangminhhien@example.com', '1985-11-30', 'Active', GETDATE(), GETDATE()),
    ('Student', 'trandinhquy', '123123', 'trandinhquy@example.com', '2005-01-10', 'Active', GETDATE(), GETDATE()),
    ('Teacher', 'admin', '123123', 'admin@example.com', '1990-09-25', 'Inactive', GETDATE(), GETDATE()),
    ('Student', 'huyhoang', '123123', 'huyhoang@example.com', '2004-11-14', 'Active', GETDATE(), GETDATE()),
    ('Student', 'user1', 'password1', 'user1@example.com', '2000-05-10', 'Active', '2025-02-05', '2025-02-05'),
    ('Teacher', 'user2', 'password2', 'user2@example.com', '1995-08-22', 'Inactive', '2025-02-10', '2025-02-10'),
    ('Admin', 'user3', 'password3', 'user3@example.com', '1988-12-15', 'Active', '2025-02-12', '2025-02-12'),
    ('Student', 'user4', 'password4', 'user4@example.com', '2002-07-08', 'Pending', '2025-02-18', '2025-02-18'),
    ('Teacher', 'user5', 'password5', 'user5@example.com', '1990-09-30', 'Active', '2025-02-20', '2025-02-20'),
    ('Student', 'user6', 'password6', 'user6@example.com', '2001-06-14', 'Inactive', '2025-02-23', '2025-02-23'),
    ('Admin', 'user7', 'password7', 'user7@example.com', '1992-04-02', 'Active', '2025-02-25', '2025-02-25'),
    ('Teacher', 'user8', 'password8', 'user8@example.com', '1985-11-10', 'Pending', '2025-02-26', '2025-02-26'),
    ('Student', 'user9', 'password9', 'user9@example.com', '2003-01-17', 'Active', '2025-02-27', '2025-02-27'),
    ('Teacher', 'user10', 'password10', 'user10@example.com', '1998-03-25', 'Inactive', '2025-02-28', '2025-02-28');

-- Chèn dữ liệu vào bảng Courses
INSERT INTO Courses (courseName, description, level)
VALUES
    ('TOEIC Beginner', 'A course designed for beginners preparing for TOEIC, covering pronunciation, vocabulary, and basic grammar.', 'Beginner'),
    ('TOEIC Intermediate', 'Helps students improve their communication and listening skills for TOEIC at an intermediate level.', 'Intermediate'),
    ('TOEIC Preparation', 'Provides strategies and practice exercises to help students achieve a high score on the TOEIC exam.', 'Advanced'),
    ('Japanese N5', 'Helps students get familiar with Hiragana, Katakana, and basic grammar in Japanese, suitable for N5 level.', 'Beginner'),
    ('Japanese N4', 'Expands vocabulary, grammar, and reading comprehension skills for the Japanese Language Proficiency Test (JLPT) at the N4 level.', 'Intermediate');

-- Cập nhật thông tin chi tiết cho các khóa học
UPDATE Courses
SET 
    details = 'Master advanced strategies for all TOEIC Reading and Listening question types to maximize your score;
    Develop efficient time management and test-taking techniques for high accuracy under exam conditions;
    Improve performance in complex TOEIC Listening parts, including Part 3 (Conversations) and Part 4 (Talks);
    Strengthen reading comprehension skills for double passages and inference-based questions;
    Expand business vocabulary and grammatical accuracy for sentence completion and error recognition;
    The TOEIC Preparation Course is designed for students aiming to achieve a TOEIC score of 750+ for career or academic purposes;
    This course provides intensive practice with simulated TOEIC exams and personalized feedback from experienced instructors;
    The tuition fee for this course is 6,500,000 VND / 3.5 months, including full access to study materials, mock tests, and detailed corrections;
    This course is especially suitable for students who want to reach their target TOEIC score in the shortest time possible.',

    learningPathway = '"Vocabulary: Advanced business contexts, financial reports, corporate communication / High-frequency TOEIC idioms, formal expressions / Utilize context-based memorization techniques / Learn specialized vocabulary for different TOEIC topics",
"Grammar: Mastery of complex sentence structures in formal writing / Perfect tense usage in TOEIC, modal verbs for formal contexts / Grammar rules for error correction and sentence restructuring",
"Reading: Deep understanding of all TOEIC Reading question types / Speed reading techniques for quick information extraction / Avoid common traps in inference and paraphrased questions",
"Listening: Handle complex business meetings, negotiations, and briefings / Develop strategies for following extended conversations and announcements / Perfect your approach to answering TOEIC listening questions under time pressure",
"Practice_Tests: Full-length simulated TOEIC exams with score tracking / Step-by-step breakdown of correct and incorrect answers"'
WHERE  [courseID]= 3;

UPDATE Courses
SET 
    details = 'Learn essential Japanese skills to build a strong foundation in grammar, vocabulary, and pronunciation;
    Master Hiragana and Katakana, the two fundamental Japanese writing systems;
    Understand basic sentence structures and essential kanji for daily conversations;
    Improve listening and speaking skills for common real-life situations, such as self-introduction and shopping;
    Develop confidence in reading simple texts and understanding basic Japanese dialogues;
    The Japanese N5 Course is designed for beginners who want to start learning Japanese from scratch;
    This course prepares students for the JLPT N5 exam by covering all key language components;
    The tuition fee for this course is 4,000,000 VND / 3 months, including study materials and personalized feedback from experienced instructors;
    This course is especially suitable for students who want to pursue higher levels of Japanese proficiency, such as N4 and beyond.',

    learningPathway = '
    "Vocabulary: Daily life, greetings, numbers, time expressions / Common Japanese expressions and polite phrases / Use Flashcards and mnemonics to learn vocabulary / Gradually build a strong vocabulary base for N5",
    "Grammar: Basic Japanese sentence patterns / Key Japanese particles and their functions / Present, past, and negative forms in Japanese",
    "Reading: Master reading and writing in Hiragana and Katakana / Read short passages, signs, and basic instructions / Learn essential kanji characters for N5",
    "Listening: Understand simple spoken Japanese in daily conversations / Practice listening to native speakers in common scenarios / Get familiar with JLPT N5 listening question types",
    "Practice_Tests: Simulated JLPT N5 practice tests / Step-by-step analysis of answers and grammar explanations"'

WHERE [courseID] = 4;

UPDATE Courses
SET 
    details = 'Develop and refine strategies for handling all TOEIC Reading and Listening question types at an intermediate level;
    Improve time management, note-taking, and skimming-scanning techniques for better performance;
    Enhance accuracy and confidence in answering Part 3 and Part 4 of the Listening section;
    Gain deeper insights into grammar structures, collocations, and vocabulary used in TOEIC exams;
    The TOEIC Intermediate Course is designed for students who have a basic foundation in English and want to improve their TOEIC scores;
    This course focuses on enhancing comprehension, fluency, and business-related communication skills;
    The TOEIC Intermediate Course will help students transition to TOEIC Advanced levels with better test-taking strategies. The tuition fee for this course is 5,000,000 VND / 3 months, including study materials and detailed feedback from experienced instructors;
    This course is especially suitable for students aiming for a TOEIC score of 550-750 and seeking to improve their professional English skills.',
    
    learningPathway = '
    "Vocabulary: Business emails, reports, workplace interactions / Advanced TOEIC phrases, idiomatic expressions / Use mnemonics and context-based learning / Learn vocabulary through TOEIC-style reading passages",
    "Grammar: Complex sentence structures in business contexts / Advanced use of tenses in TOEIC / Grammar for error identification and sentence completion",
    "Reading: Recognize different question types in TOEIC Reading / Master advanced skimming and scanning skills / Avoid common pitfalls in double passages and inference questions",
    "Listening: Understand conversations in office, meetings, and negotiations / Analyze Part 3 & Part 4 dialogues effectively / Develop techniques for predicting answers",
    "Practice_Tests: Official TOEIC practice test series for intermediate learners / In-depth answer analysis and test-taking tips"
'
WHERE [courseID] = 2;

UPDATE Courses
SET 
    details = 'Master and practice strategies for most Reading and Listening question types, from basic to advanced;
    Gain a solid understanding of how to approach most Writing tasks, from basic to advanced;
    Enhance focus, time management, and strategic application through real IELTS test simulations in all sections;
    Familiarize yourself with the IELTS Computer Test format;
    The IELTS Beginner Course is designed for students who are new to English and want to improve their skills in preparation for the IELTS exam;
    This course helps students build a strong foundation in grammar, vocabulary, pronunciation, and basic communication skills, enabling them to express ideas clearly and confidently in English;
    The IELTS Beginner Course will help students confidently transition to IELTS Intermediate and more advanced courses. The tuition fee for this course is 4,500,000 VND / 2.5 months, including study materials and detailed Writing feedback from experienced instructors;
    This course is especially suitable for students who want to start from scratch and build a solid IELTS foundation, making it easier to develop their skills in more advanced courses',
    learningPathway = '
    "Vocabulary: Daily topics / Phrasal verbs, noun phrases / Memorize vocabulary using Flashcards / Expand vocabulary",
    "Grammar: Basic sentence structures / Fundamental English tenses / Important grammatical components",
    "Reading: Get familiar with different question types / Skimming and detailed reading skills / Identify common mistakes and how to fix them",
    "Listening: Listen to simple words and sentences / Listen to real-life conversations / Get familiar with basic question types",
    "Practice_Tests: Cambridge IELTS Test Series 9-16 / Detailed answers and explanations"
'

WHERE [courseID]= 1;

UPDATE Courses
SET 
    details = 'Expand your Japanese proficiency by building on the foundation of N5 with more advanced grammar, vocabulary, and kanji;
    Improve reading and listening skills to understand longer and more complex sentences;
    Learn key sentence patterns used in JLPT N4 to communicate more effectively in daily life and work;
    Strengthen speaking and writing skills through structured exercises and real-life applications;
    Gain confidence in handling JLPT N4-level questions, including reading comprehension and listening tasks;
    The Japanese N4 Course is designed for learners who have completed N5 or have basic knowledge of Japanese;
    This course provides structured lessons to help students prepare for the JLPT N4 exam efficiently;
    The tuition fee for this course is 4,500,000 VND / 3.5 months, including study materials and personalized feedback from experienced instructors;
    This course is especially suitable for students who want to advance their Japanese skills and aim for N3 and beyond.',

    learningPathway = '
    "Vocabulary: Workplace, travel, social interactions, daily routines /Frequently used N4 expressions and idiomatic phrases /Use sentence-based learning for vocabulary retention /Increase vocabulary range through JLPT-style texts",
    "Grammar: Intermediate Japanese sentence patterns, advanced usage of Japanese particles, complex verb conjugations (causative and passive forms) /Advanced usage of Japanese particles/Complex verb conjugations, including causative and passive forms",
    "Reading: Read and understand short news articles and essays/ Interpret longer and more complex dialogues/ learn additional kanji characters required for JLPT N4",
    "Listening: Understand conversations in more natural speech/ comprehend spoken Japanese in various contexts (shopping, work)/ practice JLPT N4 listening comprehension with simulated tests",
    "Practice_Tests: Full-length simulated JLPT N4 exams/comprehensive explanations for answers and grammar points"'

WHERE [courseID] = 5;


UPDATE Courses
SET 
    commitment = 'G-EASY guarantees a minimum TOEIC score of 350+, and if you study well, you can achieve up to 550+ after completing the TOEIC Beginner course; 
    This commitment applies to almost 100% of students, except in the following cases: 
    - Not studying, not completing assignments, or being absent too frequently. 
    - Missing important lessons in the course; 
    The commitment is valid within the official course duration (2.5 months), meaning we ensure you reach your target score without needing to retake the course multiple times. 
    (However, if you study seriously but do not reach the guaranteed score, you will be eligible for a free retake);
    The minimum score is just a baseline—if you put in extra effort, you can achieve even higher results; 
    Some students who completed the TOEIC Beginner course at G-EASY took the official TOEIC test and scored over 600, even though their initial goal was just 350-400 for graduation or job application requirements;'
WHERE courseID = 1;

UPDATE Courses
SET 
    commitment = 'G-EASY guarantees a minimum TOEIC score of 550+, and if you study well, you can achieve up to 750+ after completing the TOEIC Intermediate course; 
    This commitment applies to almost 100% of students, except in the following cases: 
    - Not studying, not completing assignments, or being absent too frequently. 
    - Missing important lessons in the course; 
    The commitment is valid within the official course duration (3 months), meaning we ensure you reach your target score without needing to retake the course multiple times. 
    (However, if you study seriously but do not reach the guaranteed score, you will be eligible for a free retake);
    The minimum score is just a baseline—if you put in extra effort, you can achieve even higher results;
    Some students who completed the TOEIC Intermediate course at G-EASY took the official TOEIC test and scored over 800, even though their initial goal was just 550-600 for job applications or graduation requirements;'
WHERE courseID = 2;

UPDATE Courses
SET 
    commitment = 'G-EASY guarantees a minimum TOEIC score of 750+, and if you study well, you can achieve up to 900+ after completing the TOEIC Preparation course;
    This commitment applies to almost 100% of students, except in the following cases: 
    - Not studying, not completing assignments, or being absent too frequently. 
    - Missing important lessons in the course; 
    The commitment is valid within the official course duration (3.5 months), meaning we ensure you reach your target score without needing to retake the course multiple times. 
    (However, if you study seriously but do not reach the guaranteed score, you will be eligible for a free retake); 
    The minimum score is just a baseline—if you put in extra effort, you can achieve even higher results; 
    Many students who completed the TOEIC Preparation course at G-EASY took the official TOEIC test and scored over 900, even though their initial goal was just 750-800 for career advancement or international job opportunities;'
WHERE courseID = 3;

UPDATE Courses
SET 
    commitment = 'G-EASY guarantees that after completing the Japanese N5 course, you will have a solid foundation in Japanese, including grammar, vocabulary, and communication skills. 
    If you study well, you can confidently pass the JLPT N5 exam;
    This commitment applies to almost 100% of students, except in the following cases:  
    - Not studying, not completing assignments, or being absent too frequently.  
    - Missing important lessons in the course;  
    The commitment is valid within the official course duration (3 months), ensuring you achieve your learning goals efficiently.  
    (However, if you study seriously but do not pass the JLPT N5 exam, you will be eligible for a free retake);  
    The minimum goal is to pass N5, but if you put in extra effort, you can achieve higher proficiency and be well-prepared for the JLPT N4 level;  
    Many students who completed the Japanese N5 course at G-EASY successfully passed the JLPT N5 and confidently continued their Japanese learning journey to higher levels;'
WHERE courseID = 4;

UPDATE Courses
SET 
    commitment = 'G-EASY guarantees that after completing the Japanese N4 course, you will significantly improve your grammar, vocabulary, and communication skills.  
    If you study well, you can confidently pass the JLPT N4 exam;  
    This commitment applies to almost 100% of students, except in the following cases:  
    - Not studying, not completing assignments, or being absent too frequently.  
    - Missing important lessons in the course;  
    The commitment is valid within the official course duration (3.5 months), ensuring you achieve your learning goals efficiently.  
    (However, if you study seriously but do not pass the JLPT N4 exam, you will be eligible for a free retake);  
    The minimum goal is to pass N4, but if you put in extra effort, you can achieve higher proficiency and be well-prepared for the JLPT N3 level;  
    Many students who completed the Japanese N4 course at G-EASY successfully passed the JLPT N4 and confidently continued their Japanese learning journey to higher levels;'
WHERE courseID = 5;


UPDATE Courses
SET 
    courseName = CASE 
        WHEN courseID = 1 THEN 'TOEIC Beginner'
        WHEN courseID = 2 THEN 'TOEIC Intermediate'
        WHEN courseID = 3 THEN 'TOEIC Preparation'
        WHEN courseID = 4 THEN 'Japanese N5'
        WHEN courseID = 5 THEN 'Japanese N4'
    END,
    description = CASE 
        WHEN courseID = 1 THEN 'A course designed for beginners preparing for TOEIC, covering pronunciation, vocabulary, and basic grammar.'
        WHEN courseID = 2 THEN 'Helps students improve their communication and listening skills for TOEIC at an intermediate level.'
        WHEN courseID = 3 THEN 'Provides strategies and practice exercises to help students achieve a high score on the TOEIC exam.'
        WHEN courseID = 4 THEN 'Helps students get familiar with Hiragana, Katakana, and basic grammar in Japanese, suitable for N5 level.'
        WHEN courseID = 5 THEN 'Expands vocabulary, grammar, and reading comprehension skills for the Japanese Language Proficiency Test (JLPT) at the N4 level.'
    END
WHERE courseID IN (1, 2, 3, 4, 5);

UPDATE Courses 
SET linkimg = 
    CASE 
        WHEN courseID = 5 THEN 'Japanese-N4.jpg'
        WHEN courseID = 4 THEN 'Japanese-N5.jpg'
        WHEN courseID = 3 THEN 'toeic.png'
        WHEN courseID = 2 THEN 'toeic-smartcom-english_optimized.jpg'
		WHEN courseID = 1 THEN 'toeic-smartcom-english_optimized.jpg'
        ELSE linkimg
    END;

-- Chèn dữ liệu vào bảng Materials
INSERT INTO Materials (title, short_description, price, image_path, study_time, highlights, detail_content, path_link, long_description)
VALUES 
(N'Big Step TOEIC 1', 
N'Khóa học TOEIC cơ bản cho người mới bắt đầu. Bao gồm các chủ đề ngữ pháp và từ vựng thiết yếu.', 
0, 
N'/assets/images/materials/toeic1.jpg', 
30, 
N'Ngữ pháp cơ bản TOEIC;3000+ từ vựng thiết yếu;Kỹ năng làm bài Reading;Kỹ năng làm bài Listening', 
N'Bài học ngữ pháp cơ bản;Bài tập thực hành sau mỗi bài học;Từ vựng TOEIC thiết yếu;File nghe MP3 chất lượng cao', 
N'https://drive.google.com/drive/folders/1MMBwCIOP5syjeM5iHmo0yLuu1ZB0-Fxt?usp=drive_link', 
N'Khóa học TOEIC cơ bản dành cho người mới bắt đầu, giúp bạn xây dựng nền tảng vững chắc cho hành trình chinh phục TOEIC.'),

(N'Big Step TOEIC 2', 
N'Khóa học TOEIC trung cấp với các bài tập và đề thi thực hành.', 
199000, 
N'/assets/images/materials/toeic2.jpg', 
40,
N'Ngữ pháp nâng cao TOEIC;5000+ từ vựng chuyên sâu;Chiến thuật làm bài thi;Đề thi thử TOEIC', 
N'Ngữ pháp và từ vựng nâng cao;Kỹ năng Listening chuyên sâu;Chiến thuật làm bài Reading;10 đề thi thử TOEIC', 
N'https://drive.google.com/drive/folders/1Ri5KXMq0KE7fETYoI1bsqMm0RM1U5Hhi?usp=drive_link', 
N'Khóa học TOEIC trung cấp dành cho người đã có nền tảng, giúp nâng cao kỹ năng và hướng tới điểm số 500+.'),

(N'Big Step TOEIC 3', 
N'Khóa học TOEIC nâng cao, hướng tới điểm số 700+.', 
299000, 
N'/assets/images/materials/toeic3.jpg', 
50,
N'Ngữ pháp và từ vựng nâng cao;Chiến thuật làm bài chuyên sâu;Đề thi thử TOEIC chuẩn format;Kỹ năng quản lý thời gian', 
N'Ngữ pháp và từ vựng chuyên sâu;Kỹ năng làm bài nâng cao;15 đề thi thử TOEIC;Hướng dẫn giải chi tiết', 
N'https://drive.google.com/drive/folders/1tCPkrOFakb_L-p3-HpjMQOEZZQM5QbOg?usp=drive_link', 
N'Khóa học TOEIC nâng cao dành cho người học hướng tới mục tiêu 700+ điểm TOEIC.'); 

-- Chèn dữ liệu vào bảng Content
INSERT INTO Content (contentType, title, filePath, videoPath, audioFile, source, example, describe, createdAt)
VALUES
    ('Vocabulary', 'Essential IELTS Vocabulary', 'files/essential_ielts_vocabulary.pdf', NULL, NULL, NULL, NULL, 'Comprehensive IELTS vocabulary guide', GETDATE()),
    ('Vocabulary', 'IELTS Academic Vocabulary', 'files/ielts_academic_vocab.pdf', NULL, NULL, NULL, NULL, 'Key academic vocabulary for IELTS', GETDATE()),
    ('Grammar', 'Basic IELTS Grammar', 'files/basic_ielts_grammar.pdf', 'https://www.youtube.com/embed/CfU7rIZPnNY?si=Fy6R3f-7AEkEqArK', NULL, NULL, NULL, 'Introduction to fundamental IELTS grammar rules', GETDATE()),
    ('Grammar', 'Advanced Grammar for IELTS', 'files/advanced_grammar_ielts.pdf', 'https://www.youtube.com/embed/BaX7xwa8Vh4?si=YOokbhdmd2wtMkTQ', NULL, NULL, NULL, 'Advanced grammar concepts for IELTS', GETDATE()),
    ('Reading', 'IELTS Reading Strategies', 'files/reading_strategies.pdf', NULL, NULL, NULL, NULL, 'Effective strategies for IELTS reading section', GETDATE()),
    ('Reading', 'IELTS Reading Practice', 'files/reading_practice_tests.pdf', NULL, NULL, NULL, NULL, 'Practice tests for IELTS reading comprehension', GETDATE()),
    ('Listening', 'IELTS Listening Test 1', 'files/listening_test1_transcript.pdf', NULL, 'audio/listening_test1.mp3', NULL, NULL, 'Full IELTS listening test with transcript', GETDATE()),
    ('Listening', 'IELTS Listening Tips', 'files/listening_tips.pdf', NULL, 'audio/listening_tips.mp3', NULL, NULL, 'Helpful listening tips for IELTS exam', GETDATE());

-- Chèn dữ liệu vào bảng Lesson
INSERT INTO Lesson (courseID, lessonTitle, content, duration, createdAt)
VALUES
    (1, 'IELTS Vocabulary Essentials', 'Lesson on essential vocabulary for IELTS', 45, GETDATE()),
    (1, 'Grammar for IELTS Writing', 'Compilation of essential grammar for the Writing section', 50, GETDATE()),
    (1, 'Effective Reading Techniques', 'Techniques for effective reading comprehension in IELTS', 60, GETDATE()),
    (1, 'IELTS Listening Strategies', 'Effective strategies for IELTS listening', 40, GETDATE());

-- Chèn dữ liệu vào bảng Lesson_Content
INSERT INTO Lesson_Content (lessonID, contentID)
VALUES
    (1, 1), (1, 3), (1, 5), (1, 7),  -- Lesson 1: Vocabulary
    (2, 2), (2, 4), (2, 6), (2, 8),  -- Lesson 2: Grammar
    (3, 1), (3, 3), (3, 5), (3, 7),  -- Lesson 3: Reading
    (4, 2), (4, 4), (4, 6), (4, 8);  -- Lesson 4: Listening

-- Chèn dữ liệu vào bảng User_Course
INSERT INTO User_Course (userID, courseID, enrollDate, progress)
VALUES
    (1, 1, '2025-03-01', 10),
    (2, 2, '2025-03-02', 20),
    (3, 3, '2025-03-03', 30),
    (4, 1, '2025-03-04', 40),
    (2, 3, '2025-03-05', 50),
    (6, 3, '2025-03-06', 60),
    (7, 1, '2025-03-07', 70),
    (2, 1, '2025-03-08', 80),
    (9, 3, '2025-03-09', 90),
    (3, 1, '2025-03-10', 100); 

INSERT INTO [dbo].[Test] 
([testID], [testName], [description], [duration], [filePath], [createdAt], [category]) 
VALUES 
    (1, 'Listening Test 1', 'Basic listening skills', 45, 
    'Assignment/Listening/Starter_TOEIC_ListeningUnit1.xlsx', 
    '2025-03-12 15:23:22.967', 'listening'),

    (2, 'Reading Test 1', 'Basic reading skills', 45, 
    'Assignment/Reading/Starter_TOEIC_ReadingUnit1.xlsx', 
    '2025-03-12 15:23:22.967', 'reading');
