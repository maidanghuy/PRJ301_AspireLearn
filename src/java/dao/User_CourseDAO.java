/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.ConnectDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
import model.User_Course;

/**
 *
 * @author LENOVO
 */
public class User_CourseDAO {

    Connection conn;

    public User_CourseDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    public void addUser_Course(User_Course user_course) {
        String sql = "INSERT INTO [dbo].[User_Course]\n"
                + "           ([userID]\n"
                + "           ,[courseID]\n"
                + "           ,[enrollDate]\n"
                + "           ,[progress])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,GETDATE()\n"
                + "           ,?)";
        try {
            //Tạo khay chứa câu lệnh
            PreparedStatement pre = conn.prepareStatement(sql);
            //Set gia tri cho dau ?
            pre.setInt(1, user_course.getUserID());
            pre.setInt(2, user_course.getCourseID());
            //process date
            //cover java.util.date --> java.sql.date
//            java.sql.Date DateSql = new java.sql.Date(user_course.getEnrollDate().getTime());
//            pre.setDate(3, DateSql);

            pre.setString(3, user_course.getProgress());
            //Chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("error: " + e);
        }
    }

    public User_Course getUser_CourseByID(int userID, int courseID) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[User_Course]\n"
                + "  where userID = ? and courseID = ?";
        User_Course uc = new User_Course();
        try {
            //Tạo khay chứa câu lệnh
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, userID);
            pre.setInt(2, courseID);
            //Chạy câu lệnh và tạo khay chứa kết quả câu lệnh
            ResultSet resultSet = pre.executeQuery();
            while (resultSet.next()) {
                //lấy value theo từng cột

                Date enrollDate = resultSet.getDate(3);
                String progress = resultSet.getString(4);

                //tạo model hứng giữ liệu
                uc = new User_Course(userID, courseID, enrollDate, progress);
            }
        } catch (Exception e) {
            System.out.println("error: " + e);
        }
        return uc;
    }
    
    public static void main(String[] args) {
        User_CourseDAO dao = new User_CourseDAO();
        User_Course uc = dao.getUser_CourseByID(17, 1);
        System.out.println(uc);
        
    }
}
