package model;

public class Material {
    private int materialId;
    private String title;
    private String shortDescription;
    private double price;
    private String imagePath;
    private int studyTime;
    private String highlights;
    private String detailContent;
    private String pathLink;
    private String longDescription;

    public Material() {
    }

    public Material(int materialId, String title, String shortDescription, double price, 
            String imagePath, int studyTime, String highlights, String detailContent, 
            String pathLink, String longDescription) {
        this.materialId = materialId;
        this.title = title;
        this.shortDescription = shortDescription;
        this.price = price;
        this.imagePath = imagePath;
        this.studyTime = studyTime;
        this.highlights = highlights;
        this.detailContent = detailContent;
        this.pathLink = pathLink;
        this.longDescription = longDescription;
    }

    // Getters and Setters
    public int getMaterialId() {
        return materialId;
    }

    public void setMaterialId(int materialId) {
        this.materialId = materialId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public int getStudyTime() {
        return studyTime;
    }

    public void setStudyTime(int studyTime) {
        this.studyTime = studyTime;
    }

    public String getHighlights() {
        return highlights;
    }

    public void setHighlights(String highlights) {
        this.highlights = highlights;
    }

    public String getDetailContent() {
        return detailContent;
    }

    public void setDetailContent(String detailContent) {
        this.detailContent = detailContent;
    }

    public String getPathLink() {
        return pathLink;
    }

    public void setPathLink(String pathLink) {
        this.pathLink = pathLink;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public void setLongDescription(String longDescription) {
        this.longDescription = longDescription;
    }

    @Override
    public String toString() {
        return "Material{" + "materialId=" + materialId + ", title=" + title + 
                ", shortDescription=" + shortDescription + ", price=" + price + 
                ", imagePath=" + imagePath + ", studyTime=" + studyTime + 
                ", highlights=" + highlights + ", detailContent=" + detailContent + 
                ", pathLink=" + pathLink + ", longDescription=" + longDescription + '}';
    }
} 

