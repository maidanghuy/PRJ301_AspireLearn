/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Google;
import model.User;
import util.GoogleLogin;

/**
 *
 * @author macbookpro
 */
public class LoginGoogleServlet extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet LoginGoogleServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet LoginGoogleServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("error.jsp?message=Invalid+code");
            return;
        }

        System.out.println("Code: " + code);

        // Lấy access token từ Google
        String accessToken = GoogleLogin.getToken(code);
        System.out.println("Access Token: " + accessToken);

        // Lấy thông tin tài khoản Google
        Google acc = GoogleLogin.getUserInfo(accessToken);
        if (acc == null || acc.getEmail() == null) {
            response.sendRedirect("error.jsp?message=Failed+to+retrieve+Google+account");
            return;
        }

        // Xử lý đăng nhập hoặc đăng ký người dùng
        UserDAO udao = new UserDAO();
        User user = udao.getUserByEmail(acc.getEmail());

        if (user == null) {  // Nếu email chưa tồn tại -> Đăng ký mới
            user = new User(acc);
            System.out.println("New User: " + user);
            udao.registerUser(user);

            // Lấy lại user sau khi đăng ký để đảm bảo dữ liệu đầy đủ
            user = udao.getUserByEmail(acc.getEmail());
        } else {
            System.out.println("Existing User: " + user);
        }

        // Lưu thông tin vào session
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

//        // check xem dung khong
//        if (user.getUsername() != null) {
//            Cookie userCookie = new Cookie("username", user.getUsername());
//            userCookie.setMaxAge(60 * 60 * 24 * 90); // 90 ngày
//            userCookie.setPath("/"); // Đảm bảo cookie áp dụng cho toàn bộ ứng dụng
//
//            // Thêm cookie vào response
//            response.addCookie(userCookie);
//
//        }
        // Chuyển hướng đến trang chính
        response.sendRedirect(request.getContextPath() + "/view/home");
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
        processRequest(request, response);
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
