/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CourseDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Course;
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        // processRequest(request, response);
        String action = String.valueOf(request.getParameter("action"));

        switch (action) {
            case "login" -> {
                request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
                break;
            }
            case "logingoogle" -> {
                request.getRequestDispatcher("LoginGoogleServlet").forward(request, response);
//                processRequest(request, response);
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
            
            case "editaccount" -> {
                request.getRequestDispatcher("views/auth/editAccount.jsp").forward(request, response);
                break;
            }
            case "viewhome" -> {
                request.getRequestDispatcher("views/home.jsp").forward(request, response);
                break;
            }
            case "viewmaterial" -> {
                request.getRequestDispatcher("/MaterialServlet").forward(request, response);
                break;
            }
            case "viewcourse" -> {
                request.getRequestDispatcher("/CourseServlet").forward(request, response);
                break;
            }
            case "viewdetailscourse" -> {
                int courseId = Integer.parseInt(request.getParameter("id"));
                request.getRequestDispatcher("/DetailsCourseServlet?id=" + courseId).forward(request, response);
                break;
            }
            case "viewtest" -> {
                request.getRequestDispatcher("/TestServlet").forward(request, response);
                break;
            }
            case "viewaccount" -> {

                CourseDAO cdao = new CourseDAO();

                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("user");
                ArrayList<Course> listCourseOrder = cdao.getUserCourses(user.getUserID());
                request.setAttribute("listCourseOrder", listCourseOrder);
                request.getRequestDispatcher("views/user/account.jsp").forward(request, response);
                break;
            }
            case "lesson" -> {
                HttpSession session = request.getSession();
                int courseID = (Integer) session.getAttribute("courseID");
                Course c = (Course) session.getAttribute("course");
                System.out.println(c);
                request.getRequestDispatcher("/LessonServlet?id=" + courseID).forward(request, response);
            }
            case "adminusers" -> {
//                UserDAO udao = new UserDAO();
//                ArrayList<User> users = udao.getAllUsers();
//                HttpSession session = request.getSession();
//                session.setAttribute("users", users);
                request.getRequestDispatcher("/dashboard/users").forward(request, response);
                break;
            }
            case "admincourses" -> {
//                UserDAO udao = new UserDAO();
//                ArrayList<User> users = udao.getAllUsers();
//                HttpSession session = request.getSession();
//                session.setAttribute("users", users);
//                response.sendRedirect("views/admin/courses.jsp");
                request.getRequestDispatcher("/dashboard/courses").forward(request, response);
                break;
            }
            default -> {
                request.getRequestDispatcher("views/home.jsp").forward(request, response);
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
        // processRequest(request, response);
        String action = String.valueOf(request.getParameter("formName"));

        switch (action) {
            case "login" -> {
                getUserForLogin(request, response);
            }
            case "register" -> {
                getUserForRegister(request, response);
            }
            case "editAccount" -> {
                editAccount(request, response);
                // processRequest(request, response);
            }
            case "banAccount" -> {
                banAccount(request, response);
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

            // Kiểm tra role của user
            if ("Admin".equals(user.getRole())) {
                response.sendRedirect("dashboard"); // Chuyển hướng đến dashboard nếu là giáo viên
            } else {
                response.sendRedirect("view/home"); // Chuyển hướng đến trang chính nếu không phải giáo viên
            }
        } else {
            request.getSession().setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            response.sendRedirect("auth/login");
        }

    }

    public void getUserForRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String role = "Student"; // Mặc định là học viên
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String email = request.getParameter("email");
            String dateOfBirthStr = request.getParameter("dateOfBirth");

            // Kiểm tra nếu username đã tồn tại
            UserDAO userDAO = new UserDAO();
            if (userDAO.isUsernameExists(username, null)) {
                request.getSession().setAttribute("error", "Tên đăng nhập đã tồn tại! Vui lòng chọn tên khác.");
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("dateOfBirth", dateOfBirthStr);
                response.sendRedirect("auth/register");
                return;
            }

            // Kiểm tra xác nhận mật khẩu
            userDAO = new UserDAO();
            if (!password.equals(confirmPassword)) {
                request.getSession().setAttribute("error", "Mật khẩu xác nhận không khớp! Vui lòng nhập lại.");
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("dateOfBirth", dateOfBirthStr);
                response.sendRedirect("auth/register");
                return;
            }

            // Kiểm tra email đã tồn tại chưa
            userDAO = new UserDAO();
            if (userDAO.isEmailExists(email, null)) {
                request.getSession().setAttribute("error", "Email đã được sử dụng! Vui lòng chọn email khác.");
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("dateOfBirth", dateOfBirthStr);
                response.sendRedirect("auth/register");
                return;
            }

            // Kiểm tra ngày sinh
            userDAO = new UserDAO();
            Date dateOfBirth = null;
            if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
                dateOfBirth = Date.valueOf(dateOfBirthStr);

                // Lấy ngày hiện tại
                LocalDate today = LocalDate.now();
                if (dateOfBirth.toLocalDate().isAfter(today)) {
                    request.getSession().setAttribute("error", "Ngày sinh không hợp lệ! Phải nhỏ hơn ngày hiện tại.");
                    request.getSession().setAttribute("username", username);
                    request.getSession().setAttribute("email", email);
                    request.getSession().setAttribute("dateOfBirth", dateOfBirthStr);
                    response.sendRedirect("auth/register");
                    return;
                }
            }

            // Trạng thái mặc định là "Active"
            String status = "Active";

            // Tạo user mới
            User newUser = new User(role, username, password, email, dateOfBirth, status);

            // Đăng ký user
            userDAO = new UserDAO();
            boolean isRegistered = userDAO.registerUser(newUser);

            if (isRegistered) {
                request.getSession().setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
                response.sendRedirect("auth/login");
            } else {
                request.getSession().setAttribute("error", "Đăng ký thất bại! Vui lòng thử lại.");
                request.getSession().setAttribute("username", username);
                request.getSession().setAttribute("email", email);
                request.getSession().setAttribute("dateOfBirth", dateOfBirthStr);
                response.sendRedirect("auth/register");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("error", "Lỗi hệ thống, vui lòng thử lại sau!");
            request.getSession().setAttribute("username", request.getParameter("username"));
            request.getSession().setAttribute("email", request.getParameter("email"));
            request.getSession().setAttribute("dateOfBirth", request.getParameter("dateOfBirth"));
            response.sendRedirect("auth/register");
        }
    }

    public void editAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String formType = request.getParameter("formType");

        switch (formType) {
            case "userUpdate" ->
                userEdit(request, response);
            case "adminUpdate" ->
                adminEdit(request, response);
//            System.out.println("test");
            default ->
                response.sendRedirect("/view/home");
        }
    }

    public void userEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        // Nhận dữ liệu từ form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String dateOfBirthStr = request.getParameter("dateOfBirth");

        // Kiểm tra username đã tồn tại chưa
        UserDAO userDAO = new UserDAO();
        if (userDAO.isEmailExists(username, user.getUserID())) {
            request.getSession().setAttribute("error", " đã được sử dụng! Vui lòng chọn username khác.");
            response.sendRedirect("edit/account");
            return;
        } else {
            user.setUsername(username);
        }

        // Kiểm tra email đã tồn tại chưa
        userDAO = new UserDAO();
        if (userDAO.isEmailExists(email, user.getUserID())) {
            request.getSession().setAttribute("error", "Email đã được sử dụng! Vui lòng chọn email khác.");
            response.sendRedirect("edit/account");
            return;
        } else {
            user.setEmail(email);
        }

        // Kiểm tra ngày sinh
        userDAO = new UserDAO();
        Date dateOfBirth = null;
        if (dateOfBirthStr != null && !dateOfBirthStr.isEmpty()) {
            dateOfBirth = Date.valueOf(dateOfBirthStr);

            // Lấy ngày hiện tại
            LocalDate today = LocalDate.now();
            if (dateOfBirth.toLocalDate().isAfter(today)) {
                request.getSession().setAttribute("error", "Ngày sinh không hợp lệ! Phải nhỏ hơn ngày hiện tại.");
                response.sendRedirect("edit/account");
                return;
            }
            user.setDateOfBirth(dateOfBirth);
        }

        // Kiểm tra mật khẩu cũ đúng không
        if (currentPassword != null && !currentPassword.isEmpty()) {
            if (!user.getPassword().equals(currentPassword)) {
                request.getSession().setAttribute("error", "Mật khẩu hiện tại chưa chính xác!");
                response.sendRedirect("edit/account");
                return;
            }
        }

        // Kiểm tra mật khẩu mới có khớp không
        if (newPassword != null && !newPassword.isEmpty()) {
            if (!newPassword.equals(confirmPassword)) {
                request.getSession().setAttribute("error", "Mật khẩu mới với mật khẩu xác nhận không khớp nhau");
                response.sendRedirect("edit/account");
                return;
            }
            user.setPassword(newPassword);
        }

        userDAO = new UserDAO();
        boolean success = userDAO.editUser(user);

        if (success) {
            userDAO = new UserDAO();
            User updatedUser = userDAO.getUser(username, newPassword);
            session.setAttribute("user", updatedUser);
            request.getSession().setAttribute("message", "Account updated successfully!");
        } else {
            request.getSession().setAttribute("error", "Failed to update account.");
        }
        response.sendRedirect("edit/account");

    }

    public void adminEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user1 = (User) session.getAttribute("user");

        if (user1 == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        User user = new User();
        // Nhận dữ liệu từ form
        int userID = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String status = request.getParameter("status");

        // Kiểm tra username đã tồn tạic chưa
        UserDAO userDAO = new UserDAO();
        if (userDAO.isEmailExists(username, userID)) {
            request.getSession().setAttribute("error", " đã được sử dụng! Vui lòng chọn username khác.");

            response.sendRedirect("dashboard/users");
            return;
        } else {
            user.setUsername(username);
        }

        // Kiểm tra email đã tồn tại chưa
        userDAO = new UserDAO();
        if (userDAO.isEmailExists(email, userID)) {
            request.getSession().setAttribute("error", "Email đã được sử dụng! Vui lòng chọn email khác.");
            response.sendRedirect("dashboard/users");
            return;
        } else {
            user.setEmail(email);
        }

        user.setUserID(userID);
        user.setPassword(password);
        user.setRole(role);
        user.setStatus(status);

        userDAO = new UserDAO();
        boolean success = userDAO.editUserForAdmin(user);

        if (success) {

            request.getSession().setAttribute("message", "Account with ID " + userID + " updated successfully!");
        } else {
            request.getSession().setAttribute("error", "Failed to update account " + userID + ".");
        }

        // Chuyển hướng về trang dashboard/users
        response.sendRedirect("dashboard/users");

    }

    public void banAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User admin = (User) session.getAttribute("user");

        // Kiểm tra quyền admin trước khi cấm tài khoản
        if (admin == null || !"Admin".equals(admin.getRole())) {
            session.setAttribute("error", "Bạn không có quyền thực hiện thao tác này!");
            response.sendRedirect("dashboard/users");
            return;
        }

        try {
            int userID = Integer.parseInt(request.getParameter("id"));

            UserDAO userDAO = new UserDAO();
            boolean isBanned = userDAO.banUser(userID);
            if (isBanned) {
                session.setAttribute("message", "Account with ID " + userID + " is banned!");
            } else {
                session.setAttribute("error", "Không thể cấm tài khoản. Vui lòng thử lại!");
            }
        } catch (NumberFormatException e) {
            session.setAttribute("error", "ID tài khoản không hợp lệ!");
        }

        response.sendRedirect("dashboard/users");

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
