<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.edumanage.model.Course" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Course Management</h2>

    <!-- Add Course Form -->
    <div class="card mb-4">
        <div class="card-header">Add New Course</div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/courses" method="post">
                <input type="hidden" name="action" value="create">
                <div class="row">
                    <div class="col-md-4">
                        <input type="text" name="name" class="form-control" placeholder="Course Name" required>
                    </div>
                    <div class="col-md-7">
                        <input type="text" name="description" class="form-control" placeholder="Course Description" required>
                    </div>
                    <div class="col-md-1">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Courses List -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Course> courses = (List<Course>) request.getAttribute("courses");
            if (courses != null) {
                for (Course course : courses) {
        %>
        <tr>
            <td><%= course.getId() %></td>
            <td><%= course.getName() %></td>
            <td><%= course.getDescription() %></td>
            <td>
                <button class="btn btn-sm btn-warning" onclick="editCourse(<%= course.getId() %>)">Edit</button>
                <form action="${pageContext.request.contextPath}/courses" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= course.getId() %>">
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

<!-- Edit Course Modal -->
<div class="modal fade" id="editCourseModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="editCourseForm" action="${pageContext.request.contextPath}/courses" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" id="editId">
                    <div class="mb-3">
                        <label class="form-label">Course Name</label>
                        <input type="text" name="name" id="editName" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" id="editDescription" class="form-control" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function editCourse(id) {
        // In a real application, you would fetch the course data from the server
        // For now, we'll just show the modal
        const modal = new bootstrap.Modal(document.getElementById('editCourseModal'));
        document.getElementById('editId').value = id;
        modal.show();
    }
</script>
</body>
</html>