<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.edumanage.model.Course" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Edit Course</h2>
    <form action="course" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= ((Course) request.getAttribute("course")).getId() %>">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= ((Course) request.getAttribute("course")).getName() %>" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" required><%= ((Course) request.getAttribute("course")).getDescription() %></textarea>
        </div>
        <button type="submit">Update Course</button>
    </form>
</div>
</body>
</html>