package com.example.Mem_gen.model;

import javax.persistence.*;

@Entity
@Table(name = "image")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int meme_id;
    String tag;
    String address;
    String name;
    @ManyToOne
    @JoinColumn(name="categoryId", nullable=false)
    private Category category;

    public Image(){}

    public Image(String tag,String address, String name){
        this.tag=tag;
        this.address=address;
        this.name=name;
    }

    public int getId() { return meme_id; }
    public void setId(int meme_id) { this.meme_id = meme_id; }

    public Category getCategory() {
        return category;
    }

    public String getAddress() {
        return address;
    }

    public String getName() {
        return name;
    }

    public String getTag() {
        return tag;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }
}
