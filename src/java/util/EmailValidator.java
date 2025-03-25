/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import constant.IGetProspect;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 *
 * @author macbookpro
 */
public class EmailValidator {

    public static boolean checkEmail(String email) {
        String apiUrl = "https://api.getprospect.com/public/v1/email/verify?email=" + email + "&apiKey=" + IGetProspect.API_KEY;

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/json");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder responseStr = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                responseStr.append(inputLine);
            }
            in.close();

            return responseStr.toString().contains("\"status\":\"valid\"");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static void main(String[] args) {
        String email = "mai12333122@gmail.com";
        if (checkEmail(email)) {
            System.out.println(email + " là email hợp lệ!");
        } else {
            System.out.println(email + " không tồn tại hoặc không hợp lệ!");
        }
    }
}
