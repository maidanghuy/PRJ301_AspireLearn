/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import util.CheckRole;
import util.Pagination;

/**
 *
 * @author macbookpro
 */
@WebServlet("/dashboard/courses")
public class CourseManagementServlet extends HttpServlet {

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
            out.println("<title>Servlet CourseManagementServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseManagementServlet at " + request.getContextPath() + "</h1>");
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
    int check = CheckRole.checkRole(request, response);
    if (check == -1) {
        response.sendRedirect(request.getContextPath() + "/auth/login");
        return;
    } else if (check == 1) {
        response.sendRedirect(request.getContextPath() + "/view/home");
        return;
    }

    // Lấy tham số phân trang và tìm kiếm từ request
    int pageSize = Pagination.getPageSize(request, 15); // Default 15
    int currentPage = Pagination.getCurrentPage(request, 1); // Default 1
    String search = request.getParameter("search");
    String levelFilter = request.getParameter("levelFilter");

    // Tính toán offset cho database
    int offset = (currentPage - 1) * pageSize;

    // Khởi tạo DAO
    CourseDAO courseDAO = new CourseDAO();

    // Lấy tổng số khóa học có thể có tìm kiếm và lọc theo level
    int totalCourses = courseDAO.getTotalCourses(search, levelFilter);

    // Tính tổng số trang
    int totalPages = (int) Math.ceil((double) totalCourses / pageSize);

    // Lấy danh sách khóa học theo bộ lọc
    ArrayList<Course> courses = courseDAO.getCourses(offset, pageSize, search, levelFilter);

    // Set attributes cho JSP
    request.setAttribute("courses", courses);
    request.setAttribute("currentPage", currentPage);
    request.setAttribute("totalPages", totalPages);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("totalCourses", totalCourses);
    request.setAttribute("search", search);
    request.setAttribute("levelFilter", levelFilter);

    // Forward đến trang JSP
    request.getRequestDispatcher("/views/admin/courses.jsp").forward(request, response);
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
