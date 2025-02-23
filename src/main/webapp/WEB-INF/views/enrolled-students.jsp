<%@ page import="com.edumanage.model.StudentCourse" %>
<%@ page import="java.util.List" %>
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

        .back-button {
            margin-bottom: 25px;
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

        .table-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            padding: 2.5rem;
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            transition: all 0.3s ease;
        }

        .table-container:hover {
            transform: translateY(-5px);
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
            background: linear-gradient(to right, var(--primary), var(--secondary));
            border-radius: 2px;
        }

        .table {
            border-collapse: separate;
            border-spacing: 0;
            margin: 0;
        }

        .table th {
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.1), rgba(79, 70, 229, 0.1));
            color: var(--dark);
            font-weight: 700;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 0.5px;
            padding: 1.25rem 1rem;
            border-bottom: 2px solid rgba(99, 102, 241, 0.2);
        }

        .table td {
            padding: 1rem;
            color: var(--dark);
            font-weight: 500;
            border-bottom: 1px solid rgba(99, 102, 241, 0.1);
        }

        .table tbody tr {
            transition: all 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: rgba(99, 102, 241, 0.05);
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.03);
        }

        .icon-gradient {
            background: linear-gradient(45deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-right: 10px;
        }

        th i {
            color: var(--primary);
            margin-right: 0.5rem;
        }

        @media (max-width: 768px) {
            .container { padding: 1rem; }
            .table-container {
                padding: 1.5rem;
                margin-top: 1rem;
            }
            .table th, .table td { padding: 0.75rem; }
            .page-title { font-size: 1.5rem; }
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
                    <th><i class="fas fa-id-card"></i>Student ID</th>
                    <th><i class="fas fa-user"></i>Student Name</th>
                    <th><i class="fas fa-book"></i>Course ID</th>
                    <th><i class="fas fa-graduation-cap"></i>Course Name</th>
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