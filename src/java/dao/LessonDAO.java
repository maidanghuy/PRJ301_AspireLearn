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
import java.util.ArrayList;
import model.Lesson;

/**
 *
 * @author macbookpro
 */
public class LessonDAO {
    Connection conn;

    public LessonDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<Lesson> getAllLessonsOfCourse(int courseID) {
        ArrayList<Lesson> lessons = new ArrayList<>();
        String query = "SELECT lessonID, courseID, lessonTitle, content, duration, createdAt FROM Lesson WHERE courseID = ? ORDER BY createdAt DESC";

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, courseID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLessonID(rs.getInt("lessonID"));
                lesson.setCourseID(rs.getInt("courseID"));
                lesson.setLessonTitle(rs.getString("lessonTitle"));
                lesson.setContent(rs.getString("content"));
                lesson.setDuration(rs.getInt("duration"));
                lesson.setCreatedAt(rs.getDate("createdAt"));

                lessons.add(lesson);
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessons;
    }
    
    public static void main(String[] args) {
        LessonDAO ldao = new LessonDAO();
        System.out.println(ldao.getAllLessonsOfCourse(1));
    }
}
