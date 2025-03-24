/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Asus
 */
public class Test implements Serializable {
    private int testID;
    private String testName;
    private String description;
    private int duration;
    private String filePath;
    private Timestamp createdAt;  // Dùng Timestamp thay vì Date để làm việc tốt hơn với DB
    private String category;

    
    public Test() {
    }

    // Constructor đầy đủ
    public Test(int testID, String testName, String description, int duration, String filePath, Timestamp createdAt, String category) {
        this.testID = testID;
        this.testName = testName;
        this.description = description;
        this.duration = duration;
        this.filePath = filePath;
        this.createdAt = createdAt != null ? new Timestamp(createdAt.getTime()) : null;
        this.category = category;
    }

    // Getter & Setter
    public int getTestID() {
        return testID;
    }

    public void setTestID(int testID) {
        this.testID = testID;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Timestamp getCreatedAt() {
        return createdAt != null ? new Timestamp(createdAt.getTime()) : null;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt != null ? new Timestamp(createdAt.getTime()) : null;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    // toString() để debug dễ dàng
    @Override
    public String toString() {
        return "Test{" +
                "testID=" + testID +
                ", testName='" + testName + '\'' +
                ", description='" + description + '\'' +
                ", duration=" + duration +
                ", filePath='" + filePath + '\'' +
                ", createdAt=" + createdAt +
                ", category='" + category + '\'' +
                '}';
    }
}
