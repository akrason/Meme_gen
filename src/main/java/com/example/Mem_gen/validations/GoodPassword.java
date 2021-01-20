package com.example.Mem_gen.validations;
import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
@Target({TYPE, FIELD, ANNOTATION_TYPE})
@Retention(RUNTIME)
@Constraint(validatedBy = PasswordValidator.class)
@Documented
public @interface GoodPassword {
    String message() default "Password must contain A-Z,a-z and 0-9";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}