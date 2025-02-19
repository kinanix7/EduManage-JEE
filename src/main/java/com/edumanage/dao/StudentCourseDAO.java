package com.edumanage.dao;

import com.edumanage.model.StudentCourse;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentCourseDAO {
    public List<StudentCourse> readAll() throws SQLException {
        List<StudentCourse> enrolledStudents = new ArrayList<>();
        String sql = "SELECT sc.student_id, s.first_name, s.last_name, sc.course_id, c.name " +
                "FROM student_courses sc " +
                "JOIN students s ON sc.student_id = s.id " +
                "JOIN courses c ON sc.course_id = c.id";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                StudentCourse studentCourse = new StudentCourse();
                studentCourse.setStudentId(rs.getInt("student_id"));
                studentCourse.setStudentName(rs.getString("first_name") + " " + rs.getString("last_name"));
                studentCourse.setCourseId(rs.getInt("course_id"));
                studentCourse.setCourseName(rs.getString("name"));
                enrolledStudents.add(studentCourse);
            }
        }
        return enrolledStudents;
    }
}