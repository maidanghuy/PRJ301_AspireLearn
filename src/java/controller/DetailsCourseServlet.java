/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CourseDAO;
import dao.User_CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import model.Course;
import model.User;
import model.User_Course;

/**
 *
 * @author Asus
 */
public class DetailsCourseServlet extends HttpServlet {

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
            out.println("<title>Servlet DetailsCourseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailsCourseServlet at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        session.setAttribute("courseID", id);
        CourseDAO dao = new CourseDAO();
        Course course = dao.getByCourseID(id);

        String learningPathway = course.getLearningPathway(); // Chuỗi String từ DB
        Map<String, String> learningPathwayMap = new HashMap<>();

        // Tách các phần tử theo dấu ","
        String[] parts = learningPathway.split(",");
        for (String part : parts) {
            String[] keyValue = part.split(":"); // Tách key và value theo dấu ":"
            if (keyValue.length == 2) {
                String key = keyValue[0].trim(); // Tên khóa học
                String value = keyValue[1].trim(); // Nội dung khóa học
                learningPathwayMap.put(key, value);
            }
        }

        request.setAttribute("course", course);
        request.setAttribute("learningPathway", learningPathwayMap);
//        request.getRequestDispatcher("views/user/detailscourse.jsp").forward(request, response);

        //        ----------------------------
        //new
        User user = (User) request.getSession().getAttribute("user");
        int userID = user.getUserID();
//        int coureID = (int) request.getSession().getAttribute("coureID");
        User_CourseDAO ucDao = new User_CourseDAO();
        User_Course uc = ucDao.getUser_CourseByID(userID, id);
        if (uc.getProgress() != null) {
            request.getRequestDispatcher("LessonServlet").forward(request, response);
        } else {
            request.getRequestDispatcher("views/user/detailscourse.jsp").forward(request, response);
        }
//        ----------------------------

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
