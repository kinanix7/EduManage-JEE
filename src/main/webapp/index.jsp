<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduManage - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
        }
    </style>
</head>
<body>
<div class="container py-5">
    <h1 class="dashboard-title">EduManage Dashboard</h1>
    <div class="row g-4">
        <!-- Add Student Card -->
        <div class="col-md-4 col-sm-6">
            <div class="custom-card">
                <div class="card-body">
                    <div class="icon-wrapper icon-primary">
                        <i class="fa-solid fa-user-plus"></i>
                    </div>
                    <h5 class="card-title">Ajouter un Étudiant</h5>
                    <p class="card-text">Cliquez ici pour ajouter un nouvel étudiant au système.</p>
                    <a href="${pageContext.request.contextPath}/students?action=add" class="btn custom-btn btn-primary">
                        <i class="fa-solid fa-plus me-2"></i>Ajouter
                    </a>
                </div>
            </div>
        </div>

        <!-- Add Course Card -->
        <div class="col-md-4 col-sm-6">
            <div class="custom-card">
                <div class="card-body">
                    <div class="icon-wrapper icon-success">
                        <i class="fa-solid fa-book-open"></i>
                    </div>
                    <h5 class="card-title">Ajouter un Cours</h5>
                    <p class="card-text">Cliquez ici pour ajouter un nouveau cours au catalogue.</p>
                    <a href="${pageContext.request.contextPath}/courses?action=add" class="btn custom-btn btn-success">
                        <i class="fa-solid fa-plus me-2"></i>Ajouter
                    </a>
                </div>
            </div>
        </div>

        <!-- Enroll Student Card -->
        <div class="col-md-4 col-sm-6">
            <div class="custom-card">
                <div class="card-body">
                    <div class="icon-wrapper icon-warning">
                        <i class="fa-solid fa-book"></i>
                    </div>
                    <h5 class="card-title">Inscrire un Étudiant</h5>
                    <p class="card-text">Cliquez ici pour inscrire un étudiant à un cours disponible.</p>
                    <a href="${pageContext.request.contextPath}/student-courses" class="btn custom-btn btn-warning">
                        <i class="fa-solid fa-plus me-2"></i>Inscrire
                    </a>
                </div>
            </div>
        </div>

        <!-- Enrolled Students Card -->
        <div class="col-md-4 col-sm-6 ">
            <div class="custom-card">
                <div class="card-body">
                    <div class="icon-wrapper icon-info">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <h5 class="card-title">Étudiants Inscrits</h5>
                    <p class="card-text">Cliquez ici pour voir la liste complète des étudiants inscrits.</p>
                    <a href="${pageContext.request.contextPath}/enrolled-students" class="btn custom-btn btn-info">
                        <i class="fa-solid fa-list me-2"></i>Voir la Liste
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>