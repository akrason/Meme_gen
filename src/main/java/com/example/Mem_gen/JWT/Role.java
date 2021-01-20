package com.example.Mem_gen.JWT;

import org.springframework.security.core.GrantedAuthority;

public class Role implements GrantedAuthority {
    String role;
    public Role(String s){
        role=s;
    }

    @Override
    public String getAuthority() {
        return role;
    }
}
