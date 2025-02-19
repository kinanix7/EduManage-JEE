package com.edumanage.servlet;

import com.edumanage.dao.CourseDAO;
import com.edumanage.dao.DatabaseConnection;
import com.edumanage.dao.StudentDAO;
import com.edumanage.model.Course;
import com.edumanage.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/student-courses/*")
public class StudentCourseServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();
    private CourseDAO courseDAO = new CourseDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Student> students = studentDAO.readAll();
            List<Course> courses = courseDAO.readAll();
            request.setAttribute("students", students);
            request.setAttribute("courses", courses);
            request.getRequestDispatcher("/WEB-INF/views/student-courses.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Error retrieving student courses", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int studentId = Integer.parseInt(request.getParameter("studentId"));
            int courseId = Integer.parseInt(request.getParameter("courseId"));

            // Check if the student is already enrolled in the course
            if (isEnrolled(studentId, courseId)) {
                request.setAttribute("error", "Student is already enrolled in this course.");
                doGet(request, response);
                return;
            }

            // Enroll the student in the course
            String sql = "INSERT INTO student_courses (student_id, course_id) VALUES (?, ?)";
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, studentId);
                stmt.setInt(2, courseId);
                stmt.executeUpdate();
            }

            response.sendRedirect(request.getContextPath() + "/student-courses");
        } catch (Exception e) {
            throw new ServletException("Error processing student course enrollment", e);
        }
    }

    private boolean isEnrolled(int studentId, int courseId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM student_courses WHERE student_id = ? AND course_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }
}