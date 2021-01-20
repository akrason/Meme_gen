package com.example.Mem_gen.validations;

import com.example.Mem_gen.DTO.UserDTO;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object> {

    @Override
    public void initialize(PasswordMatches constraintAnnotation) {
    }
    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext context){
        UserDTO user = (UserDTO) obj;
        return validatePassword(user.getPassword(), user.getMatchingPassword());
    }
    public static boolean validatePassword(String password, String password2){
        return password.equals(password2);
    }
}