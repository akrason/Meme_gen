package com.example.Mem_gen.exceptions;

public class CategoryNotFound extends RuntimeException {
    public CategoryNotFound(int id){
        super("Nie znaleziono danej kategorii! id: "+id);
    }
}
