/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author macbookpro
 */
public class DivideServlet extends HttpServlet {

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
            out.println("<title>Servlet DivideServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DivideServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        String action = String.valueOf(request.getParameter("action"));

        switch (action) {
            case "login" -> {
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
                break;
            }
            case "logout" -> {
                resetInfo(request, response);
                request.getSession(true).setAttribute("logoutMessage", "Bạn đã đăng xuất thành công!");
                // Chuyển hướng sau khi logout
                response.sendRedirect("view/home");
                break;
            }           
            case "register" -> {
                request.getRequestDispatcher("views/auth/register.jsp").forward(request, response);
                break;
            }
            case "viewhome" -> {
                request.getRequestDispatcher("views/home.jsp").forward(request, response);
                break;
            }
            case "viewmaterial" -> {
                break;
            }
            case "viewcourse" -> {
                break;
            }
            case "viewtest" -> {
                break;
            }
            case "viewaccount" -> {
                break;
            }
            default -> {
                request.getRequestDispatcher("view/learningpage.jsp").forward(request, response);
                break;
            }
        }
    }

    public void resetInfo(HttpServletRequest request, HttpServletResponse response) {
        if (request.getSession(false) != null) {
            // Hủy session hiện tại
            request.getSession().invalidate();
        }

        // Xóa tất cả cookie liên quan
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0); // Đặt thời gian sống về 0 để xóa
                cookie.setPath("/"); // Áp dụng cho toàn bộ domain
                response.addCookie(cookie);
            }
        }
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
        String action = String.valueOf(request.getParameter("formName"));

        switch (action) {
            case "login" -> {
                getUserForLogin(request, response);
            }
            case "register" -> {
//                getUserForRegister(request, response);
            }
            case "editAccount" -> {
//                editAccount(request, response);
//                processRequest(request, response);
            }
            case "updateCustomer" -> {
            }
            case "createCustomer" -> {
            }
            default -> {
            }
        }
    }

    public void getUserForLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO udao = new UserDAO();
        User user = udao.getUser(username, password);

        if (user != null) {
            // Tạo session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Tạo cookie lưu trong 3 tháng
//            Cookie userCookie = new Cookie("username", username);
//            userCookie.setMaxAge(60 * 60 * 24 * 90); // 90 ngày
//            response.addCookie(userCookie);
            // Chuyển hướng đến trang chính
            response.sendRedirect("view/home");
        } else {
            // Đăng nhập thất bại, chuyển hướng về trang login với thông báo lỗi
//            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getSession().setAttribute("error", "Sai tài khoản hoặc mật khẩu!");

            response.sendRedirect("auth/login");

//            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
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
