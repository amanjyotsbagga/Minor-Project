<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Setu - Department Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --success: #2ecc71;
            --warning: #f39c12;
            --danger: #e74c3c;
            --light: #ecf0f1;
            --dark: #34495e;
            --sidebar-width: 250px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: #f5f7fa;
            color: #333;
        }

        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background: var(--primary);
            color: white;
            height: 100vh;
            position: fixed;
            transition: all 0.3s;
            z-index: 1000;
        }

        .sidebar-header {
            padding: 20px;
            background: var(--dark);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sidebar-header h2 {
            font-size: 1.5rem;
        }

        .sidebar-menu {
            padding: 15px 0;
        }

        .sidebar-menu ul {
            list-style: none;
        }

        .sidebar-menu li {
            padding: 12px 20px;
            transition: all 0.3s;
            cursor: pointer;
        }

        .sidebar-menu li:hover {
            background: var(--dark);
        }

        .sidebar-menu li.active {
            background: var(--secondary);
            border-left: 4px solid var(--warning);
        }

        .sidebar-menu i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 20px;
            transition: all 0.3s;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }

        .header h1 {
            color: var(--primary);
            font-size: 1.8rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .card-title {
            font-size: 0.9rem;
            color: #7f8c8d;
            font-weight: 600;
        }

        .card-value {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .card-change {
            font-size: 0.8rem;
            display: flex;
            align-items: center;
        }

        .card-change.positive {
            color: var(--success);
        }

        .card-change.negative {
            color: var(--danger);
        }

        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }

        .bg-primary { background: var(--primary); }
        .bg-success { background: var(--success); }
        .bg-warning { background: var(--warning); }
        .bg-danger { background: var(--danger); }

        /* Charts Section */
        .charts-section {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .chart-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .chart-title {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: var(--primary);
            font-weight: 600;
        }

        /* Tables Section */
        .tables-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 30px;
        }

        .table-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            overflow: hidden;
        }

        .table-title {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: var(--primary);
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .view-all {
            font-size: 0.8rem;
            color: var(--secondary);
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background-color: #f8f9fa;
            font-weight: 600;
            color: var(--dark);
        }

        tr:hover {
            background-color: #f8f9fa;
        }

        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .status-completed {
            background: #e7f7ef;
            color: var(--success);
        }

        .status-pending {
            background: #fef5e7;
            color: var(--warning);
        }

        .status-overdue {
            background: #fde8e6;
            color: var(--danger);
        }

        .status-in-progress {
            background: #e8f4fd;
            color: var(--secondary);
        }

        .progress-bar {
            height: 8px;
            background: #ecf0f1;
            border-radius: 4px;
            overflow: hidden;
        }

        .progress {
            height: 100%;
            border-radius: 4px;
        }

        .progress-high {
            background: var(--success);
        }

        .progress-medium {
            background: var(--warning);
        }

        .progress-low {
            background: var(--danger);
        }

        /* Alert Panel */
        .alert-panel {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
        }

        .alert-title {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: var(--primary);
            font-weight: 600;
        }

        .alert-item {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            border-left: 4px solid var(--danger);
            background: #fde8e6;
            margin-bottom: 10px;
            border-radius: 0 4px 4px 0;
        }

        .alert-icon {
            margin-right: 10px;
            color: var(--danger);
        }

        /* Section Styles */
        .section {
            display: none;
        }

        .section.active {
            display: block;
        }

        /* Operator Details */
        .operator-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .operator-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .operator-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .operator-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .operator-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: var(--secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.5rem;
            margin-right: 15px;
        }

        .operator-info h3 {
            margin-bottom: 5px;
        }

        .operator-info p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        /* Worker Details */
        .worker-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .worker-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .worker-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .worker-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .worker-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: var(--success);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 1.5rem;
            margin-right: 15px;
        }

        .worker-info h3 {
            margin-bottom: 5px;
        }

        .worker-info p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        /* Task Details */
        .task-filters {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .filter-btn {
            padding: 8px 16px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .filter-btn.active {
            background: var(--secondary);
            color: white;
            border-color: var(--secondary);
        }

        .refresh-btn {
            padding: 8px 16px;
            background: var(--success);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 5px;
            margin-left: auto;
        }

        .refresh-btn:hover {
            background: #27ae60;
        }

        .task-list {
            display: grid;
            gap: 15px;
        }

        .task-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            transition: all 0.3s;
        }

        .task-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            transform: translateY(-2px);
        }

        .task-info h4 {
            margin-bottom: 5px;
        }

        .task-info p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .task-status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2000;
            justify-content: center;
            align-items: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: white;
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            padding: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .modal-title {
            font-size: 1.5rem;
            color: var(--primary);
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #7f8c8d;
        }

        .modal-body {
            margin-bottom: 20px;
        }

        .detail-row {
            display: flex;
            margin-bottom: 15px;
        }

        .detail-label {
            font-weight: 600;
            width: 150px;
            color: var(--dark);
        }

        .detail-value {
            flex: 1;
        }

        .proof-image {
            width: 100%;
            max-width: 300px;
            border-radius: 8px;
            margin-top: 10px;
            border: 1px solid #eee;
        }

        /* Settings Section */
        .settings-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .setting-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .setting-title {
            font-size: 1.2rem;
            margin-bottom: 15px;
            color: var(--primary);
            font-weight: 600;
        }

        .setting-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }

        .setting-item:last-child {
            border-bottom: none;
        }

        .setting-info h4 {
            margin-bottom: 5px;
        }

        .setting-info p {
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .edit-btn {
            padding: 6px 12px;
            background: var(--secondary);
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .edit-btn:hover {
            background: #2980b9;
        }

        .edit-btn:disabled {
            background: #bdc3c7;
            cursor: not-allowed;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: var(--dark);
        }

        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--secondary);
        }

        .form-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
            background: white;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-primary {
            background: var(--secondary);
            color: white;
        }

        .btn-primary:hover {
            background: #2980b9;
        }

        .btn-secondary {
            background: #95a5a6;
            color: white;
        }

        .btn-secondary:hover {
            background: #7f8c8d;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .charts-section,
            .tables-section,
            .settings-section {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }
            .sidebar-header h2,
            .sidebar-menu span {
                display: none;
            }
            .sidebar-menu li {
                text-align: center;
                padding: 15px 10px;
            }
            .sidebar-menu i {
                margin-right: 0;
                font-size: 1.2rem;
            }
            .main-content {
                margin-left: 70px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <i class="fas fa-city"></i>
            <h2>Setu Admin</h2>
        </div>
        <div class="sidebar-menu">
            <ul>
                <li class="active" data-section="dashboard"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></li>
                <li data-section="operators"><i class="fas fa-users"></i> <span>Operators</span></li>
                <li data-section="workers"><i class="fas fa-hard-hat"></i> <span>Workers</span></li>
                <li data-section="tasks"><i class="fas fa-tasks"></i> <span>Tasks</span></li>
                <li data-section="analytics"><i class="fas fa-chart-bar"></i> <span>Analytics</span></li>
                <li data-section="settings"><i class="fas fa-cog"></i> <span>Settings</span></li>
            </ul>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Dashboard Section -->
        <div class="section active" id="dashboard">
            <div class="header">
                <h1>Sanitation Department Dashboard</h1>
                <div class="user-info">
                    <div class="user-avatar">SA</div>
                    <div>
                        <div class="user-name">Sanjay Agarwal</div>
                        <div class="user-role">Department Admin</div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Cards -->
            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Total Reports This Month</div>
                        <div class="card-icon bg-primary">
                            <i class="fas fa-file-alt"></i>
                        </div>
                    </div>
                    <div class="card-value">1,450</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-up"></i> 12% from last month
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Reports Resolved</div>
                        <div class="card-icon bg-success">
                            <i class="fas fa-check-circle"></i>
                        </div>
                    </div>
                    <div class="card-value">1,380</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-up"></i> 8% from last month
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">SLA Compliance Rate</div>
                        <div class="card-icon bg-warning">
                            <i class="fas fa-clock"></i>
                        </div>
                    </div>
                    <div class="card-value">92%</div>
                    <div class="card-change negative">
                        <i class="fas fa-arrow-down"></i> 3% from last month
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Avg. Resolution Time</div>
                        <div class="card-icon bg-danger">
                            <i class="fas fa-hourglass-half"></i>
                        </div>
                    </div>
                    <div class="card-value">18h</div>
                    <div class="card-change negative">
                        <i class="fas fa-arrow-up"></i> 2h from last month
                    </div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="charts-section">
                <div class="chart-container">
                    <div class="chart-title">Weekly Report Volume & SLA Compliance</div>
                    <canvas id="volumeChart"></canvas>
                </div>
                <div class="chart-container">
                    <div class="chart-title">Reports by Category</div>
                    <canvas id="categoryChart"></canvas>
                </div>
            </div>

            <!-- Alert Panel -->
            <div class="alert-panel">
                <div class="alert-title">High Priority Alerts</div>
                <div class="alert-item">
                    <i class="fas fa-exclamation-circle alert-icon"></i>
                    <div>
                        <strong>15 Reports Overdue</strong> - These reports have exceeded their SLA and require immediate attention.
                    </div>
                </div>
                <div class="alert-item">
                    <i class="fas fa-exclamation-triangle alert-icon"></i>
                    <div>
                        <strong>25 Reports Nearing SLA</strong> - These reports are approaching their deadline and need to be prioritized.
                    </div>
                </div>
            </div>

            <!-- Tables Section -->
            <div class="tables-section">
                <!-- Operator Performance Table -->
                <div class="table-container">
                    <div class="table-title">
                        Operator Performance
                        <span class="view-all">View All <i class="fas fa-chevron-right"></i></span>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Operator Name</th>
                                <th>Tasks Managed</th>
                                <th>Avg. Assignment Time</th>
                                <th>SLA Miss Rate</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Amit Sharma</td>
                                <td>420</td>
                                <td>15 min</td>
                                <td>
                                    <div class="progress-bar">
                                        <div class="progress progress-high" style="width: 96%"></div>
                                    </div>
                                    <small>4%</small>
                                </td>
                            </tr>
                            <tr>
                                <td>Priya Singh</td>
                                <td>380</td>
                                <td>22 min</td>
                                <td>
                                    <div class="progress-bar">
                                        <div class="progress progress-medium" style="width: 91%"></div>
                                    </div>
                                    <small>9%</small>
                                </td>
                            </tr>
                            <tr>
                                <td>Rohan Mehta</td>
                                <td>310</td>
                                <td>18 min</td>
                                <td>
                                    <div class="progress-bar">
                                        <div class="progress progress-high" style="width: 94%"></div>
                                    </div>
                                    <small>6%</small>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Worker Performance Table -->
                <div class="table-container">
                    <div class="table-title">
                        Worker Performance
                        <span class="view-all">View All <i class="fas fa-chevron-right"></i></span>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Worker Name</th>
                                <th>Tasks Completed</th>
                                <th>On-Time Rate</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Vikram Jadhav</td>
                                <td>85</td>
                                <td>
                                    <div class="progress-bar">
                                        <div class="progress progress-high" style="width: 94%"></div>
                                    </div>
                                    <small>94%</small>
                                </td>
                                <td><span class="status status-completed">Excellent</span></td>
                            </tr>
                            <tr>
                                <td>Sunil Patil</td>
                                <td>72</td>
                                <td>
                                    <div class="progress-bar">
                                        <div class="progress progress-medium" style="width: 82%"></div>
                                    </div>
                                    <small>82%</small>
                                </td>
                                <td><span class="status status-pending">Needs Improvement</span></td>
                            </tr>
                            <tr>
                                <td>Ankita Rao</td>
                                <td>91</td>
                                <td>
                                    <div class="progress-bar">
                                        <div class="progress progress-high" style="width: 98%"></div>
                                    </div>
                                    <small>98%</small>
                                </td>
                                <td><span class="status status-completed">Excellent</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Operators Section -->
        <div class="section" id="operators">
            <div class="header">
                <h1>Operator Management</h1>
                <div class="user-info">
                    <div class="user-avatar">SA</div>
                    <div>
                        <div class="user-name">Sanjay Agarwal</div>
                        <div class="user-role">Department Admin</div>
                    </div>
                </div>
            </div>

            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Total Operators</div>
                        <div class="card-icon bg-primary">
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                    <div class="card-value">8</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-up"></i> 2 new this month
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Avg. Assignment Time</div>
                        <div class="card-icon bg-success">
                            <i class="fas fa-clock"></i>
                        </div>
                    </div>
                    <div class="card-value">18 min</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-down"></i> 2 min improvement
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">SLA Compliance</div>
                        <div class="card-icon bg-warning">
                            <i class="fas fa-percentage"></i>
                        </div>
                    </div>
                    <div class="card-value">94%</div>
                    <div class="card-change negative">
                        <i class="fas fa-arrow-down"></i> 1% from last month
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Tasks Managed</div>
                        <div class="card-icon bg-danger">
                            <i class="fas fa-tasks"></i>
                        </div>
                    </div>
                    <div class="card-value">1,110</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-up"></i> 15% from last month
                    </div>
                </div>
            </div>

            <div class="operator-details">
                <div class="operator-card" data-id="1">
                    <div class="operator-header">
                        <div class="operator-avatar">AS</div>
                        <div class="operator-info">
                            <h3>Amit Sharma</h3>
                            <p>Zone A - South</p>
                        </div>
                    </div>
                    <div class="operator-stats">
                        <p><strong>Tasks Managed:</strong> 420</p>
                        <p><strong>Avg. Assignment Time:</strong> 15 min</p>
                        <p><strong>SLA Miss Rate:</strong> 4%</p>
                        <p><strong>Status:</strong> <span class="status status-completed">Active</span></p>
                    </div>
                </div>
                
                <div class="operator-card" data-id="2">
                    <div class="operator-header">
                        <div class="operator-avatar">PS</div>
                        <div class="operator-info">
                            <h3>Priya Singh</h3>
                            <p>Zone B - North</p>
                        </div>
                    </div>
                    <div class="operator-stats">
                        <p><strong>Tasks Managed:</strong> 380</p>
                        <p><strong>Avg. Assignment Time:</strong> 22 min</p>
                        <p><strong>SLA Miss Rate:</strong> 9%</p>
                        <p><strong>Status:</strong> <span class="status status-pending">Needs Review</span></p>
                    </div>
                </div>
                
                <div class="operator-card" data-id="3">
                    <div class="operator-header">
                        <div class="operator-avatar">RM</div>
                        <div class="operator-info">
                            <h3>Rohan Mehta</h3>
                            <p>Zone C - Central</p>
                        </div>
                    </div>
                    <div class="operator-stats">
                        <p><strong>Tasks Managed:</strong> 310</p>
                        <p><strong>Avg. Assignment Time:</strong> 18 min</p>
                        <p><strong>SLA Miss Rate:</strong> 6%</p>
                        <p><strong>Status:</strong> <span class="status status-completed">Active</span></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Workers Section -->
        <div class="section" id="workers">
            <div class="header">
                <h1>Worker Management</h1>
                <div class="user-info">
                    <div class="user-avatar">SA</div>
                    <div>
                        <div class="user-name">Sanjay Agarwal</div>
                        <div class="user-role">Department Admin</div>
                    </div>
                </div>
            </div>

            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Total Workers</div>
                        <div class="card-icon bg-primary">
                            <i class="fas fa-hard-hat"></i>
                        </div>
                    </div>
                    <div class="card-value">24</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-up"></i> 3 new this month
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Avg. Completion Time</div>
                        <div class="card-icon bg-success">
                            <i class="fas fa-clock"></i>
                        </div>
                    </div>
                    <div class="card-value">4.8h</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-down"></i> 0.5h improvement
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">On-Time Completion</div>
                        <div class="card-icon bg-warning">
                            <i class="fas fa-percentage"></i>
                        </div>
                    </div>
                    <div class="card-value">91%</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-up"></i> 2% from last month
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Tasks Completed</div>
                        <div class="card-icon bg-danger">
                            <i class="fas fa-tasks"></i>
                        </div>
                    </div>
                    <div class="card-value">1,248</div>
                    <div class="card-change positive">
                        <i class="fas fa-arrow-up"></i> 12% from last month
                    </div>
                </div>
            </div>

            <div class="worker-details">
                <div class="worker-card" data-id="1">
                    <div class="worker-header">
                        <div class="worker-avatar">VJ</div>
                        <div class="worker-info">
                            <h3>Vikram Jadhav</h3>
                            <p>Operator: Amit Sharma</p>
                        </div>
                    </div>
                    <div class="worker-stats">
                        <p><strong>Tasks Completed:</strong> 85</p>
                        <p><strong>On-Time Rate:</strong> 94%</p>
                        <p><strong>Avg. Resolution Time:</strong> 4.5h</p>
                        <p><strong>Status:</strong> <span class="status status-completed">Excellent</span></p>
                    </div>
                </div>
                
                <div class="worker-card" data-id="2">
                    <div class="worker-header">
                        <div class="worker-avatar">SP</div>
                        <div class="worker-info">
                            <h3>Sunil Patil</h3>
                            <p>Operator: Priya Singh</p>
                        </div>
                    </div>
                    <div class="worker-stats">
                        <p><strong>Tasks Completed:</strong> 72</p>
                        <p><strong>On-Time Rate:</strong> 82%</p>
                        <p><strong>Avg. Resolution Time:</strong> 6.1h</p>
                        <p><strong>Status:</strong> <span class="status status-pending">Needs Improvement</span></p>
                    </div>
                </div>
                
                <div class="worker-card" data-id="3">
                    <div class="worker-header">
                        <div class="worker-avatar">AR</div>
                        <div class="worker-info">
                            <h3>Ankita Rao</h3>
                            <p>Operator: Rohan Mehta</p>
                        </div>
                    </div>
                    <div class="worker-stats">
                        <p><strong>Tasks Completed:</strong> 91</p>
                        <p><strong>On-Time Rate:</strong> 98%</p>
                        <p><strong>Avg. Resolution Time:</strong> 3.8h</p>
                        <p><strong>Status:</strong> <span class="status status-completed">Excellent</span></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tasks Section -->
        <div class="section" id="tasks">
            <div class="header">
                <h1>Task Management</h1>
                <div class="user-info">
                    <div class="user-avatar">SA</div>
                    <div>
                        <div class="user-name">Sanjay Agarwal</div>
                        <div class="user-role">Department Admin</div>
                    </div>
                </div>
            </div>

            <div class="task-filters">
                <div class="filter-btn active" data-filter="all">All Tasks</div>
                <div class="filter-btn" data-filter="pending">Pending</div>
                <div class="filter-btn" data-filter="in-progress">In Progress</div>
                <div class="filter-btn" data-filter="completed">Completed</div>
                <div class="filter-btn" data-filter="overdue">Overdue</div>
                <button class="refresh-btn" id="refreshTasks">
                    <i class="fas fa-sync-alt"></i> Refresh Tasks
                </button>
            </div>

            <div class="task-list">
                <div class="task-card" data-id="1" data-status="pending">
                    <div class="task-info">
                        <h4>Garbage Overflow - Market Street</h4>
                        <p>Reported: 2 hours ago | Assigned to: Vikram Jadhav</p>
                    </div>
                    <div class="task-status status-pending">Pending</div>
                </div>
                
                <div class="task-card" data-id="2" data-status="in-progress">
                    <div class="task-info">
                        <h4>Pothole Repair - Central Avenue</h4>
                        <p>Reported: 5 hours ago | Assigned to: Sunil Patil</p>
                    </div>
                    <div class="task-status status-in-progress">In Progress</div>
                </div>
                
                <div class="task-card" data-id="3" data-status="completed">
                    <div class="task-info">
                        <h4>Street Light Repair - Park Road</h4>
                        <p>Reported: 1 day ago | Completed by: Ankita Rao</p>
                    </div>
                    <div class="task-status status-completed">Completed</div>
                </div>
                
                <div class="task-card" data-id="4" data-status="overdue">
                    <div class="task-info">
                        <h4>Drainage Cleaning - River Side</h4>
                        <p>Reported: 3 days ago | Assigned to: Rajesh Kumar</p>
                    </div>
                    <div class="task-status status-overdue">Overdue</div>
                </div>
                
                <div class="task-card" data-id="5" data-status="completed">
                    <div class="task-info">
                        <h4>Public Toilet Maintenance - Station Area</h4>
                        <p>Reported: 2 days ago | Completed by: Vikram Jadhav</p>
                    </div>
                    <div class="task-status status-completed">Completed</div>
                </div>
            </div>
        </div>

        <!-- Analytics Section -->
        <div class="section" id="analytics">
            <div class="header">
                <h1>Analytics & Reports</h1>
                <div class="user-info">
                    <div class="user-avatar">SA</div>
                    <div>
                        <div class="user-name">Sanjay Agarwal</div>
                        <div class="user-role">Department Admin</div>
                    </div>
                </div>
            </div>

            <div class="charts-section">
                <div class="chart-container">
                    <div class="chart-title">Monthly Performance Trends</div>
                    <canvas id="performanceChart"></canvas>
                </div>
                <div class="chart-container">
                    <div class="chart-title">Task Completion by Zone</div>
                    <canvas id="zoneChart"></canvas>
                </div>
            </div>

            <div class="table-container">
                <div class="table-title">Department Performance Summary</div>
                <table>
                    <thead>
                        <tr>
                            <th>Metric</th>
                            <th>Current Month</th>
                            <th>Previous Month</th>
                            <th>Change</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Total Reports</td>
                            <td>1,450</td>
                            <td>1,295</td>
                            <td class="positive">+12%</td>
                        </tr>
                        <tr>
                            <td>Resolution Rate</td>
                            <td>95%</td>
                            <td>93%</td>
                            <td class="positive">+2%</td>
                        </tr>
                        <tr>
                            <td>Avg. Resolution Time</td>
                            <td>18h</td>
                            <td>16h</td>
                            <td class="negative">+2h</td>
                        </tr>
                        <tr>
                            <td>SLA Compliance</td>
                            <td>92%</td>
                            <td>95%</td>
                            <td class="negative">-3%</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Settings Section -->
        <div class="section" id="settings">
            <div class="header">
                <h1>Settings</h1>
                <div class="user-info">
                    <div class="user-avatar">SA</div>
                    <div>
                        <div class="user-name">Sanjay Agarwal</div>
                        <div class="user-role">Department Admin</div>
                    </div>
                </div>
            </div>

            <div class="settings-section">
                <div class="setting-card">
                    <div class="setting-title">Department Configuration</div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>SLA for Garbage Reports</h4>
                            <p>Time limit for resolving garbage-related issues</p>
                        </div>
                        <button class="edit-btn">Edit</button>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>SLA for Pothole Reports</h4>
                            <p>Time limit for resolving pothole-related issues</p>
                        </div>
                        <button class="edit-btn">Edit</button>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>SLA for Street Light Reports</h4>
                            <p>Time limit for resolving street light issues</p>
                        </div>
                        <button class="edit-btn">Edit</button>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>Auto-Escalation Threshold</h4>
                            <p>Percentage of SLA time when escalation occurs</p>
                        </div>
                        <button class="edit-btn">Edit</button>
                    </div>
                </div>

                <div class="setting-card">
                    <div class="setting-title">User Management</div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>Sanjay Agarwal</h4>
                            <p>Department Admin</p>
                        </div>
                        <button class="edit-btn" disabled>Edit</button>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>Amit Sharma</h4>
                            <p>Operator</p>
                        </div>
                        <button class="edit-btn">Edit</button>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>Priya Singh</h4>
                            <p>Operator</p>
                        </div>
                        <button class="edit-btn">Edit</button>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <h4>Add New Operator</h4>
                            <p>Create a new operator account</p>
                        </div>
                        <button class="edit-btn" id="addOperatorBtn">Add</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Task Detail Modal -->
    <div class="modal" id="taskModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Task Details</h2>
                <button class="close-btn" id="closeTaskModal">&times;</button>
            </div>
            <div class="modal-body" id="taskModalBody">
                <!-- Task details will be loaded here -->
            </div>
        </div>
    </div>

    <!-- Operator Detail Modal -->
    <div class="modal" id="operatorModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Operator Details</h2>
                <button class="close-btn" id="closeOperatorModal">&times;</button>
            </div>
            <div class="modal-body" id="operatorModalBody">
                <!-- Operator details will be loaded here -->
            </div>
        </div>
    </div>

    <!-- Worker Detail Modal -->
    <div class="modal" id="workerModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Worker Details</h2>
                <button class="close-btn" id="closeWorkerModal">&times;</button>
            </div>
            <div class="modal-body" id="workerModalBody">
                <!-- Worker details will be loaded here -->
            </div>
        </div>
    </div>

    <!-- Add Operator Modal -->
    <div class="modal" id="addOperatorModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Add New Operator</h2>
                <button class="close-btn" id="closeAddOperatorModal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addOperatorForm">
                    <div class="form-group">
                        <label class="form-label" for="operatorName">Full Name</label>
                        <input type="text" id="operatorName" class="form-input" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="operatorEmail">Email Address</label>
                        <input type="email" id="operatorEmail" class="form-input" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="operatorPhone">Phone Number</label>
                        <input type="tel" id="operatorPhone" class="form-input" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="operatorZone">Assigned Zone</label>
                        <select id="operatorZone" class="form-select" required>
                            <option value="">Select a zone</option>
                            <option value="Zone A - South">Zone A - South</option>
                            <option value="Zone B - North">Zone B - North</option>
                            <option value="Zone C - Central">Zone C - Central</option>
                            <option value="Zone D - East">Zone D - East</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="operatorPassword">Initial Password</label>
                        <input type="password" id="operatorPassword" class="form-input" required>
                    </div>
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" id="cancelAddOperator">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add Operator</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Sample data for tasks, operators, and workers
        const tasksData = [
            {
                id: 1,
                title: "Garbage Overflow - Market Street",
                category: "Garbage",
                priority: "High",
                status: "pending",
                reported: "2 hours ago",
                assignedTo: "Vikram Jadhav",
                operator: "Amit Sharma",
                location: "Market Street, Zone A",
                sla: "24 hours",
                timeRemaining: "22 hours",
                description: "Large garbage pileup near the market entrance causing obstruction and foul smell."
            },
            {
                id: 2,
                title: "Pothole Repair - Central Avenue",
                category: "Road Repair",
                priority: "Medium",
                status: "in-progress",
                reported: "5 hours ago",
                assignedTo: "Sunil Patil",
                operator: "Priya Singh",
                location: "Central Avenue, Zone B",
                sla: "48 hours",
                timeRemaining: "43 hours",
                description: "Large pothole causing traffic issues and potential vehicle damage."
            },
            {
                id: 3,
                title: "Street Light Repair - Park Road",
                category: "Electrical",
                priority: "Medium",
                status: "completed",
                reported: "1 day ago",
                assignedTo: "Ankita Rao",
                operator: "Rohan Mehta",
                location: "Park Road, Zone C",
                sla: "72 hours",
                timeRemaining: "Completed",
                description: "Street light not working, creating safety concerns at night.",
                completionTime: "18 hours",
                proofOfWork: "https://example.com/street-light-fixed.jpg"
            },
            {
                id: 4,
                title: "Drainage Cleaning - River Side",
                category: "Drainage",
                priority: "High",
                status: "overdue",
                reported: "3 days ago",
                assignedTo: "Rajesh Kumar",
                operator: "Amit Sharma",
                location: "River Side, Zone A",
                sla: "24 hours",
                timeRemaining: "Overdue by 2 days",
                description: "Blocked drainage causing waterlogging during rains."
            },
            {
                id: 5,
                title: "Public Toilet Maintenance - Station Area",
                category: "Sanitation",
                priority: "Medium",
                status: "completed",
                reported: "2 days ago",
                assignedTo: "Vikram Jadhav",
                operator: "Amit Sharma",
                location: "Station Area, Zone A",
                sla: "48 hours",
                timeRemaining: "Completed",
                description: "Public toilet requires cleaning and maintenance.",
                completionTime: "36 hours",
                proofOfWork: "https://example.com/toilet-cleaned.jpg"
            }
        ];

        const operatorsData = [
            {
                id: 1,
                name: "Amit Sharma",
                zone: "Zone A - South",
                email: "amit.sharma@setu.gov",
                phone: "+91 98765 43210",
                joinDate: "15 Mar 2022",
                tasksManaged: 420,
                avgAssignmentTime: "15 min",
                slaMissRate: "4%",
                status: "Active",
                performance: "Excellent"
            },
            {
                id: 2,
                name: "Priya Singh",
                zone: "Zone B - North",
                email: "priya.singh@setu.gov",
                phone: "+91 98765 43211",
                joinDate: "22 Jul 2022",
                tasksManaged: 380,
                avgAssignmentTime: "22 min",
                slaMissRate: "9%",
                status: "Needs Review",
                performance: "Average"
            },
            {
                id: 3,
                name: "Rohan Mehta",
                zone: "Zone C - Central",
                email: "rohan.mehta@setu.gov",
                phone: "+91 98765 43212",
                joinDate: "05 Jan 2023",
                tasksManaged: 310,
                avgAssignmentTime: "18 min",
                slaMissRate: "6%",
                status: "Active",
                performance: "Good"
            }
        ];

        const workersData = [
            {
                id: 1,
                name: "Vikram Jadhav",
                operator: "Amit Sharma",
                email: "vikram.jadhav@setu.gov",
                phone: "+91 98765 43213",
                joinDate: "10 Apr 2022",
                tasksCompleted: 85,
                onTimeRate: "94%",
                avgResolutionTime: "4.5h",
                status: "Excellent",
                specialization: "Garbage Collection & Sanitation"
            },
            {
                id: 2,
                name: "Sunil Patil",
                operator: "Priya Singh",
                email: "sunil.patil@setu.gov",
                phone: "+91 98765 43214",
                joinDate: "28 Aug 2022",
                tasksCompleted: 72,
                onTimeRate: "82%",
                avgResolutionTime: "6.1h",
                status: "Needs Improvement",
                specialization: "Road Repair & Maintenance"
            },
            {
                id: 3,
                name: "Ankita Rao",
                operator: "Rohan Mehta",
                email: "ankita.rao@setu.gov",
                phone: "+91 98765 43215",
                joinDate: "15 Feb 2023",
                tasksCompleted: 91,
                onTimeRate: "98%",
                avgResolutionTime: "3.8h",
                status: "Excellent",
                specialization: "Electrical & Lighting"
            }
        ];

        // Initialize Charts
        document.addEventListener('DOMContentLoaded', function() {
            // Weekly Volume & SLA Chart
            const volumeCtx = document.getElementById('volumeChart').getContext('2d');
            const volumeChart = new Chart(volumeCtx, {
                type: 'bar',
                data: {
                    labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                    datasets: [
                        {
                            label: 'Reports',
                            data: [320, 380, 350, 400],
                            backgroundColor: 'rgba(52, 152, 219, 0.7)',
                            borderColor: 'rgba(52, 152, 219, 1)',
                            borderWidth: 1
                        },
                        {
                            label: 'SLA Compliance %',
                            data: [95, 92, 90, 89],
                            type: 'line',
                            borderColor: 'rgba(46, 204, 113, 1)',
                            backgroundColor: 'rgba(46, 204, 113, 0.1)',
                            borderWidth: 2,
                            fill: true,
                            yAxisID: 'y1'
                        }
                    ]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Number of Reports'
                            }
                        },
                        y1: {
                            position: 'right',
                            beginAtZero: true,
                            max: 100,
                            title: {
                                display: true,
                                text: 'SLA Compliance %'
                            },
                            grid: {
                                drawOnChartArea: false
                            }
                        }
                    }
                }
            });

            // Category Distribution Chart
            const categoryCtx = document.getElementById('categoryChart').getContext('2d');
            const categoryChart = new Chart(categoryCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Garbage Overflow', 'Potholes', 'Street Light', 'Drainage', 'Public Toilets'],
                    datasets: [{
                        data: [35, 25, 20, 15, 5],
                        backgroundColor: [
                            'rgba(231, 76, 60, 0.7)',
                            'rgba(52, 152, 219, 0.7)',
                            'rgba(243, 156, 18, 0.7)',
                            'rgba(46, 204, 113, 0.7)',
                            'rgba(155, 89, 182, 0.7)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });

            // Performance Chart for Analytics
            const performanceCtx = document.getElementById('performanceChart').getContext('2d');
            const performanceChart = new Chart(performanceCtx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                    datasets: [
                        {
                            label: 'SLA Compliance %',
                            data: [88, 90, 92, 91, 94, 92],
                            borderColor: 'rgba(46, 204, 113, 1)',
                            backgroundColor: 'rgba(46, 204, 113, 0.1)',
                            borderWidth: 2,
                            fill: true
                        },
                        {
                            label: 'Resolution Rate %',
                            data: [85, 88, 90, 92, 95, 95],
                            borderColor: 'rgba(52, 152, 219, 1)',
                            backgroundColor: 'rgba(52, 152, 219, 0.1)',
                            borderWidth: 2,
                            fill: true
                        }
                    ]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: false,
                            min: 80,
                            max: 100,
                            title: {
                                display: true,
                                text: 'Percentage'
                            }
                        }
                    }
                }
            });

            // Zone Chart for Analytics
            const zoneCtx = document.getElementById('zoneChart').getContext('2d');
            const zoneChart = new Chart(zoneCtx, {
                type: 'bar',
                data: {
                    labels: ['Zone A', 'Zone B', 'Zone C', 'Zone D'],
                    datasets: [{
                        label: 'Tasks Completed',
                        data: [420, 380, 350, 310],
                        backgroundColor: [
                            'rgba(52, 152, 219, 0.7)',
                            'rgba(46, 204, 113, 0.7)',
                            'rgba(243, 156, 18, 0.7)',
                            'rgba(155, 89, 182, 0.7)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Number of Tasks'
                            }
                        }
                    }
                }
            });

            // Navigation functionality
            const menuItems = document.querySelectorAll('.sidebar-menu li');
            const sections = document.querySelectorAll('.section');
            
            menuItems.forEach(item => {
                item.addEventListener('click', function() {
                    const targetSection = this.getAttribute('data-section');
                    
                    // Update active menu item
                    menuItems.forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                    
                    // Show target section
                    sections.forEach(section => {
                        section.classList.remove('active');
                        if (section.id === targetSection) {
                            section.classList.add('active');
                        }
                    });
                });
            });

            // Task filter functionality
            const filterButtons = document.querySelectorAll('.filter-btn');
            const taskCards = document.querySelectorAll('.task-card');
            
            filterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const filter = this.getAttribute('data-filter');
                    
                    // Update active filter button
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');
                    
                    // Filter tasks
                    taskCards.forEach(card => {
                        if (filter === 'all' || card.getAttribute('data-status') === filter) {
                            card.style.display = 'flex';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                });
            });

            // Task detail modal functionality
            const taskModal = document.getElementById('taskModal');
            const taskModalBody = document.getElementById('taskModalBody');
            const closeTaskModal = document.getElementById('closeTaskModal');
            
            taskCards.forEach(card => {
                card.addEventListener('click', function() {
                    const taskId = this.getAttribute('data-id');
                    const task = tasksData.find(t => t.id == taskId);
                    
                    if (task) {
                        let statusClass = 'status-pending';
                        if (task.status === 'completed') statusClass = 'status-completed';
                        else if (task.status === 'overdue') statusClass = 'status-overdue';
                        else if (task.status === 'in-progress') statusClass = 'status-in-progress';
                        
                        let proofOfWorkHtml = '';
                        if (task.proofOfWork) {
                            proofOfWorkHtml = `
                                <div class="detail-row">
                                    <div class="detail-label">Proof of Work:</div>
                                    <div class="detail-value">
                                        <img src="${task.proofOfWork}" alt="Proof of Work" class="proof-image">
                                    </div>
                                </div>
                            `;
                        }
                        
                        taskModalBody.innerHTML = `
                            <div class="detail-row">
                                <div class="detail-label">Title:</div>
                                <div class="detail-value">${task.title}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Category:</div>
                                <div class="detail-value">${task.category}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Priority:</div>
                                <div class="detail-value">${task.priority}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Status:</div>
                                <div class="detail-value"><span class="status ${statusClass}">${task.status}</span></div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Reported:</div>
                                <div class="detail-value">${task.reported}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Assigned To:</div>
                                <div class="detail-value">${task.assignedTo}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Operator:</div>
                                <div class="detail-value">${task.operator}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Location:</div>
                                <div class="detail-value">${task.location}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">SLA:</div>
                                <div class="detail-value">${task.sla}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Time Remaining:</div>
                                <div class="detail-value">${task.timeRemaining}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Description:</div>
                                <div class="detail-value">${task.description}</div>
                            </div>
                            ${task.completionTime ? `
                            <div class="detail-row">
                                <div class="detail-label">Completion Time:</div>
                                <div class="detail-value">${task.completionTime}</div>
                            </div>
                            ` : ''}
                            ${proofOfWorkHtml}
                        `;
                        
                        taskModal.classList.add('active');
                    }
                });
            });
            
            closeTaskModal.addEventListener('click', function() {
                taskModal.classList.remove('active');
            });

            // Operator detail modal functionality
            const operatorModal = document.getElementById('operatorModal');
            const operatorModalBody = document.getElementById('operatorModalBody');
            const closeOperatorModal = document.getElementById('closeOperatorModal');
            const operatorCards = document.querySelectorAll('.operator-card');
            
            operatorCards.forEach(card => {
                card.addEventListener('click', function() {
                    const operatorId = this.getAttribute('data-id');
                    const operator = operatorsData.find(o => o.id == operatorId);
                    
                    if (operator) {
                        let statusClass = 'status-completed';
                        if (operator.status === 'Needs Review') statusClass = 'status-pending';
                        
                        operatorModalBody.innerHTML = `
                            <div class="detail-row">
                                <div class="detail-label">Name:</div>
                                <div class="detail-value">${operator.name}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Zone:</div>
                                <div class="detail-value">${operator.zone}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Email:</div>
                                <div class="detail-value">${operator.email}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Phone:</div>
                                <div class="detail-value">${operator.phone}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Join Date:</div>
                                <div class="detail-value">${operator.joinDate}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Tasks Managed:</div>
                                <div class="detail-value">${operator.tasksManaged}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Avg. Assignment Time:</div>
                                <div class="detail-value">${operator.avgAssignmentTime}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">SLA Miss Rate:</div>
                                <div class="detail-value">${operator.slaMissRate}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Status:</div>
                                <div class="detail-value"><span class="status ${statusClass}">${operator.status}</span></div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Performance:</div>
                                <div class="detail-value">${operator.performance}</div>
                            </div>
                        `;
                        
                        operatorModal.classList.add('active');
                    }
                });
            });
            
            closeOperatorModal.addEventListener('click', function() {
                operatorModal.classList.remove('active');
            });

            // Worker detail modal functionality
            const workerModal = document.getElementById('workerModal');
            const workerModalBody = document.getElementById('workerModalBody');
            const closeWorkerModal = document.getElementById('closeWorkerModal');
            const workerCards = document.querySelectorAll('.worker-card');
            
            workerCards.forEach(card => {
                card.addEventListener('click', function() {
                    const workerId = this.getAttribute('data-id');
                    const worker = workersData.find(w => w.id == workerId);
                    
                    if (worker) {
                        let statusClass = 'status-completed';
                        if (worker.status === 'Needs Improvement') statusClass = 'status-pending';
                        
                        workerModalBody.innerHTML = `
                            <div class="detail-row">
                                <div class="detail-label">Name:</div>
                                <div class="detail-value">${worker.name}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Operator:</div>
                                <div class="detail-value">${worker.operator}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Email:</div>
                                <div class="detail-value">${worker.email}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Phone:</div>
                                <div class="detail-value">${worker.phone}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Join Date:</div>
                                <div class="detail-value">${worker.joinDate}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Tasks Completed:</div>
                                <div class="detail-value">${worker.tasksCompleted}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">On-Time Rate:</div>
                                <div class="detail-value">${worker.onTimeRate}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Avg. Resolution Time:</div>
                                <div class="detail-value">${worker.avgResolutionTime}</div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Status:</div>
                                <div class="detail-value"><span class="status ${statusClass}">${worker.status}</span></div>
                            </div>
                            <div class="detail-row">
                                <div class="detail-label">Specialization:</div>
                                <div class="detail-value">${worker.specialization}</div>
                            </div>
                        `;
                        
                        workerModal.classList.add('active');
                    }
                });
            });
            
            closeWorkerModal.addEventListener('click', function() {
                workerModal.classList.remove('active');
            });

            // Refresh tasks functionality
            const refreshBtn = document.getElementById('refreshTasks');
            refreshBtn.addEventListener('click', function() {
                // Show loading state
                refreshBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Refreshing...';
                refreshBtn.disabled = true;
                
                // Simulate API call delay
                setTimeout(() => {
                    // In a real application, this would fetch new data from the server
                    // For this demo, we'll just show an alert
                    alert('Tasks refreshed successfully! New tasks have been loaded.');
                    
                    // Reset button state
                    refreshBtn.innerHTML = '<i class="fas fa-sync-alt"></i> Refresh Tasks';
                    refreshBtn.disabled = false;
                }, 1500);
            });

            // Add Operator functionality
            const addOperatorBtn = document.getElementById('addOperatorBtn');
            const addOperatorModal = document.getElementById('addOperatorModal');
            const closeAddOperatorModal = document.getElementById('closeAddOperatorModal');
            const cancelAddOperator = document.getElementById('cancelAddOperator');
            const addOperatorForm = document.getElementById('addOperatorForm');
            
            addOperatorBtn.addEventListener('click', function() {
                addOperatorModal.classList.add('active');
            });
            
            closeAddOperatorModal.addEventListener('click', function() {
                addOperatorModal.classList.remove('active');
            });
            
            cancelAddOperator.addEventListener('click', function() {
                addOperatorModal.classList.remove('active');
            });
            
            addOperatorForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Get form values
                const name = document.getElementById('operatorName').value;
                const email = document.getElementById('operatorEmail').value;
                const phone = document.getElementById('operatorPhone').value;
                const zone = document.getElementById('operatorZone').value;
                const password = document.getElementById('operatorPassword').value;
                
                // In a real application, this would send data to the server
                // For this demo, we'll just show a success message
                alert(`Operator ${name} has been successfully added to ${zone}!`);
                
                // Reset form and close modal
                addOperatorForm.reset();
                addOperatorModal.classList.remove('active');
                
                // In a real application, you would update the operators list here
            });

            // Close modals when clicking outside
            window.addEventListener('click', function(event) {
                if (event.target === taskModal) {
                    taskModal.classList.remove('active');
                }
                if (event.target === operatorModal) {
                    operatorModal.classList.remove('active');
                }
                if (event.target === workerModal) {
                    workerModal.classList.remove('active');
                }
                if (event.target === addOperatorModal) {
                    addOperatorModal.classList.remove('active');
                }
            });
        });
    </script>
</body>
</html>