package com.example.Mem_gen.JWT;

import java.util.ArrayList;

import com.example.Mem_gen.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class JwtUserDetailsService implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    PasswordEncoder passwordEncoder;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        ArrayList<Role> roles = new ArrayList<>();
        if ("admin".equals(username)) {
            roles.add(new Role("admin"));
            return new User("admin", "$2y$12$XZGv7M9NPV1P0pfK3k4GxekWpc40N1LJ9UGWliR4gef9khTpywah.",
                    roles);
        } else if(userRepository.findByUsername(username)!=null){
            roles.add(new Role("user"));
            return new User(username, userRepository.findByUsername(username).getPassword(),
                    roles);
        }else{
            throw new UsernameNotFoundException("Nie znaleziono użytkownika: " + username);
        }
    }
}