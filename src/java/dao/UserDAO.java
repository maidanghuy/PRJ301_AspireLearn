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

    // Get User from DB with username and password
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
                        rs.getString("status"),
                        rs.getDate("createdAt"), // Lấy thêm createdAt
                        rs.getDate("updatedAt") // Lấy thêm updatedAt
                );
            }
            conn.close();
            rs.close();
            stmt.close();
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
        String query = "SELECT * FROM Users WHERE email = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User(
                            rs.getInt("userID"),
                            rs.getString("role"), // Lấy role
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getDate("dateOfBirth"),
                            rs.getString("status"), // Lấy status
                            rs.getDate("createdAt"), // Lấy createdAt
                            rs.getDate("updatedAt") // Lấy updatedAt
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    // Edit user from From edit
    public boolean editUser(User user) {
        PreparedStatement pstmt = null;

        try {
            String sql = "UPDATE Users SET username = ?, email = ?, dateOfBirth = ?, password = ?, updatedAt = GETDATE() WHERE userID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setDate(3, user.getDateOfBirth());
            pstmt.setString(4, user.getPassword());
            pstmt.setInt(5, user.getUserID());

            int rowsUpdated = pstmt.executeUpdate(); // Chạy update trước khi đóng

            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public ArrayList<User> getAllUsers() {
        ArrayList<User> userList = new ArrayList<>();
        String query = "SELECT * FROM Users";

        try {
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User(
                        rs.getInt("userID"),
                        rs.getString("role"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getDate("dateOfBirth"),
                        rs.getString("status"),
                        rs.getDate("createdAt"),
                        rs.getDate("updatedAt")
                );
                userList.add(user);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public ArrayList<User> getUsers(int offset, int limit, String search, String roleFilter, String statusFilter) {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE 1=1";

        if (search != null && !search.trim().isEmpty()) {
            sql += " AND (username LIKE ? OR email LIKE ?)";
        }
        if (roleFilter != null && !roleFilter.trim().isEmpty()) {
            sql += " AND role = ?";
        }
        if (statusFilter != null && !statusFilter.trim().isEmpty()) {
            sql += " AND status = ?";
        }

        sql += " ORDER BY userID ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            int paramIndex = 1;

            if (search != null && !search.trim().isEmpty()) {
                String searchPattern = "%" + search.trim() + "%";
                stmt.setString(paramIndex++, searchPattern);
                stmt.setString(paramIndex++, searchPattern);
            }
            if (roleFilter != null && !roleFilter.trim().isEmpty()) {
                stmt.setString(paramIndex++, roleFilter);
            }
            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                stmt.setString(paramIndex++, statusFilter);
            }

            stmt.setInt(paramIndex++, offset);
            stmt.setInt(paramIndex++, limit);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    users.add(new User(
                            rs.getInt("userID"),
                            rs.getString("role"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getDate("dateOfBirth"),
                            rs.getString("status"),
                            rs.getDate("createdAt"),
                            rs.getDate("updatedAt")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getTotalUsers(String search, String roleFilter, String statusFilter) {
        String sql = "SELECT COUNT(*) FROM users WHERE 1=1";

        if (search != null && !search.trim().isEmpty()) {
            sql += " AND (username LIKE ? OR email LIKE ?)";
        }
        if (roleFilter != null && !roleFilter.trim().isEmpty()) {
            sql += " AND role = ?";
        }
        if (statusFilter != null && !statusFilter.trim().isEmpty()) {
            sql += " AND status = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            int paramIndex = 1;

            if (search != null && !search.trim().isEmpty()) {
                String searchPattern = "%" + search.trim() + "%";
                stmt.setString(paramIndex++, searchPattern);
                stmt.setString(paramIndex++, searchPattern);
            }
            if (roleFilter != null && !roleFilter.trim().isEmpty()) {
                stmt.setString(paramIndex++, roleFilter);
            }
            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                stmt.setString(paramIndex++, statusFilter);
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

    public boolean editUserForAdmin(User user) {
        PreparedStatement pstmt = null;

        try {
            String sql = "UPDATE Users SET updatedAt = GETDATE()";
            int index = 1;

            if (user.getUsername() != null && !user.getUsername().trim().isEmpty()) {
                sql += ", username = ?";
            }
            if (user.getEmail() != null && !user.getEmail().trim().isEmpty()) {
                sql += ", email = ?";
            }
            if (user.getPassword() != null && !user.getPassword().trim().isEmpty()) {
                sql += ", password = ?";
            }
            if (user.getRole() != null && !user.getRole().trim().isEmpty()) {
                sql += ", role = ?";
            }
            if (user.getStatus() != null && !user.getStatus().trim().isEmpty()) {
                sql += ", status = ?";
            }

            sql += " WHERE userID = ?";

            pstmt = conn.prepareStatement(sql);

            if (user.getUsername() != null && !user.getUsername().trim().isEmpty()) {
                pstmt.setString(index++, user.getUsername());
            }
            if (user.getEmail() != null && !user.getEmail().trim().isEmpty()) {
                pstmt.setString(index++, user.getEmail());
            }
            if (user.getPassword() != null && !user.getPassword().trim().isEmpty()) {
                pstmt.setString(index++, user.getPassword());
            }
            if (user.getRole() != null && !user.getRole().trim().isEmpty()) {
                pstmt.setString(index++, user.getRole());
            }
            if (user.getStatus() != null && !user.getStatus().trim().isEmpty()) {
                pstmt.setString(index++, user.getStatus());
            }

            pstmt.setInt(index, user.getUserID());

            int rowsUpdated = pstmt.executeUpdate();

            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean banUser(int userID) {
        PreparedStatement pstmt = null;

        try {
            String sql = "UPDATE Users SET status = 'Banned', updatedAt = GETDATE() WHERE userID = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userID);

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
//        System.out.println(udao.getUser("huy", "1233"));
//        System.out.println(udao.getTotalUsers(null));
        ArrayList<User> users = udao.getUsers(0, 15, null, null, null);
        System.out.println("Danh sách người dùng:");
        for (User u : users) {
            System.out.println(u);
        }
    }
}
