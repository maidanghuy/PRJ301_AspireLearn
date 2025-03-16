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
    
    public static void main(String[] args) {
        CourseDAO cdao = new CourseDAO();
        System.out.println(cdao.getUserCourses(2));
    }

}
