package com.example.Mem_gen.service;

import com.example.Mem_gen.exceptions.CategoryNotFound;
import com.example.Mem_gen.exceptions.ImageNotFound;
import com.example.Mem_gen.exceptions.UserNotFound;
import com.example.Mem_gen.model.Category;
import com.example.Mem_gen.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    public List<Category> listAllCategory() {
        return categoryRepository.findAll();
    }

    public void addNewCategory(Category category){
        if(!categoryExist(category.getName())){
            categoryRepository.save(category);
        }
    }
    public void saveCategory(Category category) {
        categoryRepository.save(category);
    }

    public Category getCategory(Integer id) {
        return categoryRepository.findById(id).orElseThrow(() -> new CategoryNotFound(id));
    }

    public void deleteCategory(Integer id) {
        boolean success = true;
        try {
            categoryRepository.findById(id).orElseThrow(() -> new CategoryNotFound(id));
        }catch(CategoryNotFound ex){
            success = false;
        }
        if(success){
            categoryRepository.deleteById(id);
        }else{
            throw new CategoryNotFound(id);
        }
    }

    public boolean categoryExist(String name){
        return categoryRepository.findByName(name) != null;
    }
}
