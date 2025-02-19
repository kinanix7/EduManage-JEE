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
                                <button class="btn btn-warning btn-sm" onclick="editStudent(<%= student.getId() %>)">
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
    function editStudent(id) {
        document.getElementById('editId').value = id;
        // In a real application, you would fetch the student data from the server
        const modal = new bootstrap.Modal(document.getElementById('editStudentModal'));
        modal.show();
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