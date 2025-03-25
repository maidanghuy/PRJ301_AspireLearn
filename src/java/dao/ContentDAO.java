/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import db.ConnectDB;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Content;

/**
 *
 * @author LENOVO
 */
public class ContentDAO {

    Connection conn;

    public ContentDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    public List<Content> getAllContentByLessonID(int id) {
        String sql = "select c.contentID, c.contentType, c.title, c.filePath, c.videoPath, c.audioFile, c.source, c.example, c.describe, c.createdAt \n"
                + "from Content c inner join Lesson_Content lc on c.contentID = lc.contentID\n"
                + "inner join Lesson l on lc.lessonID = l.lessonID\n"
                + "where l.lessonID = ?";
        List<Content> contentList = new ArrayList<>();
        try {
            //Tạo khay chứa câu lệnh
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, id);
            //Chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                String contentType = resultSet.getString(2);
                String title = resultSet.getString(3);
                String filePath = resultSet.getString(4);
                String videoPath = resultSet.getString(5);
                String audioFile = resultSet.getString(6);
                String source = resultSet.getString(7);
                String example= resultSet.getString(8);
                String describe= resultSet.getString(9);
                Date createdAt= resultSet.getDate(10);
                contentList.add(new Content(id, contentType, title, filePath, videoPath, audioFile, source, example, describe, createdAt));
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return contentList;
    }

    public static void main(String[] args) {
        ContentDAO dao = new ContentDAO();
        List<Content> a = dao.getAllContentByLessonID(1);
        System.out.println(a);
    }
}
