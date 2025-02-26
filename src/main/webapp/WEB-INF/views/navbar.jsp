<%--
  Created by IntelliJ IDEA.
  User: youne
  Date: 2/26/2025
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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
            padding-top: 70px; /* Added to accommodate fixed navbar */
        }

        /* Navbar styles */
        .navbar {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .navbar-brand {
            font-weight: 800;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            padding: 0.5rem 0;
        }

        .nav-link {
            color: var(--dark);
            font-weight: 600;
            transition: all 0.3s ease;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            margin: 0 0.25rem;
        }

        .nav-link:hover {
            background-color: rgba(99, 102, 241, 0.1);
            color: var(--primary);
        }

        .nav-link.active {
            background-color: rgba(99, 102, 241, 0.2);
            color: var(--primary);
        }

        .btn-logout {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(220, 38, 38, 0.3);
            color: white;
        }

        .dashboard-title {
            color: var(--dark);
            font-weight: 800;
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .custom-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            height: 100%;
            min-height: 300px;
        }

        .custom-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 2rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

        .icon-wrapper {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            transition: transform 0.3s ease;
        }

        .custom-card:hover .icon-wrapper {
            transform: scale(1.1);
        }

        .icon-primary { background: linear-gradient(135deg, #818cf8, #6366f1); }
        .icon-success { background: linear-gradient(135deg, #34d399, #22c55e); }
        .icon-warning { background: linear-gradient(135deg, #fbbf24, #f59e0b); }
        .icon-info { background: linear-gradient(135deg, #60a5fa, #3b82f6); }

        .icon-wrapper i {
            color: white;
            font-size: 2rem;
        }

        .card-title {
            color: var(--dark);
            font-size: 1.5rem;
            font-weight: 700;
            margin: 1rem 0;
        }

        .card-text {
            color: #64748b;
            font-size: 1rem;
            line-height: 1.5;
            margin-bottom: 1.5rem;
        }

        .custom-btn {
            width: 100%;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-primary { background: linear-gradient(135deg, #818cf8, #6366f1); }
        .btn-success { background: linear-gradient(135deg, #34d399, #22c55e); }
        .btn-warning { background: linear-gradient(135deg, #fbbf24, #f59e0b); }
        .btn-info { background: linear-gradient(135deg, #60a5fa, #3b82f6); }

        .custom-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .container { padding: 1rem; }
            .dashboard-title { font-size: 2rem; }
            .custom-card { min-height: auto; }
            .navbar-brand { font-size: 1.25rem; }
        }
    </style>
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">
            <i class="fa-solid fa-graduation-cap me-2"></i>EduManage
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/dashboard">
                        <i class="fa-solid fa-gauge-high me-1"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/students">
                        <i class="fa-solid fa-user-graduate me-1"></i> Étudiants
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/courses">
                        <i class="fa-solid fa-book me-1"></i> Cours
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/enrolled-students">
                        <i class="fa-solid fa-clipboard-list me-1"></i> Inscriptions
                    </a>
                </li>
            </ul>
            <div class="d-flex">
                <span class="navbar-text me-3">
                    <i class="fa-solid fa-user-circle me-1"></i> ${sessionScope.username}
                </span><form action="logout" method="post">
                <button type="submit" class="btn btn-logout">
                    <i class="fa-solid fa-sign-out-alt me-1"></i> Déconnexion
                </button>

            </div>
        </div>
    </div>
</nav>

</body>
</html>
