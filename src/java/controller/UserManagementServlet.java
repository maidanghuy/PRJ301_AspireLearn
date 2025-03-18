/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;
import util.CheckRole;

/**
 *
 * @author macbookpro
 */
@WebServlet("/dashboard/users")
public class UserManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet UserManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserManagementServlet at " + request.getContextPath() + "</h1>");
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
        
        int check = CheckRole.checkRole(request, response);
        if (check == -1){
            String newPath = request.getContextPath() + "/auth/login";
            response.sendRedirect(newPath);
            return;
        }else if (check == 1){
            String newPath = request.getContextPath() + "/view/home";
            response.sendRedirect(newPath);
            return;
        }

        // Lấy tham số phân trang và tìm kiếm từ request
        int pageSize = getPageSize(request); // Default 15
        int currentPage = getCurrentPage(request); // Default 1
        String search = request.getParameter("search");
        String roleFilter = request.getParameter("roleFilter");
        String statusFilter = request.getParameter("statusFilter");

        // Tính toán offset cho database
        int offset = (currentPage - 1) * pageSize;

        // Khởi tạo DAO
        UserDAO userDAO = new UserDAO();

        // Lấy tổng số users (có thể có tìm kiếm, lọc theo role và status)
        int totalUsers = userDAO.getTotalUsers(search, roleFilter, statusFilter);

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalUsers / pageSize);

        // Lấy danh sách users theo bộ lọc
        ArrayList<User> users = userDAO.getUsers(offset, pageSize, search, roleFilter, statusFilter);

        // Set attributes cho JSP
        request.setAttribute("users", users);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("search", search);
        request.setAttribute("roleFilter", roleFilter);
        request.setAttribute("statusFilter", statusFilter);

        // Forward đến trang JSP
        request.getRequestDispatcher("/views/admin/users.jsp").forward(request, response);

    }

    private int getPageSize(HttpServletRequest request) {
        String pageSizeParam = request.getParameter("pageSize");
        if (pageSizeParam != null) {
            try {
                int size = Integer.parseInt(pageSizeParam);
                if (size == 5 || size == 15 || size == 25) {
                    return size;
                }
            } catch (NumberFormatException e) {
                // Ignore parse errors
            }
        }
        return 15; // Default page size
    }

    private int getCurrentPage(HttpServletRequest request) {
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                return Math.max((int) 1, Integer.parseInt(pageParam));
            } catch (NumberFormatException e) {
                // Ignore parse errors
            }
        }
        return 1; // Default to first page
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
