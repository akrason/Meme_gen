package com.example.Mem_gen.service;

import com.example.Mem_gen.exceptions.ImageNotFound;

import com.example.Mem_gen.model.Image;
import com.example.Mem_gen.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;
    public List<Image> listAllImage() {
        return imageRepository.findAll();
    }

    public void saveImage(Image image) {
        imageRepository.save(image);
    }

    public Image getImage(Integer id) {
        return imageRepository.findById(id).orElseThrow(() -> new ImageNotFound(id));
    }

    public void deleteImage(Integer id) {
        boolean success = true;
        try {
            imageRepository.findById(id).orElseThrow(() -> new ImageNotFound(id));
        }catch(ImageNotFound ex){
            success = false;
        }
        if(success){
            imageRepository.deleteById(id);
        }else{
            throw new ImageNotFound(id);
        }
    }
}
