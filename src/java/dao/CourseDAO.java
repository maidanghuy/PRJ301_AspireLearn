/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.ArrayList;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import model.Course;

/**
 *
 * @author macbookpro
 */
public class CourseDAO {

    Connection conn;

    public CourseDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    public ArrayList<Course> getUserCourses(int userID) {
        ArrayList<Course> courses = new ArrayList<>();
        String query = "SELECT c.courseID, c.courseName, c.description, c.level, "
                + "c.createdAt, c.updatedAt, c.details, c.learningPathway, "
                + "c.commitment, c.linkimg "
                + "FROM User_Course uc "
                + "JOIN Courses c ON uc.courseID = c.courseID "
                + "WHERE uc.userID = ?";

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Course course = new Course(
                        rs.getInt("courseID"),
                        rs.getString("courseName"),
                        rs.getString("description"),
                        rs.getString("level"),
                        rs.getDate("createdAt"),
                        rs.getDate("updatedAt"),
                        rs.getString("details"),
                        rs.getString("learningPathway"),
                        rs.getString("commitment"), // Map từ commitment
                        rs.getString("linkimg")
                );
                courses.add(course);
            }
            conn.close();
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public List<Course> getAll() {
        String sql = "select *from [dbo].[Courses]";
        List<Course> courseL = new ArrayList<>();

        try {
            //Khay chua cau lenh
            PreparedStatement pre = conn.prepareStatement(sql);

            //Chay cau lenh va tao khay chua ketqua
            ResultSet result = pre.executeQuery();

            while (result.next()) {
                int courseID = result.getInt(1);
                String courseName = result.getString(2);
                String description = result.getString(3);
                String level = result.getString(4);
                Date createdAt = result.getDate(5);
                Date updatedAt = result.getDate(6);
                String linkimg = result.getString(10);
                Course cus = new Course(courseID, courseName, description, level, createdAt, updatedAt, linkimg);

                courseL.add(cus);
            }

            result.close();
        } catch (Exception e) {
            System.err.println("error: " + e);
        }
        return courseL;
    }

    public Course getByCourseID(int courseID) {
        String sql = "SELECT * FROM [dbo].[Courses] WHERE courseID = ?";
        Course course = null;

        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, courseID);
            try (ResultSet result = pre.executeQuery()) {
                if (result.next()) {
                    String courseName = result.getString(2);
                    String description = result.getString(3);
                    String level = result.getString(4);
                    Date createdAt = result.getDate(5);
                    Date updatedAt = result.getDate(6);
                    String details = result.getString(7);
                    String learningPathway = result.getString(8);
                    String commit = result.getString(9);
                    String linkimg = result.getString(10);

                    course = new Course(courseID, courseName, description, level, createdAt, updatedAt, details, learningPathway, commit, linkimg);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Nên dùng e.printStackTrace() để dễ debug hơn
        }
        return course; // Trả về null nếu không tìm thấy
    }

    public ArrayList<Course> getAllCourse() {
        String sql = "SELECT courseID, courseName, description, level, createdAt, updatedAt, details, learningPathway, commitment, linkimg FROM [dbo].[Courses]";
        ArrayList<Course> courseList = new ArrayList<>();

        try (PreparedStatement pre = conn.prepareStatement(sql); ResultSet result = pre.executeQuery()) {

            while (result.next()) {
                int courseID = result.getInt("courseID");
                String courseName = result.getString("courseName");
                String description = result.getString("description");
                String level = result.getString("level");
                Date createdAt = result.getDate("createdAt");
                Date updatedAt = result.getDate("updatedAt");
                String details = result.getString("details");
                String learningPathway = result.getString("learningPathway");
                String commitment = result.getString("commitment");
                String linkimg = result.getString("linkimg");

                Course course = new Course(courseID, courseName, description, level, createdAt, updatedAt, details, learningPathway, commitment, linkimg);
                courseList.add(course);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching courses: " + e.getMessage());
        }
        return courseList;
    }

    public int getTotalCourses(String search, String levelFilter) {
        String sql = "SELECT COUNT(*) FROM courses WHERE 1=1";

        if (search != null && !search.trim().isEmpty()) {
            sql += " AND (course_name LIKE ? OR description LIKE ?)";
        }
        if (levelFilter != null && !levelFilter.trim().isEmpty()) {
            sql += " AND level = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            int paramIndex = 1;

            if (search != null && !search.trim().isEmpty()) {
                String searchPattern = "%" + search.trim() + "%";
                stmt.setString(paramIndex++, searchPattern);
                stmt.setString(paramIndex++, searchPattern);
            }
            if (levelFilter != null && !levelFilter.trim().isEmpty()) {
                stmt.setString(paramIndex++, levelFilter);
            }

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<Course> getCourses(int offset, int limit, String search, String levelFilter) {
        ArrayList<Course> courses = new ArrayList<>();
        String sql = "SELECT courseID, courseName, description, level, createdAt, updatedAt, details, learningPathway, commitment, linkimg FROM Courses WHERE 1=1";

        if (search != null && !search.trim().isEmpty()) {
            sql += " AND (courseName LIKE ? OR courseID = ?)";
        }

        if (levelFilter != null && !levelFilter.trim().isEmpty()) {
            sql += " AND level = ?";
        }

        sql += " ORDER BY courseID ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            int paramIndex = 1;

            if (search != null && !search.trim().isEmpty()) {
                String searchPattern = "%" + search.trim() + "%";
                stmt.setString(paramIndex++, searchPattern);
                // Kiểm tra nếu search là số thì thêm courseID vào
                try {
                    int courseID = Integer.parseInt(search);
                    stmt.setInt(paramIndex++, courseID);
                } catch (NumberFormatException e) {
                    stmt.setNull(paramIndex++, java.sql.Types.INTEGER); // Nếu không phải số, truyền NULL
                }
            }

            if (levelFilter != null && !levelFilter.trim().isEmpty()) {
                stmt.setString(paramIndex++, levelFilter);
            }

            stmt.setInt(paramIndex++, offset);
            stmt.setInt(paramIndex++, limit);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    courses.add(new Course(
                            rs.getInt("courseID"),
                            rs.getString("courseName"),
                            rs.getString("description"),
                            rs.getString("level"),
                            rs.getDate("createdAt"),
                            rs.getDate("updatedAt"),
                            rs.getString("details"),
                            rs.getString("learningPathway"),
                            rs.getString("commitment"),
                            rs.getString("linkimg")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }
    
    public ArrayList<Course> getCoursesCreatedThisMonth() {
        ArrayList<Course> courseList = new ArrayList<>();
        String query = "SELECT * FROM Courses WHERE MONTH(createdAt) = ? AND YEAR(createdAt) = ?";

        try {
            PreparedStatement stmt = conn.prepareStatement(query);

            // Lấy tháng và năm hiện tại
            Calendar cal = Calendar.getInstance();
            int currentMonth = cal.get(Calendar.MONTH) + 1; // Tháng bắt đầu từ 0 nên cần +1
            int currentYear = cal.get(Calendar.YEAR);

            stmt.setInt(1, currentMonth);
            stmt.setInt(2, currentYear);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Course course = new Course(
                        rs.getInt("courseID"),
                        rs.getString("courseName"),
                        rs.getString("description"),
                        rs.getString("level"),
                        rs.getDate("createdAt"),
                        rs.getDate("updatedAt"),
                        rs.getString("details"),
                        rs.getString("learningPathway"),
                        rs.getString("commitment"),
                        rs.getString("linkimg")
                );
                courseList.add(course);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseList;
    }

    public static void main(String[] args) {
        CourseDAO cdao = new CourseDAO();
//        System.out.println(cdao.getByCourseID(2));
//        System.out.println(cdao.getUserCourses(2));
//        System.out.println(cdao.getAllCourse()); 
//        System.out.println(cdao.getTotalCourses(null, "Beginner"));
//        System.out.println(cdao.getCourses(0, 10, "toeic", "Intermediate"));
        System.out.println(cdao.getCoursesCreatedThisMonth());
    }

}
