package com.example.Mem_gen;

import com.example.Mem_gen.validations.PasswordMatchesValidator;
import com.example.Mem_gen.validations.PasswordValidator;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

@SpringBootTest
public class Validators {
    @ParameterizedTest(name = "#{index} - Run test with password = {0}")
    @MethodSource("validPasswordProvider")
    void test_password_regex_valid(String password) {
        assertTrue(PasswordValidator.validatePassword(password));
    }

    @ParameterizedTest(name = "#{index} - Run test with password = {0}")
    @MethodSource("invalidPasswordProvider")
    void test_password_regex_invalid(String password) {
        assertFalse(PasswordValidator.validatePassword(password));
    }

    @Test
    void test_password_match_valid() {
        String password = "olaaa";
        String password2 = "olaaa";
        assertTrue(PasswordMatchesValidator.validatePassword(password,password2));
    }

    @Test
    void test_password_match_invalid() {
        String password = "olaaa";
        String password2 = "olaa1234a";
        assertFalse(PasswordMatchesValidator.validatePassword(password,password2));
    }


    static Stream<String> validPasswordProvider() {
        return Stream.of(
                "AAAbbbccc@123",
                "Helloworld$123",
                "A!@#&()–a1",
                "A[{}]:;',?/*a1",
                "A~$^+=<>a1",
                "0123456789$abcdefgAB",
                "123Aa$Aa"
        );
    }

    static Stream<String> invalidPasswordProvider() {
        return Stream.of(
                "12345678",
                "abcdefgh",
                "ABCDEFGH",
                "abc123$$$",
                "ABC123$$$",
                "ABC$$$$$$",
                "java REGEX 123",
                "java REGEX 123 %",
                "________",
                "--------",
                " ",
                "");
    }




}

