<%--
  Created by IntelliJ IDEA.
  User: youne
  Date: 2/26/2025
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Asap&display=swap" rel="stylesheet">
    <style>
        /* Colors */
        :root {
            --green-seaweed: rgba(2, 128, 144, 1);
            --blue-queen: rgba(69, 105, 144, 1);
            --red-fire: rgb(30, 232, 184);
        }

        /* Import Google Font */
        @import url('https://fonts.googleapis.com/css2?family=Asap&display=swap');

        body {
            background-color: var(--red-fire);
            font-family: 'Asap', sans-serif;
            margin: 0;
            padding: 0;
        }

        .login {
            overflow: hidden;
            background-color: white;
            padding: 40px 30px 30px 30px;
            border-radius: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            transform: translate(-50%, -50%);
            transition: transform 300ms, box-shadow 300ms;
            box-shadow: 5px 10px 10px rgba(2, 128, 144, 0.2);
        }

        .login::before,
        .login::after {
            content: '';
            position: absolute;
            width: 600px;
            height: 600px;
            border-top-left-radius: 40%;
            border-top-right-radius: 45%;
            border-bottom-left-radius: 35%;
            border-bottom-right-radius: 40%;
            z-index: -1;
        }

        .login::before {
            left: 40%;
            bottom: -130%;
            background-color: rgba(69, 105, 144, 0.15);
            animation: waves 6s infinite linear;
        }

        .login::after {
            left: 35%;
            bottom: -125%;
            background-color: rgba(2, 128, 144, 0.2);
            animation: waves 7s infinite;
        }

        .login input {
            font-family: 'Asap', sans-serif;
            display: block;
            border-radius: 5px;
            font-size: 16px;
            background: white;
            width: 100%;
            border: 0;
            padding: 10px 10px;
            margin: 15px -10px;
            box-sizing: border-box;
        }

        .login button {
            font-family: 'Asap', sans-serif;
            cursor: pointer;
            color: #fff;
            font-size: 16px;
            text-transform: uppercase;
            width: 80px;
            border: 0;
            padding: 10px 0;
            margin-top: 10px;
            margin-left: -5px;
            border-radius: 5px;
            background-color: var(--red-fire);
            transition: background-color 300ms;
        }

        .login button:hover {
            background-color: rgba(232, 65, 80, 1); /* Darkened red-fire */
        }

        /* Error message styling */
        .error-message {
            color: var(--red-fire);
            font-size: 14px;
            margin-bottom: 15px;
        }

        @keyframes waves {
            from { transform: rotate(0); }
            to { transform: rotate(360deg); }
        }

        a {
            text-decoration: none;
            color: rgba(255, 255, 255, 0.6);
            position: absolute;
            right: 10px;
            bottom: 10px;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="login">

    <form action="login" method="post">
        <input type="text" placeholder="Username" name="username" required>
        <input type="password" placeholder="Password" name="password" required>
        <% if (request.getAttribute("error") != null) { %>
        <p class="error-message"><%= request.getAttribute("error") %></p>
        <% } %>
        <button type="submit" >Login</button>
    </form>
</div>
</body>
</html>