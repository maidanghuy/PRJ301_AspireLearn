/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import dao.TestDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.util.List;
import java.util.Map;
import model.Listening;
import model.Reading;
import model.Test;

/**
 *
 * @author Asus
 */
public class SubmitServlet extends HttpServlet {

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
            out.println("<title>Servlet SubmitServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        TestDAO dao = new TestDAO();
        ReadExcel read = new ReadExcel();

        // Lấy testID từ session
        int testID = Integer.parseInt(session.getAttribute("testID").toString());
        Test test = dao.getByTestID(testID);
        String filePath = getServletContext().getRealPath("/WEB-INF/Excel/" + test.getFilePath().trim());

        // Lấy danh sách câu hỏi từ file
        List<?> questions;
        boolean isReading = test.getCategory().equalsIgnoreCase("reading");

        if (isReading) {
            questions = read.getReading(filePath);
        } else {
            questions = read.getListenning(filePath);
        }

        // Đọc JSON từ request
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        List<Map<String, String>> userAnswersJson = gson.fromJson(reader, new TypeToken<List<Map<String, String>>>() {
        }.getType());

        int score = 0;
        int totalQuestions = questions.size();

        // Tính điểm
        for (Map<String, String> answerData : userAnswersJson) {
            String questionNum = answerData.get("num");
            String userChoice = answerData.get("choice");

            if (questionNum != null && userChoice != null) {
                int questionNumber = Integer.parseInt(questionNum);

                for (Object obj : questions) {
                    if (isReading) {
                        Reading q = (Reading) obj;
                        if (q.getNum() == questionNumber && userChoice.equalsIgnoreCase(q.getCorrectAnswer())) {
                            score++;
                            break;
                        }
                    } else {
                        Listening q = (Listening) obj;
                        if (q.getNum() == questionNumber && userChoice.equalsIgnoreCase(q.getCorrectAnswer())) {
                            score++;
                            break;
                        }
                    }
                }
            }
        }
        
        session.setAttribute("score", score);
        session.setAttribute("totalQuestions", totalQuestions);

// Trả về JSON cho client
        response.sendRedirect(request.getContextPath() + "/view/viewSubmit");

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
