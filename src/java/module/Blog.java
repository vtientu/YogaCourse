/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Blog {

    private int blogID;
    private Date publishedDate;
    private String title;
    private String content;
    private int status;
    private String image;
    private Account createBy;

    public Blog() {
    }

    public Blog(int blogID, Date publishedDate, String title, String content, int status, String image, Account createBy) {
        this.blogID = blogID;
        this.publishedDate = publishedDate;
        this.title = title;
        this.content = content;
        this.status = status;
        this.image = image;
        this.createBy = createBy;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public Date getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(Date publishedDate) {
        this.publishedDate = publishedDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Account getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Account createBy) {
        this.createBy = createBy;
    }
    
    
}
