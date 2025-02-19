<!-- src/main/webapp/WEB-INF/views/student/update.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduManage - Update Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .back-button {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: 600;
        }
    </style>
</head>
<body class="bg-light">
<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary back-button">
        <i class="fas fa-arrow-left"></i> Back to Students List
    </a>
    <div class="form-container">
        <h2 class="text-center mb-4"><i class="fas fa-user-edit"></i> Update Student</h2>
        <form action="${pageContext.request.contextPath}/students" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${student.id}">

            <div class="mb-3">
                <label for="firstName" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName"
                       value="${student.firstName}" required>
            </div>

            <div class="mb-3">
                <label for="lastName" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName"
                       value="${student.lastName}" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email"
                       value="${student.email}" required>
            </div>

            <div class="mb-3">
                <label for="dateOfBirth" class="form-label">Date of Birth</label>
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth"
                       value="${student.dateOfBirth}" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Update Student
                </button>
            </div>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>