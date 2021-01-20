package com.example.Mem_gen.exceptions;

public class UserNotFound extends RuntimeException{
    public UserNotFound(){
        super("Nie znaleziono użytkownika!");
    }
}
