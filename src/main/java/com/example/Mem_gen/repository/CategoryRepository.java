package com.example.Mem_gen.repository;

import com.example.Mem_gen.model.Category;
import com.example.Mem_gen.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    Category findByName(String name);
}
