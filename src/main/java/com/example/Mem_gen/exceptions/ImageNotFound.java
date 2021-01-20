package com.example.Mem_gen.exceptions;

public class ImageNotFound extends  RuntimeException{
    public ImageNotFound(int id){
        super("Nie znaleziono danego obrazu! id: "+id);
    }
}
