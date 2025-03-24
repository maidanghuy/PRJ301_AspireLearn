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
public class Content {

    private int contentID;
    private String contentType;
    private String title;
    private String filePath;
    private String videoPath;
    private String audioFile;
    private String source;
    private String example;
    private String describe;
    private Date createdAt;

    // Constructor
    public Content(int contentID, String contentType, String title, String filePath, String videoPath, String audioFile,
            String source, String example, String describe, Date createdAt) {
        this.contentID = contentID;
        this.contentType = contentType;
        this.title = title;
        this.filePath = filePath;
        this.videoPath = videoPath;
        this.audioFile = audioFile;
        this.source = source;
        this.example = example;
        this.describe = describe;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getContentID() {
        return contentID;
    }

    public void setContentID(int contentID) {
        this.contentID = contentID;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public String getAudioFile() {
        return audioFile;
    }

    public void setAudioFile(String audioFile) {
        this.audioFile = audioFile;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getExample() {
        return example;
    }

    public void setExample(String example) {
        this.example = example;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "Content{"
                + "contentID=" + contentID
                + ", contentType='" + contentType + '\''
                + ", title='" + title + '\''
                + ", filePath='" + filePath + '\''
                + ", videoPath='" + videoPath + '\''
                + ", audioFile='" + audioFile + '\''
                + ", source='" + source + '\''
                + ", example='" + example + '\''
                + ", describe='" + describe + '\''
                + ", createdAt=" + createdAt
                + '}';
    }
}
