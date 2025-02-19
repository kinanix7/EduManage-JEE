<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduManage - Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --success-color: #1cc88a;
            --info-color: #36b9cc;
            --warning-color: #f6c23e;
        }

        body {
            background-color: #f8f9fc;
        }

        .dashboard-title {
            color: #5a5c69;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .custom-card {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            border: none;
            border-radius: 15px;
            height: 100%;
            min-height: 280px;
        }

        .custom-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
        }

        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            padding: 2rem;
        }

        .icon-primary { color: var(--primary-color); }
        .icon-success { color: var(--success-color); }
        .icon-info { color: var(--info-color); }
        .icon-warning { color: var(--warning-color); }

        .custom-btn {
            width: 80%;
            padding: 0.75rem;
            border-radius: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .btn-primary.custom-btn {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-success.custom-btn {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }

        .btn-info.custom-btn {
            background-color: var(--info-color);
            border-color: var(--info-color);
            color: white;
        }

        .btn-warning.custom-btn {
            background-color: var(--warning-color);
            border-color: var(--warning-color);
            color: #333;
        }

        .custom-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin: 1rem 0;
            color: #5a5c69;
        }

        .card-text {
            color: #858796;
            margin-bottom: 1.5rem;
        }

        .row {
            margin-top: 2rem;
        }

        .col-md-4 {
            margin-bottom: 2rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .custom-card {
                min-height: auto;
            }

            .dashboard-title {
                font-size: 1.75rem;
            }
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4 dashboard-title">EduManage - Dashboard</h1>
    <div class="row justify-content-center">
        <!-- Card 1: Add Student -->
        <div class="col-md-4 col-sm-6">
            <div class="card text-center shadow p-3 mb-5 bg-body rounded custom-card">
                <div class="card-body">
                    <i class="fa-solid fa-user-plus fa-3x mb-3 icon-primary"></i>
                    <h5 class="card-title">Ajouter un Étudiant</h5>
                    <p class="card-text">Cliquez ici pour ajouter un nouvel étudiant.</p>
                    <a href="${pageContext.request.contextPath}/students?action=add" class="btn btn-primary custom-btn">
                        <i class="fa-solid fa-plus me-2"></i>Ajouter
                    </a>
                </div>
            </div>
        </div>

        <!-- Card 2: Add Course -->
        <div class="col-md-4 col-sm-6">
            <div class="card text-center shadow p-3 mb-5 bg-body rounded custom-card">
                <div class="card-body">
                    <i class="fa-solid fa-book-open fa-3x mb-3 icon-success"></i>
                    <h5 class="card-title">Ajouter un Cours</h5>
                    <p class="card-text">Cliquez ici pour ajouter un nouveau cours.</p>
                    <a href="${pageContext.request.contextPath}/courses?action=add" class="btn btn-success custom-btn">
                        <i class="fa-solid fa-plus me-2"></i>Ajouter
                    </a>
                </div>
            </div>
        </div>

        <!-- Card 3: List Students -->
        <div class="col-md-4 col-sm-6">
            <div class="card text-center shadow p-3 mb-5 bg-body rounded custom-card">
                <div class="card-body">
                    <i class="fa-solid fa-users fa-3x mb-3 icon-info"></i>
                    <h5 class="card-title">Liste des Étudiants</h5>
                    <p class="card-text">Cliquez ici pour voir la liste des étudiants.</p>
                    <a href="${pageContext.request.contextPath}/students" class="btn btn-info custom-btn">
                        <i class="fa-solid fa-list me-2"></i>Voir la Liste
                    </a>
                </div>
            </div>
        </div>

        <!-- Card 4: List Courses -->
        <div class="col-md-4 col-sm-6">
            <div class="card text-center shadow p-3 mb-5 bg-body rounded custom-card">
                <div class="card-body">
                    <i class="fa-solid fa-book fa-3x mb-3 icon-warning"></i>
                    <h5 class="card-title">Liste des Cours</h5>
                    <p class="card-text">Cliquez ici pour voir la liste des cours.</p>
                    <a href="${pageContext.request.contextPath}/courses" class="btn btn-warning custom-btn">
                        <i class="fa-solid fa-list me-2"></i>Voir la Liste
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>