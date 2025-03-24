/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author macbookpro
 */
public class Lesson {

    private int lessonID;
    private int courseID;
    private String lessonTitle;
    private String content;
    private String shortContent;
    private int duration;
    private Date createdAt;

    // Constructors
    public Lesson() {
    }

    public Lesson(int lessonID, int courseID, String lessonTitle, String content, int duration, Date createdAt) {
        this.lessonID = lessonID;
        this.courseID = courseID;
        this.lessonTitle = lessonTitle;
        this.content = content;
        this.shortContent = content;
        this.duration = duration;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getLessonID() {
        return lessonID;
    }

    public void setLessonID(int lessonID) {
        this.lessonID = lessonID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getLessonTitle() {
        return lessonTitle;
    }

    public void setLessonTitle(String lessonTitle) {
        this.lessonTitle = lessonTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getShortContent() {
        return shortContent;
    }

    public void setShortContent(String shortContent) {
        this.shortContent = shortContent;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    // toString() method
    @Override
    public String toString() {
        return "Lesson{"
                + "lessonID=" + lessonID
                + ", courseID=" + courseID
                + ", lessonTitle='" + lessonTitle + '\''
                + ", content='" + content + '\''
                + ", duration=" + duration
                + ", createdAt=" + createdAt
                + '}';
    }
}
