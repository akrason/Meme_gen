package com.example.Mem_gen.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "category")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int category_id;
    String name;
    @OneToMany(mappedBy="category",cascade={CascadeType.ALL})
    private List<Image> memy=new ArrayList<>();

    public Category(){}
    public Category(String name){
        this.name=name;
    }

    public void addImage(Image meme){
        memy.add(meme);
    }

    public void setId(int category_id) {
        this.category_id = category_id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public int getId() {
        return category_id;
    }
}
