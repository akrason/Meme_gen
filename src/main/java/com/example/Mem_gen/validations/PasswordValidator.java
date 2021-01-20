package com.example.Mem_gen.validations;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PasswordValidator implements ConstraintValidator<GoodPassword, String> {
    private static final String PASSWORD_PATTERN =
            "^(?!.*\\s)(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";

    private static final Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
    @Override
    public void initialize(GoodPassword constraintAnnotation) {
    }
    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        return validatePassword(s);
    }

    public static boolean validatePassword(String password){
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }
}
