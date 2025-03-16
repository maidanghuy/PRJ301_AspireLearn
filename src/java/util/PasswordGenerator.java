/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author macbookpro
 */
import java.security.SecureRandom;
import java.util.UUID;

public class PasswordGenerator {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$%^&*";
    private static final SecureRandom random = new SecureRandom();

    // Phương thức tạo password bằng UUID
    public static String generateUUIDPassword(int length) {
        return UUID.randomUUID().toString().replace("-", "").substring(0, length);
    }

    // Phương thức tạo password bằng SecureRandom
    public static String generateSecureRandomPassword(int length) {
        StringBuilder password = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(CHARACTERS.length());
            password.append(CHARACTERS.charAt(index));
        }
        return password.toString();
    }

    public static void main(String[] args) {
        System.out.println("UUID Password: " + generateUUIDPassword(12));
        System.out.println("SecureRandom Password: " + generateSecureRandomPassword(12));
    }
}

