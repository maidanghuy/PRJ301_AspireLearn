
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import jakarta.activation.DataHandler;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author macbookpro
 */
public class SendEmail {
//    public static void sendEmail(String recipient, String subject, String content) {
//
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", "587");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//
//        Session session = Session.getInstance(props, new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(senderEmail, senderPassword);
//            }
//        });
//
//        try {
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(senderEmail));
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
//            message.setSubject(subject);
//            message.setText(content);
//
//            Transport.send(message);
//            System.out.println("Email sent successfully!");
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
//    }
    
    public static void main(String[] args) {
        String recipient = "maidanghuy1212@gmail.com";  // Thay bằng email người nhận
        String subject = "Test Email";
        String content = "Đây là email thử nghiệm gửi từ Java.";

//        SendEmail.sendEmail(recipient, subject, content);
    }
}
