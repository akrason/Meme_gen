package com.example.Mem_gen.controller;

import com.example.Mem_gen.model.Image;
import com.example.Mem_gen.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Random;

@RestController
@RequestMapping("/api/images")
public class ImageController {
    @Autowired
    ImageService imageService;

    @GetMapping("")
    public List<Image> list() {
        return imageService.listAllImage();
    }

    @GetMapping("/category{id}")
    public List<Image> categoryImages(@PathVariable Integer id){
        List<Image> images=imageService.listAllImage();
        List<Image> cimages = new ArrayList<>();
        for(Image i:images){
            if(i.getCategory().getId()==id){
                cimages.add(i);
            }
        }
        return cimages;
    }
    @GetMapping("/random")
    public ResponseEntity<Image> random() {
        Random rand = new Random();
        List<Image> images=imageService.listAllImage();
        int id = rand.nextInt(images.size());
        try {
            Image image = imageService.getImage(id);
            return new ResponseEntity<Image>(image, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<Image>(HttpStatus.NOT_FOUND);
        }
    }
    @GetMapping("/{id}")
    public ResponseEntity<Image> get(@PathVariable Integer id) {
        try {
            Image image = imageService.getImage(id);
            return new ResponseEntity<Image>(image, HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<Image>(HttpStatus.NOT_FOUND);
        }
    }
    @PostMapping("/")
    public void add(@RequestBody Image image) {
        imageService.saveImage(image);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> update(@RequestBody Image image, @PathVariable Integer id) {
        try {
            Image existImage = imageService.getImage(id);
            existImage.setCategory(image.getCategory());
            existImage.setTag(image.getTag());
            imageService.saveImage(image);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (NoSuchElementException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Integer id) {

        imageService.deleteImage(id);
    }
}

