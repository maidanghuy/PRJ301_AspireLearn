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
    
    public static void main(String[] args) {
        CourseDAO cdao = new CourseDAO();
        System.out.println(cdao.getByCourseID(2));
//        System.out.println(cdao.getUserCourses(2));
    }

}
