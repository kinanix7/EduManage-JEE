<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
</head>
<body>
<h1>Student Form</h1>
<form action="students" method="post">
    <input type="hidden" name="action" value="${empty student ? 'insert' : 'update'}">
    <input type="hidden" name="id" value="${student.id}">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" value="${student.firstName}" required>
    <br>
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value="${student.lastName}" required>
    <br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${student.email}" required>
    <br>
    <label for="dateOfBirth">Date of Birth:</label>
    <input type="date" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}" required>
    <br>
    <button type="submit">${empty student ? 'Add' : 'Update'}</button>
</form>
</body>
</html>