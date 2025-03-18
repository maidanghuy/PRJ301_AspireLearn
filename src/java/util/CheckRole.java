/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author macbookpro
 */
public class CheckRole {
    
    public static int checkRole(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        // Kiểm tra session có user không
        Object userObj = session.getAttribute("user");

        if (userObj == null) {
            return -1; // user null
        }

        // Ép kiểu userObj về kiểu User (giả sử có class User)
        User user = (User) userObj;

        // Kiểm tra quyền admin
        if (!"Admin".equalsIgnoreCase(user.getRole())) {
            return 1; //user
        }
        return 0; // admin
    }
}
