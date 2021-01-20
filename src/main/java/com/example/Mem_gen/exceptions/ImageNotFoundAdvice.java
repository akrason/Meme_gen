package com.example.Mem_gen.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class ImageNotFoundAdvice {
    @ResponseBody
    @ExceptionHandler(ImageNotFound.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String imageNotFoundHandler(ImageNotFound ex){
        return ex.getMessage();
    }
}
