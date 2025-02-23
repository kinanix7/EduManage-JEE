<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.edumanage.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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

        .card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border-bottom: none;
            padding: 1.5rem;
        }

        .card-header h5 {
            font-weight: 700;
            margin: 0;
        }

        .form-floating .form-control {
            border-radius: 12px;
            border: 1px solid rgba(99, 102, 241, 0.2);
        }

        .form-floating .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border: none;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .table {
            margin: 0;
        }

        .table th {
            background-color: rgba(99, 102, 241, 0.1);
            color: var(--dark);
            font-weight: 700;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 0.5px;
            padding: 1.25rem 1rem;
        }

        .table td {
            padding: 1rem;
            vertical-align: middle;
            color: #64748b;
        }

        .table tbody tr {
            transition: all 0.3s ease;
        }

        .table tbody tr:hover {
            background-color: rgba(99, 102, 241, 0.05);
            transform: translateY(-2px);
        }

        .action-buttons .btn {
            border-radius: 8px;
            padding: 0.5rem 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-warning {
            background: linear-gradient(135deg, var(--warning), #ea580c);
            border: none;
            color: white;
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            border: none;
        }

        .modal-content {
            border-radius: 20px;
            border: none;
            overflow: hidden;
        }

        .modal-header {
            padding: 1.5rem;
            border: none;
        }

        .modal-header.bg-warning {
            background: linear-gradient(135deg, var(--warning), #ea580c) !important;
            color: white;
        }

        .modal-header.bg-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626) !important;
            color: white;
        }

        .alert {
            border-radius: 12px;
            border: none;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }

        .alert-success {
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.1), rgba(34, 197, 94, 0.2));
            color: var(--success);
        }

        .alert-danger {
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.1), rgba(220, 38, 38, 0.2));
            color: #dc2626;
        }

        @media (max-width: 768px) {
            .container { padding: 1rem; }
            .card-body { padding: 1.5rem; }
            .table td, .table th { padding: 0.75rem; }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <a href="${pageContext.request.contextPath}/" class="btn btn-secondary back-button">
        <i class="fas fa-arrow-left me-2"></i> Back to Dashboard
    </a>
<div class="container mt-4">

    <!-- Error/Success Messages -->
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= request.getAttribute("error") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <% } %>
    <% if (request.getAttribute("success") != null) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= request.getAttribute("success") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
    <% } %>

    <!-- Add Student Form -->
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0"><i class="fas fa-plus-circle me-2"></i>Add New Student</h5>
        </div>
        <div class="card-body">
            <form id="addStudentForm" action="${pageContext.request.contextPath}/students" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="action" value="create">
                <div class="row g-3">
                    <div class="col-md-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required>
                            <label for="firstName">First Name</label>
                            <div class="invalid-feedback">Please enter first name</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" required>
                            <label for="lastName">Last Name</label>
                            <div class="invalid-feedback">Please enter last name</div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                            <label for="email">Email</label>
                            <div class="invalid-feedback">Please enter a valid email</div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-floating">
                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                            <label for="dateOfBirth">Date of Birth</label>
                            <div class="invalid-feedback">Please select date</div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <button type="submit" class="btn btn-primary w-100 h-100">
                            <i class="fas fa-save me-2"></i>Add
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Students List -->
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0"><i class="fas fa-list me-2"></i>Student List</h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-custom mb-0">
                    <thead>
                    <tr>
                        <th class="student-id">ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Date of Birth</th>
                        <th class="actions-column">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Student> students = (List<Student>) request.getAttribute("students");
                        if (students != null && !students.isEmpty()) {
                            for (Student student : students) {
                    %>
                    <tr>
                        <td class="student-id">#<%= student.getId() %></td>
                        <td><%= student.getFirstName() %></td>
                        <td><%= student.getLastName() %></td>
                        <td><%= student.getEmail() %></td>
                        <td><%= student.getDateOfBirth() %></td>
                        <td class="actions-column">
                            <div class="action-buttons">
                                <button class="btn btn-warning btn-sm" onclick="editStudent('<%= student.getId() %>', '<%= student.getFirstName() %>', '<%= student.getLastName() %>', '<%= student.getEmail() %>', '<%= student.getDateOfBirth() %>')">
                                    <i class="fas fa-edit"></i>
                                    <span>Edit</span>
                                </button>
                                <button class="btn btn-danger btn-sm" onclick="deleteStudent(<%= student.getId() %>)">
                                    <i class="fas fa-trash"></i>
                                    <span>Delete</span>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center py-4 text-muted">
                            <i class="fas fa-info-circle me-2"></i>No students available
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Edit Student Modal -->
<div class="modal fade" id="editStudentModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h5 class="modal-title"><i class="fas fa-edit me-2"></i>Edit Student</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="editStudentForm" action="${pageContext.request.contextPath}/students" method="post" class="needs-validation" novalidate>
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="editId">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="editFirstName" name="firstName" placeholder="First Name" required>
                        <label for="editFirstName">First Name</label>
                        <div class="invalid-feedback">Please enter first name</div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="editLastName" name="lastName" placeholder="Last Name" required>
                        <label for="editLastName">Last Name</label>
                        <div class="invalid-feedback">Please enter last name</div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="editEmail" name="email" placeholder="Email" required>
                        <label for="editEmail">Email</label>
                        <div class="invalid-feedback">Please enter a valid email</div>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="editDateOfBirth" name="dateOfBirth" required>
                        <label for="editDateOfBirth">Date of Birth</label>
                        <div class="invalid-feedback">Please select date</div>
                    </div>
                    <div class="text-end">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-warning">
                            <i class="fas fa-save me-2"></i>Update
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger text-white">
                <h5 class="modal-title"><i class="fas fa-exclamation-triangle me-2"></i>Confirm Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this student?
            </div>
            <div class="modal-footer">
                <form id="deleteForm" action="${pageContext.request.contextPath}/students" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" id="deleteId">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-trash me-2"></i>Delete
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()

    // Edit student function
    function editStudent(id , firstName, lastName, email, dateOfBirth) {
        document.getElementById('editId').value = id;
        document.getElementById('editFirstName').value = firstName;
        document.getElementById('editLastName').value = lastName;
        document.getElementById('editEmail').value = email;
        document.getElementById('editDateOfBirth').value = dateOfBirth;
        new bootstrap.Modal(document.getElementById('editStudentModal')).show();
    }

    // Delete student function
    function deleteStudent(id) {
        document.getElementById('deleteId').value = id;
        new bootstrap.Modal(document.getElementById('deleteModal')).show();
    }

    // Auto-hide alerts after 5 seconds
    setTimeout(function() {
        var alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            new bootstrap.Alert(alert).close();
        });
    }, 5000);
</script>
</body>
</html>