package com.edumanage.servlet;

import com.edumanage.dao.StudentCourseDAO;
import com.edumanage.model.StudentCourse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/enrolled-students")
public class EnrolledStudentsServlet extends HttpServlet {
    private StudentCourseDAO studentCourseDAO = new StudentCourseDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<StudentCourse> enrolledStudents = studentCourseDAO.readAll();
            request.setAttribute("enrolledStudents", enrolledStudents);
            request.getRequestDispatcher("/WEB-INF/views/enrolled-students.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving enrolled students", e);
        }
    }
}