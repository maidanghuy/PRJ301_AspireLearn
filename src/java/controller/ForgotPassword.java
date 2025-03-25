/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static constant.IEmail.senderEmail;
import static constant.IEmail.senderPassword;
import dao.UserDAO;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Base64;
import java.util.Properties;
import jakarta.activation.DataHandler;

/**
 *
 * @author macbookpro
 */
public class ForgotPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String email = request.getParameter("email");

        UserDAO udao = new UserDAO();
        if (!udao.isEmailExists(email, null)) {
            response.getWriter().write("Email không tồn tại!");
            return;
        }

        // Mã hóa email để tránh lỗi URL
        String encodedEmail = Base64.getUrlEncoder().encodeToString(email.getBytes());
        String resetLink = "http://localhost:8080/AspireLearn/views/auth/resetpassword.jsp?email=" + encodedEmail;

        // Gửi email
        // Nội dung HTML của email
        String htmlContent = "<html>"
                + "<body>"
                + "<h2>Đặt lại mật khẩu</h2>"
                + "<p>Nhấn vào nút bên dưới để đặt lại mật khẩu của bạn:</p>"
                + "<a href='" + resetLink + "' "
                + "style='display: inline-block; padding: 10px 20px; color: white; background-color: #007bff; text-decoration: none; border-radius: 5px;'>Đặt lại mật khẩu</a>"
                + "<p>Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>"
                + "</body>"
                + "</html>";
        boolean isSent = sendEmail(email, "Đặt lại mật khẩu", "Nhấn vào link sau để đặt lại mật khẩu: " + htmlContent);

        response.setContentType("text/plain;charset=UTF-8");
        if (isSent) {
            response.getWriter().write("Vui lòng kiểm tra email để đặt lại mật khẩu!");
        } else {
            response.getWriter().write("Gửi email thất bại! Vui lòng thử lại.");
        }
    }

    public static boolean sendEmail(String recipient, String subject, String htmlContent) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject(subject);

            // Gửi email dưới dạng HTML
            message.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(message);
            System.out.println("Email sent successfully!");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
