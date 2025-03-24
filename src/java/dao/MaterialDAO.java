package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Material;
import db.ConnectDB;

public class MaterialDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public List<Material> getAllMaterials() {
        List<Material> list = new ArrayList<>();
        String query = "SELECT * FROM Materials ORDER BY price ASC";
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Material(
                    rs.getInt("material_id"),
                    rs.getString("title"),
                    rs.getString("short_description"),
                    rs.getDouble("price"),
                    rs.getString("image_path"),
                    rs.getInt("study_time"),
                    rs.getString("highlights"),
                    rs.getString("detail_content"),
                    rs.getString("path_link"),
                    rs.getString("long_description")
                ));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return list;
    }
    
    public Material getMaterialById(int id) {
        String query = "SELECT * FROM Materials WHERE material_id = ?";
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Material(
                    rs.getInt("material_id"),
                    rs.getString("title"),
                    rs.getString("short_description"),
                    rs.getDouble("price"),
                    rs.getString("image_path"),
                    rs.getInt("study_time"),
                    rs.getString("highlights"),
                    rs.getString("detail_content"),
                    rs.getString("path_link"),
                    rs.getString("long_description")
                );
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return null;
    }

    public List<Material> searchMaterials(String keyword) {
        List<Material> list = new ArrayList<>();
        String query = "SELECT * FROM Materials WHERE title LIKE ? OR short_description LIKE ?";
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(query);
            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Material(
                    rs.getInt("material_id"),
                    rs.getString("title"),
                    rs.getString("short_description"),
                    rs.getDouble("price"),
                    rs.getString("image_path"),
                    rs.getInt("study_time"),
                    rs.getString("highlights"),
                    rs.getString("detail_content"),
                    rs.getString("path_link"),
                    rs.getString("long_description")
                ));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
        return list;
    }
    
    public static void main(String[] args) {
        MaterialDAO mdao = new MaterialDAO();
        
        // Test getAllMaterials()
        System.out.println("Testing getAllMaterials():");
        List<Material> materials = mdao.getAllMaterials();
        for (Material m : materials) {
            System.out.println("ID: " + m.getMaterialId());
            System.out.println("Title: " + m.getTitle());
            System.out.println("Price: " + m.getPrice());
            System.out.println("--------------------");
        }
        
        // Test getMaterialById()
        System.out.println("\nTesting getMaterialById(1):");
        Material material = mdao.getMaterialById(1);
        if (material != null) {
            System.out.println("Found material:");
            System.out.println("ID: " + material.getMaterialId());
            System.out.println("Title: " + material.getTitle());
            System.out.println("Description: " + material.getShortDescription());
            System.out.println("Price: " + material.getPrice());
            System.out.println("Study Time: " + material.getStudyTime() + " hours");
        } else {
            System.out.println("No material found with ID 1");
        }

        // Test searchMaterials()
        System.out.println("\nTesting searchMaterials('TOEIC'):");
        List<Material> searchResults = mdao.searchMaterials("TOEIC");
        for (Material m : searchResults) {
            System.out.println("ID: " + m.getMaterialId());
            System.out.println("Title: " + m.getTitle());
            System.out.println("Price: " + m.getPrice());
            System.out.println("--------------------");
        }
    }
} 

