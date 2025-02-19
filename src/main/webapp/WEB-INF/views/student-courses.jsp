<%@ page import="com.edumanage.model.Course" %>
<%@ page import="java.util.List" %>
<%@ page import="com.edumanage.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduManage - Enroll Student in Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
        }

        .form-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2.5rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .back-button {
            margin-bottom: 30px;
            transition: all 0.3s ease;
        }

        .back-button:hover {
            transform: translateX(-5px);
        }

        .form-label {
            font-weight: 600;
            color: #344767;
            margin-bottom: 0.5rem;
        }

        .form-select {
            border-radius: 10px;
            padding: 0.75rem;
            border: 1px solid #e9ecef;
            transition: all 0.2s ease;
        }

        .form-select:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.1);
        }

        .btn-primary {
            padding: 0.75rem 2rem;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.2);
        }

        .alert {
            border-radius: 10px;
            border: none;
            padding: 1rem;
            margin-bottom: 2rem;
        }

        .alert-danger {
            background-color: #fff5f5;
            color: #dc3545;
            border-left: 4px solid #dc3545;
        }

        .alert-success {
            background-color: #f6fff8;
            color: #198754;
            border-left: 4px solid #198754;
        }

        .page-title {
            color: #344767;
            font-weight: 600;
            margin-bottom: 2rem;
        }

        .page-title i {
            color: #0d6efd;
            margin-right: 0.5rem;
        }

        .select-wrapper {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .select-wrapper i {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            pointer-events: none;
        }

        .current-enrollments {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid #e9ecef;
        }

        .enrollment-table {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }

        .enrollment-table thead {
            background-color: #0d6efd;
            color: white;
        }

        .enrollment-table th {
            font-weight: 500;
            padding: 1rem;
        }

        .enrollment-table td {
            padding: 1rem;
            vertical-align: middle;
        }

        .btn-unenroll {
            padding: 0.4rem 1rem;
            border-radius: 8px;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary back-button">
        <i class="fas fa-arrow-left me-2"></i> Back to Dashboard
    </a>

    <div class="form-container">
        <h2 class="text-center page-title">
            <i class="fas fa-user-graduate"></i> Enroll Student in Courses
        </h2>

        <%-- Messages --%>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger">
            <i class="fas fa-exclamation-circle me-2"></i>
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <% if (request.getAttribute("success") != null) { %>
        <div class="alert alert-success">
            <i class="fas fa-check-circle me-2"></i>
            <%= request.getAttribute("success") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/student-courses" method="post" class="needs-validation" novalidate>
            <div class="select-wrapper">
                <label for="studentId" class="form-label">Select Student</label>
                <select class="form-select" id="studentId" name="studentId" required>
                    <option value="">-- Select a Student --</option>
                    <%
                        List<Student> students = (List<Student>) request.getAttribute("students");
                        for (Student student : students) {
                    %>
                    <option value="<%= student.getId() %>">
                        <%= student.getFirstName() %> <%= student.getLastName() %>
                    </option>
                    <%
                        }
                    %>
                </select>
                <i class="fas fa-user"></i>
                <div class="invalid-feedback">Please select a student</div>
            </div>

            <div class="select-wrapper">
                <label for="courseId" class="form-label">Select Course</label>
                <select class="form-select" id="courseId" name="courseId" required>
                    <option value="">-- Select a Course --</option>
                    <%
                        List<Course> courses = (List<Course>) request.getAttribute("courses");
                        for (Course course : courses) {
                    %>
                    <option value="<%= course.getId() %>"><%= course.getName() %></option>
                    <%
                        }
                    %>
                </select>
                <i class="fas fa-book"></i>
                <div class="invalid-feedback">Please select a course</div>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-user-plus me-2"></i> Enroll Student
                </button>
            </div>
        </form>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.from(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()

    // Auto-hide alerts after 5 seconds
    setTimeout(function() {
        var alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            new bootstrap.Alert(alert).close();
        });
    }, 5000);

    // Dynamic enrollment loading
    document.getElementById('studentId').addEventListener('change', function() {
        const studentId = this.value;
        if (studentId) {
            // Here you would typically make an AJAX call to load the student's enrollments
            // and update the enrollment table
            console.log('Loading enrollments for student:', studentId);
        }
    });
</script>
</body>
</html>