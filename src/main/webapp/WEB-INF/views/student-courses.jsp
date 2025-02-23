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
        :root {
            --primary: #6366f1;
            --secondary: #4f46e5;
            --success: #22c55e;
            --info: #3b82f6;
            --warning: #f59e0b;
            --dark: #1e293b;
            --light: #f8fafc;
        }

        body {
            background: linear-gradient(135deg, var(--light) 0%, #e2e8f0 100%);
            min-height: 100vh;
            font-family: system-ui, -apple-system, sans-serif;
        }

        .form-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2.5rem;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-5px);
        }

        .back-button {
            margin-bottom: 30px;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, var(--dark), #334155);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
        }

        .back-button:hover {
            transform: translateX(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .page-title {
            color: var(--dark);
            font-weight: 800;
            font-size: 2rem;
            margin-bottom: 2rem;
            text-align: center;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-label {
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.75rem;
        }

        .select-wrapper {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-select {
            border-radius: 12px;
            padding: 0.75rem;
            border: 1px solid rgba(99, 102, 241, 0.2);
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }

        .select-wrapper i {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            pointer-events: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border: none;
            padding: 0.75rem 2rem;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .alert {
            border-radius: 12px;
            border: none;
            padding: 1rem;
            margin-bottom: 2rem;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }

        .alert-danger {
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.1), rgba(220, 38, 38, 0.2));
            color: #dc2626;
        }

        .alert-success {
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.1), rgba(34, 197, 94, 0.2));
            color: var(--success);
        }

        .current-enrollments {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(99, 102, 241, 0.2);
        }

        .enrollment-table {
            border-radius: 20px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }

        .enrollment-table thead {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
        }

        .enrollment-table th {
            font-weight: 600;
            padding: 1.25rem 1rem;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 0.5px;
        }

        .enrollment-table td {
            padding: 1rem;
            color: var(--dark);
        }

        .enrollment-table tbody tr {
            transition: all 0.3s ease;
        }

        .enrollment-table tbody tr:hover {
            background-color: rgba(99, 102, 241, 0.05);
            transform: translateY(-2px);
        }

        .btn-unenroll {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-unenroll:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(220, 38, 38, 0.2);
        }

        @media (max-width: 768px) {
            .container { padding: 1rem; }
            .form-container { padding: 1.5rem; }
            .page-title { font-size: 1.5rem; }
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