/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author macbookpro
 */
import java.security.SecureRandom;
import java.sql.Date;
import util.PasswordGenerator;

public class User {

    private int userID;
    private String role;
    private String username;
    private String password;
    private String email;
    private Date dateOfBirth;
    private String status;
    private Date createdAt;
    private Date updatedAt;

    public User() {
    }

    public User(int userID, String role, String username, String password, String email, Date dateOfBirth, String status, Date createdAt, Date updatedAt) {
        this.userID = userID;
        this.role = role;
        this.username = username;
        this.password = password;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.status = status;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public User(int userID, String role, String username, String password, String email, Date dateOfBirth, String status) {
        this.userID = userID;
        this.role = role;
        this.username = username;
        this.password = password;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.status = status;
        this.createdAt = new Date(System.currentTimeMillis());
        this.updatedAt = new Date(System.currentTimeMillis());
    }
    
    public User(String role, String username, String password, String email, Date dateOfBirth, String status) {
        this.role = role;
        this.username = username;
        this.password = password;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.status = status;
        this.createdAt = new Date(System.currentTimeMillis());
        this.updatedAt = new Date(System.currentTimeMillis());
    }

    public User(Google googleAccount) {
        this.username = googleAccount.getEmail();
        this.email = googleAccount.getEmail();
        this.role = "Student";
        this.status = googleAccount.isVerified_email() ? "Active" : "Inactive";
        this.password = PasswordGenerator.generateSecureRandomPassword(12);
        this.createdAt = new Date(System.currentTimeMillis());
        this.updatedAt = new Date(System.currentTimeMillis());
    }

    // Getters and Setters
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", role=" + role + ", username=" + username + ", password=" + password + ", email=" + email + ", dateOfBirth=" + dateOfBirth + ", status=" + status + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + '}';
    }

}
