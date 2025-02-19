<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.edumanage.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Student Management</h2>

    <!-- Add Student Form -->
    <div class="card mb-4">
        <div class="card-header">Add New Student</div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/students" method="post">
                <input type="hidden" name="action" value="create">
                <div class="row">
                    <div class="col-md-3">
                        <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
                    </div>
                    <div class="col-md-3">
                        <input type="email" name="email" class="form-control" placeholder="Email" required>
                    </div>
                    <div class="col-md-2">
                        <input type="date" name="dateOfBirth" class="form-control" required>
                    </div>
                    <div class="col-md-1">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Students List -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Date of Birth</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Student> students = (List<Student>) request.getAttribute("students");
            if (students != null) {
                for (Student student : students) {
        %>
        <tr>
            <td><%= student.getId() %></td>
            <td><%= student.getFirstName() %></td>
            <td><%= student.getLastName() %></td>
            <td><%= student.getEmail() %></td>
            <td><%= student.getDateOfBirth() %></td>
            <td>
                <button class="btn btn-sm btn-warning" onclick="editStudent(<%= student.getId() %>)">Edit</button>
                <form action="${pageContext.request.contextPath}/students" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= student.getId() %>">
                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<!-- Edit Student Modal -->
<div class="modal fade" id="editStudentModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Student</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="editStudentForm" action="${pageContext.request.contextPath}/students" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="editId">
                    <div class="mb-3">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstName" id="editFirstName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastName" id="editLastName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" id="editEmail" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Date of Birth</label>
                        <input type="date" name="dateOfBirth" id="editDateOfBirth" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function editStudent(id) {
        // In a real application, you would fetch the student data from the server
        // For now, we'll just show the modal
        const modal = new bootstrap.Modal(document.getElementById('editStudentModal'));
        document.getElementById('editId').value = id;
        modal.show();
    }
</script>
</body>
</html>