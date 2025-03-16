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
import model.User;

/**
 *
 * @author macbookpro
 */
public class UserDAO {

    Connection conn;

    public UserDAO() {
        ConnectDB connectDB = new ConnectDB();
        try {
            conn = connectDB.getConnection();
        } catch (Exception e) {
            System.out.println(e);

        }
    }

    // Get User Form DB with username and password
    public User getUser(String username, String password) {
        User user = null;
        String query = "SELECT * FROM Users WHERE username = ? AND password = ?";

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(
                        rs.getInt("userID"),
                        rs.getString("role"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getDate("dateOfBirth"),
                        rs.getString("status")
                );
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Check Username From DB
    public boolean isUsernameExists(String username, Integer userID) {
        String query = "SELECT COUNT(*) FROM Users WHERE username = ?";
        if (userID != null) {
            query += " AND userID <> ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, username);
            if (userID != null) {
                stmt.setInt(2, userID);
            }
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Check Email From DB
    public boolean isEmailExists(String email, Integer userID) {
        String sql = "SELECT COUNT(*) FROM Users WHERE email = ?";
        if (userID != null) {
            sql += " AND userID <> ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            if (userID != null) {
                stmt.setInt(2, userID);
            }
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Register for User and insert to DB 
    public boolean registerUser(User user) {
        String sql = "INSERT INTO Users (role, username, password, email, dateOfBirth, status, createdAt, updatedAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, GETDATE(), GETDATE())";

        try {

            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, user.getRole());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getEmail());

            if (user.getDateOfBirth() != null) {
                stmt.setDate(5, user.getDateOfBirth());
            } else {
                java.sql.Date sqlDate = new java.sql.Date(System.currentTimeMillis());
                stmt.setDate(5, sqlDate);
            }

            stmt.setString(6, user.getStatus());

            int rowsInserted = stmt.executeUpdate();
            stmt.close();
            conn.close();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get User from DB by Email
    public User getUserByEmail(String email) {
        User user = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM Users WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

//            int userID, String role, String username, String password, String email, Date dateOfBirth, String status
            if (rs.next()) {
                user = new User(
                        rs.getInt("userID"),
                        null,
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getDate("dateOfBirth"),
                        null
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        System.out.println(udao.getUser("huy", "1233"));
    }
}
