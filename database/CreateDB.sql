-- Xóa database nếu tồn tại
USE master;
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'ElearningDB')
BEGIN
    ALTER DATABASE ElearningDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ElearningDB;
END
GO

-- Tạo lại database
CREATE DATABASE ElearningDB;
GO
USE ElearningDB;
GO

-- Bảng Users (Người dùng - Học viên/Giảng viên)
CREATE TABLE Users
(
    userID INT IDENTITY(1,1) PRIMARY KEY,
    role NVARCHAR(50) NOT NULL,
    username NVARCHAR(100) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    dateOfBirth DATE,
    status NVARCHAR(20),
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE()
);

-- Bảng Courses (Khóa học)
CREATE TABLE Courses
(
    courseID INT IDENTITY(1,1) PRIMARY KEY,
    courseName NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    level NVARCHAR(50),
    createdAt DATETIME DEFAULT GETDATE(),
    updatedAt DATETIME DEFAULT GETDATE(),
    details NVARCHAR(MAX),
    learningPathway NVARCHAR(MAX),
    commitment NVARCHAR(MAX),
    linkimg NVARCHAR(MAX)
);

-- Bảng Materials (Tài liệu học tập)
CREATE TABLE Materials (
    material_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255) NOT NULL,
    short_description NVARCHAR(500) NULL,
    price DECIMAL(12,2) NOT NULL,
    image_path NVARCHAR(500) NULL,
    study_time INT NULL DEFAULT 0,
    highlights NVARCHAR(MAX) NULL,
    detail_content NVARCHAR(MAX) NULL,
    path_link NVARCHAR(500) NULL,
    long_description NVARCHAR(MAX) NULL
);

-- Bảng Materials_User (Thanh Toán Tài liệu)
CREATE TABLE Materials_User ( 
    transaction_id INT PRIMARY KEY IDENTITY(1,1),
    userID INT NOT NULL, 
    material_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL, 
    payment_status NVARCHAR(50) NOT NULL DEFAULT 'Pending', 
    payment_method NVARCHAR(50), 
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (material_id) REFERENCES Materials(material_id) ON DELETE CASCADE,
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE
);

-- Bảng User_Course (Liên kết người dùng và khóa học)
CREATE TABLE User_Course
(
    userID INT,
    courseID INT,
    enrollDate DATE DEFAULT GETDATE(),
    progress DECIMAL(5,2) DEFAULT 0,
    PRIMARY KEY (userID, courseID),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (courseID) REFERENCES Courses(courseID) ON DELETE CASCADE
);

-- Bảng Lesson (Bài học)
CREATE TABLE Lesson (
    lessonID INT IDENTITY(1,1) PRIMARY KEY,
    courseID INT NOT NULL,
    lessonTitle NVARCHAR(255) NOT NULL,
    content NVARCHAR(MAX),
    duration INT,
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (courseID) REFERENCES Courses(courseID) ON DELETE CASCADE
);

-- Bảng Content (Nội dung giảng dạy)
CREATE TABLE Content
(
    contentID INT IDENTITY(1,1) PRIMARY KEY,
    contentType NVARCHAR(50) NOT NULL,
    title NVARCHAR(255),
    filePath NVARCHAR(255),
    videoPath NVARCHAR(255),
    audioFile NVARCHAR(255),
    source NVARCHAR(MAX),
    example NVARCHAR(MAX),
    createdAt DATETIME DEFAULT GETDATE(),
    describe NVARCHAR(MAX)
);

-- Bảng Lesson_Content (Liên kết bài học với nội dung)
CREATE TABLE Lesson_Content
(
    lessonID INT,
    contentID INT,
    PRIMARY KEY (lessonID, contentID),
    FOREIGN KEY (lessonID) REFERENCES Lesson(lessonID) ON DELETE CASCADE,
    FOREIGN KEY (contentID) REFERENCES Content(contentID) ON DELETE CASCADE
);

-- Bảng Exercise (Bài tập)
CREATE TABLE Exercise
(
    exerciseID INT IDENTITY(1,1) PRIMARY KEY,
    contentID INT NOT NULL,
    difficultyLevel NVARCHAR(50),
    type NVARCHAR(50),
    questionPath NVARCHAR(255),
    exercisePath NVARCHAR(255),
    content NVARCHAR(MAX),
    createdAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (contentID) REFERENCES Content(contentID) ON DELETE CASCADE
);

-- Bảng Test (Bài kiểm tra)
CREATE TABLE Test
(
    testID INT IDENTITY(1,1) PRIMARY KEY,
    testName NVARCHAR(255) NOT NULL,
    description NVARCHAR(MAX),
    duration INT,
    filePath NVARCHAR(255),
    createdAt DATETIME DEFAULT GETDATE(),
    category NVARCHAR(50)
);

-- Bảng TestScore (Điểm kiểm tra của người dùng)
CREATE TABLE TestScore
(
    userID INT,
    testID INT,
    score DECIMAL(5,2) NOT NULL,
    attemptDate DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (userID, testID, attemptDate),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (testID) REFERENCES Test(testID) ON DELETE CASCADE
);

-- Bảng ExerciseScore (Điểm bài tập của người dùng)
CREATE TABLE ExerciseScore
(
    userID INT,
    exerciseID INT,
    score DECIMAL(5,2) NOT NULL,
    attemptDate DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (userID, exerciseID, attemptDate),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE,
    FOREIGN KEY (exerciseID) REFERENCES Exercise(exerciseID) ON DELETE CASCADE
);
