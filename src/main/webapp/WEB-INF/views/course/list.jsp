<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.edumanage.model.Course" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course List</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <h2>Course List</h2>
    <a href="add.jsp">Add New Course</a>
    <table>
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
                <a href="course?action=edit&id=<%= course.getId() %>">Edit</a>
                <a href="course?action=delete&id=<%= course.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>