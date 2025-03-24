/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class User_Course {
    int userID;
    int courseID;
    Date enrollDate;
    String progress;

    public User_Course() {
    }

    public User_Course(int userID, int courseID, Date enrollDate, String progress) {
        this.userID = userID;
        this.courseID = courseID;
        this.enrollDate = enrollDate;
        this.progress = progress;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public Date getEnrollDate() {
        return enrollDate;
    }

    public void setEnrollDate(Date enrollDate) {
        this.enrollDate = enrollDate;
    }

    public String getProgress() {
        return progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    @Override
    public String toString() {
        return "User_Course{" + "userID=" + userID + ", courseID=" + courseID + ", enrollDate=" + enrollDate + ", progress=" + progress + '}';
    }
    
}
