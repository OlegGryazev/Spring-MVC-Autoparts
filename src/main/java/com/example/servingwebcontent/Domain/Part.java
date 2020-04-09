package com.example.servingwebcontent.Domain;

import javax.persistence.*;


@Entity
public class Part {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;
    private String article;
    private String manufacturer;
    private String filename;

    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    public String getAuthorName(){
        return author != null ? author.getUsername() : "<none>";
    }

    public Part() {
    }

    public Part(String article, String manufacturer, User author) {
        this.author = author;
        this.article = article;
        this.manufacturer = manufacturer;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
