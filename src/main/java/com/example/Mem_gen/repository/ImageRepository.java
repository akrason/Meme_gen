package com.example.Mem_gen.repository;

import com.example.Mem_gen.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image, Integer> {
}
