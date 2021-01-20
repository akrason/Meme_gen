package com.example.Mem_gen.controller;

import com.example.Mem_gen.model.Category;
import com.example.Mem_gen.model.Image;
import com.example.Mem_gen.service.CategoryService;

import com.example.Mem_gen.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/api/categories")
public class CategoryController {
    @Autowired
    CategoryService categoryService;

    @GetMapping("")
    public List<Category> list() {
        return categoryService.listAllCategory();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Category> get(@PathVariable Integer id) {
        try {
            Category category = categoryService.getCategory(id);
            return new ResponseEntity<Category>(category, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<Category>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/")
    public void add(@RequestBody Category category) {
        categoryService.addNewCategory(category);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@RequestBody Category category, @PathVariable Integer id) {
        try {
            Category existCategory = categoryService.getCategory(id);
            existCategory.setName(category.getName());
            categoryService.saveCategory(existCategory);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {

        categoryService.deleteCategory(id);
    }
}