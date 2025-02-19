package com.edumanage.servlet;

import com.edumanage.dao.CourseDAO;
import com.edumanage.model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/courses/*")
public class CourseServlet extends HttpServlet {
    private CourseDAO courseDAO = new CourseDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setAttribute("courses", courseDAO.readAll());
            request.getRequestDispatcher("/WEB-INF/views/courses.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving courses", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if ("create".equals(action)) {
                Course course = new Course();
                course.setName(request.getParameter("name"));
                course.setDescription(request.getParameter("description"));
                courseDAO.create(course);
            } else if ("update".equals(action)) {
                Course course = new Course();
                course.setId(Integer.parseInt(request.getParameter("id")));
                course.setName(request.getParameter("name"));
                course.setDescription(request.getParameter("description"));
                courseDAO.update(course);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                courseDAO.delete(id);
            }
            response.sendRedirect(request.getContextPath() + "/courses");
        } catch (Exception e) {
            throw new ServletException("Error processing course", e);
        }
    }
}