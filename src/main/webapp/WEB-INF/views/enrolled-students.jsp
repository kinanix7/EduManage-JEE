<%@ page import="com.edumanage.model.StudentCourse" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduManage - Enrolled Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #f8f9fa;
            --accent-color: #2c3e50;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #e4e7eb 100%);
            min-height: 100vh;
        }

        .table-container {
            background: white;
            padding: 2.5rem;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.08);
            margin-top: 2rem;
        }

        .back-button {
            margin-bottom: 25px;
            transition: transform 0.2s;
            background-color: var(--accent-color);
            border: none;
            padding: 0.6rem 1.2rem;
        }

        .back-button:hover {
            transform: translateX(-5px);
            background-color: #34495e;
        }

        .page-title {
            color: var(--accent-color);
            font-weight: 600;
            margin-bottom: 2rem;
            position: relative;
            padding-bottom: 1rem;
        }

        .page-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 2px;
        }

        .table {
            border-collapse: separate;
            border-spacing: 0;
        }

        .table th {
            background-color: var(--secondary-color);
            border-bottom: 2px solid var(--primary-color);
            color: var(--accent-color);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.9rem;
            padding: 1rem;
        }

        .table td {
            padding: 1rem;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
        }

        .table tbody tr {
            transition: all 0.2s;
        }

        .table tbody tr:hover {
            background-color: rgba(74, 144, 226, 0.05);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.03);
        }

        .icon-gradient {
            background: linear-gradient(45deg, var(--primary-color), #7cb9e8);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-right: 10px;
        }

        @media (max-width: 768px) {
            .table-container {
                padding: 1.5rem;
                margin-top: 1rem;
            }

            .table th, .table td {
                padding: 0.75rem;
            }

            .page-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary back-button">
        <i class="fas fa-arrow-left me-2"></i> Back to Dashboard
    </a>

    <div class="table-container">
        <h2 class="text-center page-title">
            <i class="fas fa-user-graduate icon-gradient"></i>
            Enrolled Students
        </h2>
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th><i class="fas fa-id-card me-2"></i>Student ID</th>
                    <th><i class="fas fa-user me-2"></i>Student Name</th>
                    <th><i class="fas fa-book me-2"></i>Course ID</th>
                    <th><i class="fas fa-graduation-cap me-2"></i>Course Name</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<StudentCourse> enrolledStudents = (List<StudentCourse>) request.getAttribute("enrolledStudents");
                    if (enrolledStudents != null) {
                        for (StudentCourse enrolledStudent : enrolledStudents) {
                %>
                <tr>
                    <td><%= enrolledStudent.getStudentId() %></td>
                    <td><%= enrolledStudent.getStudentName() %></td>
                    <td><%= enrolledStudent.getCourseId() %></td>
                    <td><%= enrolledStudent.getCourseName() %></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>