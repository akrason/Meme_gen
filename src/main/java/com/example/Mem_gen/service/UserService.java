package com.example.Mem_gen.service;

import com.example.Mem_gen.DTO.UserDTO;
import com.example.Mem_gen.exceptions.UserAlreadyExistException;
import com.example.Mem_gen.exceptions.UserNotFound;
import com.example.Mem_gen.model.User;
import com.example.Mem_gen.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class UserService{
    final ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
    final Validator validator = validatorFactory.getValidator();
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    public List<User> listAllUser() {
        return userRepository.findAll();
    }

    public void saveUser(User user) {
        List<User> list = listAllUser();
        boolean success=true;

        if(success){
            final Set<ConstraintViolation<User>> personConstraintViolations = validator.validate(user);
            if(personConstraintViolations.isEmpty()) {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
                userRepository.save(user);
            }else {
                personConstraintViolations.forEach(element -> System.out.println(element.getMessage()));
            }
        }
    }

    public void addUser(User user) {
        boolean success=emailExist(user.getEmail());
        boolean success2 = loginExist(user.getUsername());

        if(!success && !success2){
            final Set<ConstraintViolation<User>> personConstraintViolations = validator.validate(user);
            if(personConstraintViolations.isEmpty()) {
                user.setPassword(passwordEncoder.encode(user.getPassword()));
                userRepository.save(user);
            }else {
                personConstraintViolations.forEach(element -> System.out.println(element.getMessage()));
            }
        }
    }

    public User getUser(Integer id) {
        return userRepository.findById(id).orElseThrow(() -> new UserNotFound());
    }

    public void deleteUser(Integer id) {
        boolean success = true;
        try {
            userRepository.findById(id).orElseThrow(() -> new UserNotFound());
        }catch(UserNotFound ex){
            success = false;
        }
        if(success){
            userRepository.deleteById(id);
        }else{
            throw new UserNotFound();
        }
    }

    public User registerNewUserAccount(UserDTO userDto) throws UserAlreadyExistException {
        boolean success = true;
        if (emailExist(userDto.getEmail())) {
            success=false;
            throw new UserAlreadyExistException("Podany e-mail istnieje już w bazie: " +  userDto.getEmail());

        }
        if (loginExist(userDto.getLogin())) {
            success=false;
            throw new UserAlreadyExistException("Wybierz inną nazwę " +  userDto.getLogin());
        }
        if (success){
            User user = new User();
            user.setUsername(userDto.getLogin());
            user.setEmail(userDto.getEmail());
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            return user;
        }else{
            return null;
        }


    }

    public boolean correctUser(String username,String password){
        if(loginExist(username)){
            User user =userRepository.findByUsername(username);
            return passwordEncoder.matches(password,user.getPassword());
        }
        return(loginExist(username));
    }

    private boolean emailExist(String email) {
        return userRepository.findByEmail(email) != null;
    }
    private boolean loginExist(String login) {
        return userRepository.findByUsername(login) != null;
    }
}