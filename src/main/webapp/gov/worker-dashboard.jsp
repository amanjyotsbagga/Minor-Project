<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Worker Dashboard - Grievance Management System</title>
    <!-- Google Fonts: Poppins & Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-dark: #065f46; /* gov-primary */
            --primary-medium: #047857; /* Slightly lighter green */
            --primary-light: #10b981; /* Even lighter green */
            --accent-color: #facc15; /* gov-accent */
            --background: #f3f4f6; /* gov-bg */
            --text-dark: #1F2937; /* dark-text */
            --text-light: #ffffff;
            --text-muted: #6b7280;
            --card-bg: #f9fafb; /* gov-light */
            --border-color: #d1d5db;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --border-radius: 0.5rem;
            --box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--background);
            color: var(--text-dark);
            line-height: 1.6;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 260px;
            background-color: #1f2937; /* gov-dark */
            padding: 20px 0;
            transition: var(--transition);
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            z-index: 100;
        }

        .logo {
            text-align: center;
            padding: 15px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 20px;
        }

        .logo-img {
            width: 60px;
            height: 60px;
            margin: 0 auto 10px auto;
            display: block;
            border-radius: 50%;
            background: white;
            padding: 5px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            filter: brightness(0) invert(1);
        }

        .logo-text {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
            margin-top: 8px;
        }

        .logo-hindi {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-light);
            font-family: 'Poppins', sans-serif;
        }

        .logo-english {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-light);
            font-family: 'Poppins', sans-serif;
        }

        .logo-subtitle {
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.85rem;
            margin-top: 5px;
        }

        .nav-links {
            list-style: none;
        }

        .nav-links li {
            padding: 14px 20px;
            border-left: 4px solid transparent;
            transition: var(--transition);
            cursor: pointer;
        }

        .nav-links li:hover {
            background-color: rgba(255, 255, 255, 0.1);
            border-left: 4px solid var(--accent-color);
            transform: translateX(5px);
        }

        .nav-links li.active {
            background-color: var(--primary-dark);
            border-left: 4px solid var(--accent-color);
        }

        .nav-links a {
            color: var(--text-light);
            text-decoration: none;
            display: flex;
            align-items: center;
            transition: var(--transition);
        }

        .nav-links i {
            margin-right: 12px;
            font-size: 1.2rem;
            width: 20px;
            text-align: center;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 25px;
            overflow-y: auto;
            background-color: var(--background);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding: 15px 20px;
            background-color: #1f2937; /* gov-dark */
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .header h1 {
            color: var(--text-light);
            font-weight: 600;
            font-size: 1.8rem;
            font-family: 'Poppins', sans-serif;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .refresh-btn {
            background-color: var(--primary-dark);
            color: white;
            border: none;
            border-radius: var(--border-radius);
            padding: 10px 15px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 500;
            transition: var(--transition);
            box-shadow: var(--box-shadow);
        }

        .refresh-btn:hover {
            background-color: var(--primary-medium);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        .refresh-btn:active {
            transform: translateY(0);
        }

        .refresh-btn i {
            transition: var(--transition);
        }

        .refresh-btn.refreshing i {
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px 15px;
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        .user-info:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        .user-avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-medium), var(--primary-light));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 25px;
            text-align: center;
            transition: var(--transition);
            border: 1px solid var(--border-color);
            position: relative;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            border-color: var(--primary-light);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-dark), var(--accent-color));
        }

        .card h3 {
            font-size: 1.1rem;
            margin-bottom: 12px;
            color: var(--text-dark);
        }

        .card .number {
            font-size: 2.2rem;
            font-weight: bold;
            color: var(--primary-dark);
            transition: var(--transition);
        }

        .card:hover .number {
            color: var(--primary-medium);
        }

        /* Task Section */
        .section-title {
            margin-bottom: 20px;
            color: var(--text-dark);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .section-title h2 {
            font-family: 'Poppins', sans-serif;
            font-weight: 700;
        }

        .tasks-container {
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            border: 1px solid var(--border-color);
            transition: var(--transition);
        }

        .tasks-container:hover {
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        .task-filters {
            padding: 18px 20px;
            background-color: var(--card-bg);
            border-bottom: 1px solid var(--border-color);
            display: flex;
            gap: 12px;
        }

        .filter-btn {
            padding: 8px 18px;
            border: none;
            background-color: var(--background);
            color: var(--text-dark);
            border-radius: 20px;
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
            border: 1px solid var(--border-color);
        }

        .filter-btn:hover {
            background-color: var(--primary-light);
            color: white;
            transform: translateY(-2px);
        }

        .filter-btn.active {
            background-color: var(--primary-dark);
            color: white;
        }

        .task-list {
            max-height: 500px;
            overflow-y: auto;
        }

        /* Task Items */
        .task-item {
            padding: 20px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: var(--transition);
            position: relative;
        }

        .task-item:hover {
            background-color: rgba(6, 95, 70, 0.05);
            transform: translateX(5px);
        }

        .task-item:last-child {
            border-bottom: none;
        }

        .task-info {
            flex: 1;
            min-width: 0;
        }

        .task-info h4 {
            margin-bottom: 8px;
            color: var(--text-dark);
            transition: var(--transition);
            font-weight: 600;
        }

        .task-item:hover .task-info h4 {
            color: var(--primary-dark);
        }

        .task-meta {
            display: flex;
            gap: 15px;
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .task-status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
            transition: var(--transition);
            white-space: nowrap;
            min-width: 90px;
            text-align: center;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .status-pending {
            background-color: rgba(245, 158, 11, 0.15);
            color: var(--warning-color);
            border: 1px solid var(--warning-color);
        }

        .status-completed {
            background-color: rgba(16, 185, 129, 0.15);
            color: var(--success-color);
            border: 1px solid var(--success-color);
        }

        .status-danger {
            background-color: rgba(239, 68, 68, 0.15);
            color: var(--danger-color);
            border: 1px solid var(--danger-color);
        }

        .task-actions {
            display: flex;
            gap: 10px;
            flex-wrap: nowrap;
            flex-shrink: 0;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 500;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .btn-primary {
            background-color: var(--primary-dark);
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--primary-medium);
        }

        .btn-success {
            background-color: var(--success-color);
            color: white;
        }

        .btn-success:hover {
            background-color: #0da271;
        }

        .btn-warning {
            background-color: var(--warning-color);
            color: var(--text-dark);
        }

        .btn-warning:hover {
            background-color: #e0950a;
        }

        .btn-danger {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-danger:hover {
            background-color: #dc2626;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(3px);
        }

        .modal-content {
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            width: 90%;
            max-width: 700px;
            padding: 35px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            border: 1px solid var(--border-color);
            transform: scale(0.9);
            opacity: 0;
            animation: modalAppear 0.3s forwards;
            max-height: 85vh;
            overflow-y: auto;
        }

        @keyframes modalAppear {
            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 20px;
        }

        .modal-header h3 {
            color: var(--primary-dark);
            font-size: 1.5rem;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.8rem;
            cursor: pointer;
            color: var(--text-muted);
            transition: var(--transition);
            padding: 5px;
        }

        .close-btn:hover {
            color: var(--danger-color);
            transform: rotate(90deg);
        }

        /* Task Details Content */
        .task-details-content {
            font-size: 1.05rem;
            line-height: 1.7;
        }

        .task-details-content h4 {
            font-size: 1.4rem;
            margin-bottom: 15px;
            color: var(--primary-dark);
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
        }

        .task-details-content p {
            margin-bottom: 25px;
            color: var(--text-dark);
            font-size: 1.1rem;
        }

        .task-details-meta {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin: 25px 0;
            padding: 20px;
            background-color: var(--background);
            border-radius: var(--border-radius);
            border: 1px solid var(--border-color);
        }

        .task-details-meta div {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .task-details-meta strong {
            color: var(--primary-medium);
            font-size: 1rem;
        }

        .task-details-meta span {
            color: var(--text-dark);
            font-size: 1.05rem;
        }

        /* FIXED: Status in modal - properly aligned */
        .task-details-status {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .task-details-status strong {
            min-width: 60px;
            flex-shrink: 0;
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: bold;
            white-space: nowrap;
            text-align: center;
        }

        .status-badge-pending {
            background-color: rgba(245, 158, 11, 0.15);
            color: var(--warning-color);
            border: 1px solid var(--warning-color);
        }

        .status-badge-completed {
            background-color: rgba(16, 185, 129, 0.15);
            color: var(--success-color);
            border: 1px solid var(--success-color);
        }

        .status-badge-danger {
            background-color: rgba(239, 68, 68, 0.15);
            color: var(--danger-color);
            border: 1px solid var(--danger-color);
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            font-weight: 500;
            color: var(--text-dark);
            font-size: 1.05rem;
        }

        .form-control {
            width: 100%;
            padding: 14px;
            border: 1px solid var(--border-color);
            border-radius: var(--border-radius);
            font-size: 1rem;
            background-color: var(--card-bg);
            color: var(--text-dark);
            transition: var(--transition);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(6, 95, 70, 0.2);
        }

        .upload-area {
            border: 2px dashed var(--border-color);
            border-radius: var(--border-radius);
            padding: 35px;
            text-align: center;
            cursor: pointer;
            transition: var(--transition);
            background-color: var(--background);
        }

        .upload-area:hover {
            border-color: var(--primary-light);
            background-color: rgba(6, 95, 70, 0.05);
        }

        .upload-area i {
            font-size: 2.5rem;
            color: var(--text-muted);
            margin-bottom: 15px;
            transition: var(--transition);
        }

        .upload-area:hover i {
            color: var(--primary-medium);
        }

        .upload-area p {
            color: var(--text-muted);
            font-size: 1.05rem;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 25px;
            border-top: 1px solid var(--border-color);
            padding-top: 20px;
        }

        /* Content sections */
        .content-section {
            display: none;
        }
        
        .content-section.active {
            display: block;
        }

        /* Mobile Menu Button */
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            font-size: 1.5rem;
            color: var(--text-light);
            cursor: pointer;
            padding: 10px;
            position: absolute;
            top: 15px;
            left: 15px;
            z-index: 101;
        }

        /* Responsive Styles */
        @media (max-width: 992px) {
            .dashboard-cards {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }
            
            .task-details-meta {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .mobile-menu-btn {
                display: block;
            }

            .sidebar {
                position: fixed;
                left: -260px;
                height: 100%;
                transition: var(--transition);
            }

            .sidebar.active {
                left: 0;
            }

            .main-content {
                width: 100%;
                padding: 20px 15px;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
                margin-top: 50px;
            }

            .header-actions {
                width: 100%;
                justify-content: space-between;
            }

            .user-info {
                align-self: flex-end;
            }

            .dashboard-cards {
                grid-template-columns: 1fr 1fr;
            }

            .task-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .task-status {
                position: static;
                transform: none;
                align-self: flex-start;
            }

            .task-actions {
                width: 100%;
                justify-content: flex-end;
            }

            .task-meta {
                flex-direction: column;
                gap: 8px;
            }

            .modal-content {
                width: 95%;
                padding: 25px;
            }

            .modal-footer {
                flex-direction: column;
            }

            .modal-footer .btn {
                width: 100%;
                justify-content: center;
            }
        }

        @media (max-width: 576px) {
            .dashboard-cards {
                grid-template-columns: 1fr;
            }

            .task-filters {
                flex-wrap: wrap;
            }

            .header h1 {
                font-size: 1.5rem;
            }

            .modal-content {
                padding: 20px;
            }

            .task-details-content h4 {
                font-size: 1.2rem;
            }

            .task-details-content p {
                font-size: 1rem;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <!-- Mobile Menu Button -->
        <button class="mobile-menu-btn" id="mobileMenuBtn">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="logo">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Emblem_of_India.svg/1200px-Emblem_of_India.svg.png" alt="Government of India Logo" class="logo-img">
                <div class="logo-text">
                    <div class="logo-english">Setu</div>
                    <div class="logo-hindi">सेतु</div>
                </div>
                <div class="logo-subtitle">Government of India</div>
            </div>
            <ul class="nav-links">
                <li class="active" data-section="dashboard"><a href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li data-section="my-tasks"><a href="#"><i class="fas fa-tasks"></i> My Tasks</a></li>
                <li data-section="task-history"><a href="#"><i class="fas fa-history"></i> Task History</a></li>
                <li id="logout-btn"><a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h1>Worker Dashboard</h1>
                <div class="header-actions">
                    <button class="refresh-btn" id="refreshBtn">
                        <i class="fas fa-sync-alt"></i> Refresh Tasks
                    </button>
                    <div class="user-info">
                        <div class="user-avatar">WK</div>
                        <div>
                            <div class="user-name">Worker Name</div>
                            <div class="user-role">Field Agent</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Section -->
            <div id="dashboard" class="content-section active">
                <!-- Dashboard Cards -->
                <div class="dashboard-cards">
                    <div class="card">
                        <h3>Assigned Tasks</h3>
                        <div class="number">12</div>
                    </div>
                    <div class="card">
                        <h3>Completed Today</h3>
                        <div class="number">5</div>
                    </div>
                    <div class="card">
                        <h3>Pending Tasks</h3>
                        <div class="number">7</div>
                    </div>
                    <div class="card">
                        <h3>SLA Compliance</h3>
                        <div class="number">92%</div>
                    </div>
                </div>

                <!-- Tasks Section -->
                <div class="section-title">
                    <h2>My Tasks</h2>
                    <div class="task-filters">
                        <button class="filter-btn active">All</button>
                        <button class="filter-btn">Pending</button>
                        <button class="filter-btn">Completed</button>
                    </div>
                </div>

                <div class="tasks-container">
                    <div class="task-list">
                        <!-- Task Item 1 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Garbage Accumulation in Sector 15</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Sector 15, Block C</span>
                                    <span><i class="fas fa-clock"></i> Due: Today, 4:00 PM</span>
                                    <span><i class="fas fa-tag"></i> Sanitation</span>
                                </div>
                            </div>
                            <div class="task-status status-pending">Pending</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(1)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(1)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>

                        <!-- Task Item 2 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Street Light Repair - Main Road</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Main Road, Near Market</span>
                                    <span><i class="fas fa-clock"></i> Due: Tomorrow, 10:00 AM</span>
                                    <span><i class="fas fa-tag"></i> Electricity</span>
                                </div>
                            </div>
                            <div class="task-status status-pending">Pending</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(2)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(2)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>

                        <!-- Task Item 3 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Water Pipeline Leak - Residential Area</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Sector 22, Block D</span>
                                    <span><i class="fas fa-clock"></i> Due: Yesterday</span>
                                    <span><i class="fas fa-tag"></i> Water Supply</span>
                                </div>
                            </div>
                            <div class="task-status status-danger">Overdue</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(3)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(3)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>

                        <!-- Task Item 4 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Pothole Repair - Highway</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> National Highway, KM 25</span>
                                    <span><i class="fas fa-clock"></i> Due: 2 days ago</span>
                                    <span><i class="fas fa-tag"></i> Roads</span>
                                </div>
                            </div>
                            <div class="task-status status-completed">Completed</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(4)"><i class="fas fa-eye"></i> Details</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- My Tasks Section -->
            <div id="my-tasks" class="content-section">
                <div class="section-title">
                    <h2>All My Tasks</h2>
                    <div class="task-filters">
                        <button class="filter-btn active">All</button>
                        <button class="filter-btn">Pending</button>
                        <button class="filter-btn">Completed</button>
                    </div>
                </div>

                <div class="tasks-container">
                    <div class="task-list">
                        <!-- Task Item 1 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Garbage Accumulation in Sector 15</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Sector 15, Block C</span>
                                    <span><i class="fas fa-clock"></i> Due: Today, 4:00 PM</span>
                                    <span><i class="fas fa-tag"></i> Sanitation</span>
                                </div>
                            </div>
                            <div class="task-status status-pending">Pending</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(1)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(1)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>

                        <!-- Task Item 2 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Street Light Repair - Main Road</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Main Road, Near Market</span>
                                    <span><i class="fas fa-clock"></i> Due: Tomorrow, 10:00 AM</span>
                                    <span><i class="fas fa-tag"></i> Electricity</span>
                                </div>
                            </div>
                            <div class="task-status status-pending">Pending</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(2)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(2)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Task History Section -->
            <div id="task-history" class="content-section">
                <div class="section-title">
                    <h2>Task History</h2>
                    <div class="task-filters">
                        <button class="filter-btn active">All</button>
                        <button class="filter-btn">Pending</button>
                        <button class="filter-btn">Completed</button>
                    </div>
                </div>

                <div class="tasks-container">
                    <div class="task-list">
                        <!-- Task Item 1 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Garbage Accumulation in Sector 15</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Sector 15, Block C</span>
                                    <span><i class="fas fa-clock"></i> Due: Today, 4:00 PM</span>
                                    <span><i class="fas fa-tag"></i> Sanitation</span>
                                </div>
                            </div>
                            <div class="task-status status-pending">Pending</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(1)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(1)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>

                        <!-- Task Item 2 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Street Light Repair - Main Road</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Main Road, Near Market</span>
                                    <span><i class="fas fa-clock"></i> Due: Tomorrow, 10:00 AM</span>
                                    <span><i class="fas fa-tag"></i> Electricity</span>
                                </div>
                            </div>
                            <div class="task-status status-pending">Pending</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(2)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(2)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>

                        <!-- Task Item 3 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Water Pipeline Leak - Residential Area</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Sector 22, Block D</span>
                                    <span><i class="fas fa-clock"></i> Due: Yesterday</span>
                                    <span><i class="fas fa-tag"></i> Water Supply</span>
                                </div>
                            </div>
                            <div class="task-status status-danger">Overdue</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(3)"><i class="fas fa-eye"></i> Details</button>
                                <button class="btn btn-success" onclick="openUploadModal(3)"><i class="fas fa-upload"></i> Upload Proof</button>
                            </div>
                        </div>

                        <!-- Task Item 4 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Pothole Repair - Highway</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> National Highway, KM 25</span>
                                    <span><i class="fas fa-clock"></i> Due: 2 days ago</span>
                                    <span><i class="fas fa-tag"></i> Roads</span>
                                </div>
                            </div>
                            <div class="task-status status-completed">Completed</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(4)"><i class="fas fa-eye"></i> Details</button>
                            </div>
                        </div>

                        <!-- Task Item 5 -->
                        <div class="task-item">
                            <div class="task-info">
                                <h4>Drainage Cleaning - Market Area</h4>
                                <div class="task-meta">
                                    <span><i class="fas fa-map-marker-alt"></i> Central Market</span>
                                    <span><i class="fas fa-clock"></i> Completed: 3 days ago</span>
                                    <span><i class="fas fa-tag"></i> Sanitation</span>
                                </div>
                            </div>
                            <div class="task-status status-completed">Completed</div>
                            <div class="task-actions">
                                <button class="btn btn-primary" onclick="openTaskDetails(5)"><i class="fas fa-eye"></i> Details</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Task Details Modal -->
    <div id="taskDetailsModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Task Details</h3>
                <button class="close-btn" onclick="closeModal('taskDetailsModal')">&times;</button>
            </div>
            <div id="taskDetailsContent" class="task-details-content">
                <!-- Task details will be loaded here -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="navigateToTask()"><i class="fas fa-directions"></i> Navigate to Location</button>
                <button class="btn btn-success" onclick="openUploadModal(currentTaskId)"><i class="fas fa-upload"></i> Upload Proof</button>
            </div>
        </div>
    </div>

    <!-- Upload Proof Modal -->
    <div id="uploadModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Upload Proof of Work</h3>
                <button class="close-btn" onclick="closeModal('uploadModal')">&times;</button>
            </div>
            <div class="form-group">
                <label for="taskNotes">Task Notes</label>
                <textarea id="taskNotes" class="form-control" rows="4" placeholder="Add any notes about the task completion..."></textarea>
            </div>
            <div class="form-group">
                <label>Upload Photo</label>
                <div class="upload-area" onclick="document.getElementById('photoUpload').click()">
                    <i class="fas fa-cloud-upload-alt"></i>
                    <p>Click to upload or drag and drop</p>
                    <p>JPG, PNG (Max 5MB)</p>
                </div>
                <input type="file" id="photoUpload" accept="image/*" style="display: none;" onchange="handlePhotoUpload(this)">
            </div>
            <div id="uploadPreview" style="display: none; margin-top: 15px;">
                <img id="previewImage" src="#" alt="Preview" style="max-width: 100%; border-radius: var(--border-radius);">
            </div>
            <div class="modal-footer">
                <button class="btn filter-btn" onclick="closeModal('uploadModal')"><i class="fas fa-times"></i> Cancel</button>
                <button class="btn btn-success" onclick="submitProof()"><i class="fas fa-check"></i> Submit Proof</button>
            </div>
        </div>
    </div>

    <script>
        // Sample task data
        const tasks = {
            1: {
                id: 1,
                title: "Garbage Accumulation in Sector 15",
                description: "Residents have reported significant garbage accumulation near the community park in Sector 15. The waste has not been collected for 3 days and is causing foul smell and potential health hazards. Immediate action is required to clear the garbage and restore cleanliness in the area.",
                location: "Sector 15, Block C, Near Community Park",
                coordinates: "28.6139, 77.2090",
                category: "Sanitation",
                priority: "High",
                assignedDate: "2025-10-25",
                dueDate: "2025-10-25 16:00",
                status: "pending",
                reporter: "Community Resident",
                contact: "9876543210"
            },
            2: {
                id: 2,
                title: "Street Light Repair - Main Road",
                description: "Multiple street lights are non-functional on the main road near the market area. This is causing safety concerns for pedestrians and vehicles during evening hours. The issue has been reported by multiple residents and requires immediate attention.",
                location: "Main Road, Near Central Market, Between Sector 10-12",
                coordinates: "28.6129, 77.2295",
                category: "Electricity",
                priority: "Medium",
                assignedDate: "2025-10-24",
                dueDate: "2025-10-26 10:00",
                status: "pending",
                reporter: "Traffic Police Department",
                contact: "9876543211"
            },
            3: {
                id: 3,
                title: "Water Pipeline Leak - Residential Area",
                description: "A major water pipeline leak has been reported in Sector 22. Water is flowing onto the road and causing inconvenience to residents. Immediate repair is required to prevent water wastage and restore normal water supply to the affected areas.",
                location: "Sector 22, Block D, Near Community Center",
                coordinates: "28.6215, 77.2187",
                category: "Water Supply",
                priority: "High",
                assignedDate: "2025-10-23",
                dueDate: "2025-10-24 18:00",
                status: "overdue",
                reporter: "Resident Welfare Association",
                contact: "9876543212"
            },
            4: {
                id: 4,
                title: "Pothole Repair - Highway",
                description: "Large potholes have developed on the national highway at KM 25. These pose a serious risk to vehicles, especially during night time. Temporary repair was completed yesterday but permanent solution is required.",
                location: "National Highway, KM 25, Near Toll Plaza",
                coordinates: "28.5990, 77.2412",
                category: "Roads",
                priority: "High",
                assignedDate: "2025-10-22",
                dueDate: "2025-10-23 12:00",
                status: "completed",
                reporter: "Highway Patrol",
                contact: "9876543213"
            },
            5: {
                id: 5,
                title: "Drainage Cleaning - Market Area",
                description: "Blocked drainage in the central market area is causing water logging. Immediate cleaning required to prevent health hazards and ensure proper drainage during rainy season.",
                location: "Central Market, Main Bazaar Road",
                coordinates: "28.6100, 77.2300",
                category: "Sanitation",
                priority: "Medium",
                assignedDate: "2025-10-21",
                dueDate: "2025-10-22 14:00",
                status: "completed",
                reporter: "Market Association",
                contact: "9876543214"
            }
        };

        let currentTaskId = null;

        // Refresh functionality
        document.getElementById('refreshBtn').addEventListener('click', function() {
            const refreshBtn = document.getElementById('refreshBtn');
            
            // Add refreshing animation
            refreshBtn.classList.add('refreshing');
            refreshBtn.disabled = true;
            
            // Simulate API call to refresh tasks
            setTimeout(() => {
                // Remove refreshing animation
                refreshBtn.classList.remove('refreshing');
                refreshBtn.disabled = false;
                
                // Show success message
                alert('Tasks refreshed successfully! All tasks have been updated with the latest data from the server.');
                
                // In a real application, here you would:
                // 1. Make an API call to fetch updated tasks
                // 2. Update the tasks object with new data
                // 3. Re-render the task lists
                
                console.log('Tasks refreshed at: ' + new Date().toLocaleTimeString());
            }, 1500);
        });

        // Mobile menu functionality
        document.getElementById('mobileMenuBtn').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('active');
        });

        // Navigation functionality
        document.querySelectorAll('.nav-links li').forEach(item => {
            if (item.id !== 'logout-btn') {
                item.addEventListener('click', function() {
                    // Update active nav item
                    document.querySelectorAll('.nav-links li').forEach(li => {
                        li.classList.remove('active');
                    });
                    this.classList.add('active');
                    
                    // Show corresponding section
                    const sectionId = this.getAttribute('data-section');
                    document.querySelectorAll('.content-section').forEach(section => {
                        section.classList.remove('active');
                    });
                    document.getElementById(sectionId).classList.add('active');
                    
                    // Close mobile menu after selection
                    if (window.innerWidth <= 768) {
                        document.getElementById('sidebar').classList.remove('active');
                    }
                });
            }
        });

        // Logout functionality
        document.getElementById('logout-btn').addEventListener('click', function() {
            if (confirm('Are you sure you want to logout?')) {
                alert('Logging out...');
                // In a real app, this would redirect to login page
            }
        });

        // Modal functions
        function openTaskDetails(taskId) {
            currentTaskId = taskId;
            const task = tasks[taskId];
            
            let statusClass = '';
            let statusText = '';
            
            switch(task.status) {
                case 'pending':
                    statusClass = 'status-badge-pending';
                    statusText = 'Pending';
                    break;
                case 'overdue':
                    statusClass = 'status-badge-danger';
                    statusText = 'Overdue';
                    break;
                case 'completed':
                    statusClass = 'status-badge-completed';
                    statusText = 'Completed';
                    break;
            }
            
            document.getElementById('taskDetailsContent').innerHTML = `
                <h4>${task.title}</h4>
                <p>${task.description}</p>
                <div class="task-details-meta">
                    <div>
                        <strong>Location:</strong>
                        <span>${task.location}</span>
                    </div>
                    <div>
                        <strong>Category:</strong>
                        <span>${task.category}</span>
                    </div>
                    <div>
                        <strong>Priority:</strong>
                        <span>${task.priority}</span>
                    </div>
                    <div>
                        <strong>Assigned Date:</strong>
                        <span>${task.assignedDate}</span>
                    </div>
                    <div>
                        <strong>Due Date:</strong>
                        <span>${task.dueDate}</span>
                    </div>
                    <div class="task-details-status">
                        <strong>Status:</strong>
                        <span class="status-badge ${statusClass}">${statusText}</span>
                    </div>
                    <div>
                        <strong>Reporter:</strong>
                        <span>${task.reporter}</span>
                    </div>
                    <div>
                        <strong>Contact:</strong>
                        <span>${task.contact}</span>
                    </div>
                </div>
                <div style="margin-top: 20px;">
                    <strong>Coordinates:</strong>
                    <span style="font-family: monospace; background: var(--background); padding: 5px 10px; border-radius: 4px; display: inline-block; margin-top: 5px;">${task.coordinates}</span>
                </div>
            `;
            
            document.getElementById('taskDetailsModal').style.display = 'flex';
        }

        function openUploadModal(taskId) {
            currentTaskId = taskId;
            document.getElementById('uploadModal').style.display = 'flex';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
            document.getElementById('uploadPreview').style.display = 'none';
            document.getElementById('taskNotes').value = '';
        }

        function navigateToTask() {
            if (currentTaskId) {
                const task = tasks[currentTaskId];
                alert(`Opening navigation to: ${task.location}\nCoordinates: ${task.coordinates}`);
                // In a real application, this would open the device's navigation app
            }
        }

        function handlePhotoUpload(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                
                reader.onload = function(e) {
                    document.getElementById('previewImage').src = e.target.result;
                    document.getElementById('uploadPreview').style.display = 'block';
                }
                
                reader.readAsDataURL(input.files[0]);
            }
        }

        function submitProof() {
            if (currentTaskId) {
                const taskElement = document.querySelector(`.task-item:nth-child(${currentTaskId})`);
                if (taskElement) {
                    taskElement.querySelector('.task-status').className = 'task-status status-completed';
                    taskElement.querySelector('.task-status').textContent = 'Completed';
                    
                    const uploadButton = taskElement.querySelector('.btn-success');
                    if (uploadButton) {
                        uploadButton.style.display = 'none';
                    }
                }
                
                alert(`Proof of work submitted for task: "${tasks[currentTaskId].title}"`);
                closeModal('uploadModal');
            }
        }

        // Filter tasks
        document.querySelectorAll('.filter-btn').forEach(button => {
            button.addEventListener('click', function() {
                const container = this.closest('.content-section');
                const filterButtons = container.querySelectorAll('.filter-btn');
                filterButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
                
                const filter = this.textContent.toLowerCase();
                const taskItems = container.querySelectorAll('.task-item');
                
                taskItems.forEach(item => {
                    const status = item.querySelector('.task-status').textContent.toLowerCase();
                    
                    if (filter === 'all') {
                        item.style.display = 'flex';
                    } else if (filter === 'pending' && (status === 'pending' || status === 'overdue')) {
                        item.style.display = 'flex';
                    } else if (filter === 'completed' && status === 'completed') {
                        item.style.display = 'flex';
                    } else {
                        item.style.display = 'none';
                    }
                });
            });
        });

        // Close modal when clicking outside
        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
                document.getElementById('uploadPreview').style.display = 'none';
                document.getElementById('taskNotes').value = '';
            }
        }

        // Close mobile menu when clicking outside
        document.addEventListener('click', function(event) {
            const sidebar = document.getElementById('sidebar');
            const mobileMenuBtn = document.getElementById('mobileMenuBtn');
            
            if (window.innerWidth <= 768 && 
                !sidebar.contains(event.target) && 
                !mobileMenuBtn.contains(event.target) &&
                sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
            }
        });
    </script>
</body>
</html>