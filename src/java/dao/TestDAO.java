/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Test;

/**
 *
 * @author Asus
 */
public class TestDAO {
    Connection conn;

    public TestDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    public List<Test> getAll() {
        String sql = "  select * from[dbo].[Test]";
        List<Test> testL = new ArrayList<>();

        try {
            //Khay chua cau lenh
            PreparedStatement pre = conn.prepareStatement(sql);

            //Chay cau lenh va tao khay chua ketqua
            ResultSet result = pre.executeQuery();

            while (result.next()) {
                int testID = result.getInt(1);
                String testName = result.getString(2);
                String description = result.getString(3);
                int duration = result.getInt(4);
                String filePath = result.getString(5);
                Timestamp createdAt = result.getTimestamp(6);

                String category = result.getString(7);
                Test test = new Test(testID, testName, description, duration, filePath, createdAt, category);

                testL.add(test);
            }

            result.close();
        } catch (Exception e) {
            System.err.println("error: " + e);
        }
        return testL;
    }

    public Test getByTestID(int testID) {
        String sql = "SELECT * FROM [dbo].[Test] WHERE testID = ?";
        Test test = null;

        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, testID);
            try (ResultSet result = pre.executeQuery()) {
                if (result.next()) {
                    String testName = result.getString(2);
                    String description = result.getString(3);
                    int duration = result.getInt(4);
                    String filePath = result.getString(5);
                    Timestamp createdAt = result.getTimestamp(6);

                    String category = result.getString(7);

                    test = new Test(testID, testName, description, duration, filePath, createdAt, category);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Nên dùng e.printStackTrace() để dễ debug hơn
        }
        return test; // Trả về null nếu không tìm thấy
    }

    public static void main(String[] args) {
        TestDAO dao = new TestDAO();
//        //Test lay toan bo khoa hoc
//        List<Test> list = new ArrayList<>();
//        list = dao.getAll();
//        for (Test c : list) {
//            System.out.println(c);
//        }

          Test test=dao.getByTestID(3);
          System.out.println(test.getFilePath());
          System.out.println(test.getCategory());
          System.out.println(test);
    }

}
