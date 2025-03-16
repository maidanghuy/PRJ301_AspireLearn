/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

/**
 *
 * @author macbookpro
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author macbookpro
 */
public class ConnectDB implements DatabaseInfo {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(DRIVERNAME);
        return DriverManager.getConnection(DBURL, DBUSER, DBPASS);
    }

    public static void main(String[] args) {
        try {
            Connection connection = ConnectDB.getConnection();
            System.out.println("Connected to database successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error in ConnectDB! (26)");
            System.out.println(e);
        }
    }

}
