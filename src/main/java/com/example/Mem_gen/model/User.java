package com.example.Mem_gen.model;

import com.example.Mem_gen.validations.GoodPassword;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int user_id;
    @NotBlank
    private String username;
    @NotBlank
    @Length(min=8)
    @GoodPassword
    private String password;
    @Email
    private String email;

    public User() {
    }

    public User(int id, @NotBlank String login,@NotBlank @Length(min=8,max=30)String password,@Email String mail) {
        this.user_id = id;
        this.username = login;
        this.password = password;
        this.email=mail;
    }


    public void setId(int user_id) {
        this.user_id = user_id;
    }

    public int getId() {
        return user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
