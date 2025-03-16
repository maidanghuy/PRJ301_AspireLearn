/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author macbookpro
 */
import java.sql.Date;

/**
 *
 * @author Asus
 */
public class Course implements java.io.Serializable{
    private int courseID;
    private String courseName;
    private String description;
    private String level;
    private Date createdAt;
    private Date updatedAt;
    private String details;
    private String learningPathway;
    private String commit;
    private String linkimg;
    
    

    public Course() {
    }

    public Course(int courseID, String courseName, String description, String level, Date createdAt, Date updatedAt, String linkimg) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.level = level;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.linkimg = linkimg;
    }

    public Course(int courseID, String courseName, String description, String level, Date createdAt, Date updatedAt, String details, String learningPathway, String commit, String linkimg) {
        this.courseID = courseID;
        this.courseName = courseName;
        this.description = description;
        this.level = level;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.details = details;
        this.learningPathway = learningPathway;
        this.commit = commit;
        this.linkimg = linkimg;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getLearningPathway() {
        return learningPathway;
    }

    public void setLearningPathway(String learningPathway) {
        this.learningPathway = learningPathway;
    }

    public String getCommit() {
        return commit;
    }

    public void setCommit(String commit) {
        this.commit = commit;
    }

    

    public String getLinkimg() {
        return linkimg;
    }

    public void setLinkimg(String linkimg) {
        this.linkimg = linkimg;
    }


    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
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
        StringBuilder sb = new StringBuilder();
        sb.append("Course{");
        sb.append("courseID=").append(courseID);
        sb.append(", courseName=").append(courseName);
        sb.append(", description=").append(description);
        sb.append(", level=").append(level);
        sb.append(", createdAt=").append(createdAt);
        sb.append(", updatedAt=").append(updatedAt);
        sb.append(", linkimg=").append(linkimg);
        sb.append('}');
        return sb.toString();
    }  
}
