<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Admin Dashboard | Setu Grievance Redressal Portal</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts: Poppins (for headings) & Inter (for body) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    
    <!-- Chart.js for analytics -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <script>
        // Custom Tailwind CSS configuration for the Government Dashboard theme (Green & Gold)
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        heading: ['Poppins', 'sans-serif'],
                    },
                    colors: {
                        'gov-primary': '#065f46',
                        'gov-primary-light': '#047857',
                        'gov-accent': '#facc15',
                        'gov-dark': '#1f2937',
                        'gov-light': '#f9fafb',
                        'primary-blue': '#1E3A8A',
                        'dark-text': '#1F2937',
                    },
                    boxShadow: {
                        'lifted': '0 10px 30px -5px rgba(0, 0, 0, 0.2)',
                        'glow': '0 0 15px rgba(6, 95, 70, 0.3)',
                    },
                    animation: {
                        'fade-in': 'fadeIn 0.5s ease-in-out',
                        'slide-up': 'slideUp 0.5s ease-out',
                        'pulse-slow': 'pulse 3s infinite',
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: '0' },
                            '100%': { opacity: '1' },
                        },
                        slideUp: {
                            '0%': { transform: 'translateY(10px)', opacity: '0' },
                            '100%': { transform: 'translateY(0)', opacity: '1' },
                        }
                    }
                }
            }
        }
    </script>
    <style>
        .form-input:focus {
            box-shadow: 0 0 0 3px rgba(6, 95, 70, 0.2);
            border-color: #065f46;
        }
        .body-bg {
            background-color: #f9fafb;
        }
        .header-bg {
             background-color: #1f2937;
        }
        .footer-bg {
             background-color: #1f2937;
        }
        .sidebar-bg {
            background-color: #111827;
            background-image: radial-gradient(circle at top right, rgba(6, 95, 70, 0.3), transparent 40%),
                              radial-gradient(circle at bottom left, rgba(30, 58, 138, 0.2), transparent 50%);
        }
        .card-shadow {
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .nav-item.active {
            background-color: rgba(6, 95, 70, 0.2);
            border-left: 4px solid #065f46;
        }
        .nav-item.active .nav-icon {
            color: #facc15;
        }
        .status-badge {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        .status-completed {
            background-color: #d1fae5;
            color: #065f46;
        }
        .status-in-progress {
            background-color: #fef3c7;
            color: #92400e;
        }
        .status-pending {
            background-color: #fee2e2;
            color: #991b1b;
        }
        .status-overdue {
            background-color: #f3f4f6;
            color: #6b7280;
        }
        .tab-button.active {
            background-color: #065f46;
            color: white;
        }
        .dashboard-section {
            display: none;
        }
        .dashboard-section.active {
            display: block;
        }
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
        }
        .modal-content {
            background-color: white;
            border-radius: 8px;
            width: 90%;
            max-width: 500px;
            padding: 24px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }
        .modal-title {
            font-size: 1.25rem;
            font-weight: 600;
        }
        .close-modal {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
        }
        .modal-body {
            margin-bottom: 20px;
        }
        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 12px;
        }
    </style>
</head>
<body class="body-bg text-dark-text font-sans antialiased flex flex-col min-h-screen">

    <!-- Top Bar -->
    <div class="header-bg text-gray-300 text-xs py-2 border-b border-gray-700">
        <div class="container mx-auto px-6 flex justify-between items-center">
            <span class="flex items-center">
                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                </svg>
                Official Use Only | Super Admin Dashboard
            </span>
            <span id="datetime" class="flex items-center">
                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <span id="datetime-text"></span>
            </span>
        </div>
    </div>

    <!-- Header -->
    <header class="header-bg sticky top-0 z-50 shadow-md border-b border-gray-700">
        <div class="container mx-auto px-6 py-3">
            <nav class="flex justify-between items-center">
                <a href="#" class="flex items-center gap-3">
                    <div class="h-12 w-12 bg-white rounded-full flex items-center justify-center">
                        <span class="text-gov-primary font-bold text-lg">सेतु</span>
                    </div>
                    <div>
                        <span class="text-2xl font-heading font-extrabold text-white">सेतु <span class="text-gray-400">Setu</span></span>
                        <p class="text-xs text-gray-400 font-semibold tracking-wide">Official Grievance Dashboard</p>
                    </div>
                </a>
                <div class="flex items-center gap-4">
                    <div class="flex items-center gap-2 text-white">
                        <div class="h-10 w-10 rounded-full bg-gov-primary flex items-center justify-center text-white font-bold">
                            SA
                        </div>
                        <div>
                            <p class="text-sm font-medium">Super Admin</p>
                            <p class="text-xs text-gray-400">Administrator</p>
                        </div>
                    </div>
                    <button id="logout-btn" class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white transition flex items-center">
                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                        </svg>
                        Logout
                    </button>
                </div>
            </nav>
        </div>
    </header>

    <!-- Main Content Area -->
    <div class="flex flex-1">
        <!-- Sidebar -->
        <div class="sidebar-bg text-white w-64 flex-shrink-0 hidden md:block">
            <div class="p-6 border-b border-gray-700">
                <h2 class="font-heading text-xl font-bold">Dashboard</h2>
                <p class="text-sm text-gray-400 mt-1">Super Admin Panel</p>
            </div>
            <nav class="p-4 space-y-2">
                <a href="#" class="nav-item active flex items-center p-3 rounded-lg text-white hover:bg-gray-800 transition" data-section="overview">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                    </svg>
                    Overview
                </a>
                <a href="#" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition" data-section="analytics">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                    </svg>
                    Analytics
                </a>
                <a href="#" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition" data-section="departments">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                    </svg>
                    Departments
                </a>
                <a href="#" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition" data-section="sla">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                    </svg>
                    SLA Management
                </a>
                <a href="#" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition" data-section="settings">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    System Settings
                </a>
                <a href="#" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition" data-section="users">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    User Management
                </a>
            </nav>
            
            <!-- System Status -->
            <div class="mt-8 p-4">
                <div class="p-4 bg-gray-900/50 rounded-lg">
                    <div class="flex items-center justify-between mb-2">
                        <h4 class="font-bold">System Status</h4>
                        <span class="flex items-center text-green-400 text-sm">
                            <span class="h-2 w-2 bg-green-400 rounded-full mr-1 animate-pulse-slow"></span>
                            Operational
                        </span>
                    </div>
                    <div class="text-xs text-gray-300 space-y-1">
                        <div class="flex justify-between">
                            <span>Last Updated:</span>
                            <span id="system-update-time">Today, 10:45 AM</span>
                        </div>
                        <div class="flex justify-between">
                            <span>Active Users:</span>
                            <span id="active-users-count">
                                <%-- <% 
                                Object stats = request.getAttribute("dashboardStats");
                                if (stats != null) {
                                    out.print(((DashboardStats) stats).getActiveUsers());
                                } else {
                                    out.print("42");
                                }
                                %> --%>0
                            </span>
                        </div>
                        <div class="flex justify-between">
                            <span>Grievances Today:</span>
                            <span id="today-grievances">
                               <%--  <% 
                                if (stats != null) {
                                    out.print(((DashboardStats) stats).getTodayGrievances());
                                } else {
                                    out.print("127");
                                }
                                %> --%>0
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <main class="flex-1 p-6 overflow-auto">
            <!-- Overview Section -->
            <div id="overview" class="dashboard-section active">
                <!-- Page Header -->
                <div class="mb-8">
                    <h1 class="font-heading text-3xl font-bold text-gov-dark">Super Admin Dashboard</h1>
                    <p class="text-gray-600 mt-2">Monitor and manage all departments and grievances across the system.</p>
                    
                    <!-- Date Range Filter -->
                    <div class="mt-4 flex items-center space-x-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Date Range</label>
                            <select id="date-range" class="form-input px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                <option value="7">Last 7 Days</option>
                                <option value="30" selected>Last 30 Days</option>
                                <option value="90">Last 90 Days</option>
                                <option value="365">Last Year</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Department</label>
                            <select id="department-filter" class="form-input px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                <option value="all">All Departments</option>
                                <option value="public-works">Public Works</option>
                                <option value="sanitation">Sanitation</option>
                                <option value="electricity">Electricity</option>
                                <option value="water-supply">Water Supply</option>
                                <option value="traffic">Traffic</option>
                            </select>
                        </div>
                        <div class="pt-5">
                            <button id="apply-filters" class="px-4 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition">Apply Filters</button>
                        </div>
                    </div>
                </div>

                <!-- Stats Overview -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-sm text-gray-500">Total Grievances</p>
                                <h3 class="text-2xl font-bold text-gov-dark mt-1" id="total-grievances">
                                    <%-- <% 
                                    if (stats != null) {
                                        out.print(((DashboardStats) stats).getTotalGrievances());
                                    } else {
                                        out.print("1,247");
                                    }
                                    %> --%>0
                                </h3>
                            </div>
                            <div class="p-3 bg-blue-50 rounded-lg">
                                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="flex items-center text-sm text-green-600" id="grievance-trend">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                </svg>
                                <span>0% increase from last week</span>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-sm text-gray-500">Resolved</p>
                                <h3 class="text-2xl font-bold text-gov-dark mt-1" id="resolved-grievances">
                                   <%--  <% 
                                    if (stats != null) {
                                        out.print(((DashboardStats) stats).getResolvedGrievances());
                                    } else {
                                        out.print("892");
                                    }
                                    %> --%>0
                                </h3>
                            </div>
                            <div class="p-3 bg-green-50 rounded-lg">
                                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="flex items-center text-sm text-green-600" id="resolved-trend">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                </svg>
                                <span>0% increase from last week</span>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-sm text-gray-500">Avg. Resolution Time</p>
                                <h3 class="text-2xl font-bold text-gov-dark mt-1" id="avg-resolution-time">
                                    <%-- <% 
                                    if (stats != null) {
                                        out.print(((DashboardStats) stats).getAvgResolutionTime() + " days");
                                    } else {
                                        out.print("2.4 days");
                                    }
                                    %> --%>0 days
                                </h3>
                            </div>
                            <div class="p-3 bg-yellow-50 rounded-lg">
                                <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="flex items-center text-sm text-red-600" id="resolution-trend">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                                </svg>
                                <span>0% increase from last week</span>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-sm text-gray-500">SLA Compliance</p>
                                <h3 class="text-2xl font-bold text-gov-dark mt-1" id="sla-compliance">
                                   <%--  <% 
                                    if (stats != null) {
                                        out.print(((DashboardStats) stats).getSlaCompliance() + "%");
                                    } else {
                                        out.print("87%");
                                    }
                                    %> --%>0%
                                </h3>
                            </div>
                            <div class="p-3 bg-purple-50 rounded-lg">
                                <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                                </svg>
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="flex items-center text-sm text-green-600" id="sla-trend">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                </svg>
                                <span>0% increase from last week</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts and Analytics -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                    <!-- Grievance Trends Chart -->
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Grievance Trends</h3>
                        <div class="h-80">
                            <canvas id="grievanceTrendsChart"></canvas>
                        </div>
                    </div>

                    <!-- Department Performance Chart -->
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Department Performance</h3>
                        <div class="h-80">
                            <canvas id="departmentPerformanceChart"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Recent Grievances and Department Overview -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                    <!-- Recent Grievances -->
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-center mb-6">
                            <h3 class="font-heading text-lg font-bold text-gov-dark">Recent Grievances</h3>
                            <button id="view-all-grievances" class="text-sm text-gov-primary font-medium hover:underline">View All</button>
                        </div>
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead>
                                    <tr>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Department</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200" id="grievances-table-body">
                                    <%-- <%
                                    List<Grievance> recentGrievances = (List<Grievance>) request.getAttribute("recentGrievances");
                                    if (recentGrievances != null && !recentGrievances.isEmpty()) {
                                        for (Grievance grievance : recentGrievances) {
                                    %>
                                        <tr>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900"><%= grievance.getId() %></td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= grievance.getCategory() %></td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= grievance.getDepartment() %></td>
                                            <td class="px-4 py-3 whitespace-nowrap">
                                                <span class="status-badge status-<%= grievance.getStatus() %>"><%= grievance.getStatus() %></span>
                                            </td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                                <button class="text-gov-primary hover:underline view-grievance" data-id="<%= grievance.getId() %>">View</button>
                                            </td>
                                        </tr>
                                    <%
                                        }
                                    } else {
                                    // Fallback to sample data if no data from servlet
                                    %> --%>
                                        <tr>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900">GRV-2025-0000</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">Pothole</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">Public Works</td>
                                            <td class="px-4 py-3 whitespace-nowrap">
                                                <span class="status-badge status-in-progress">in progress (not sure)</span>
                                            </td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                                <button class="text-gov-primary hover:underline view-grievance" data-id="GRV-2023-00124">View</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900">GRV-2025-00000</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">Broken Streetlight</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">Electricity</td>
                                            <td class="px-4 py-3 whitespace-nowrap">
                                                <span class="status-badge status-completed">completed (not sure)</span>
                                            </td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                                <button class="text-gov-primary hover:underline view-grievance" data-id="GRV-2023-00123">View</button>
                                            </td>
                                        </tr>
                                    <%-- <%
                                    }
                                    %> --%>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Department Overview -->
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-center mb-6">
                            <h3 class="font-heading text-lg font-bold text-gov-dark">Department Overview</h3>
                            <button id="manage-departments" class="text-sm text-gov-primary font-medium hover:underline">Manage</button>
                        </div>
                        <div class="space-y-4" id="departments-list">
                            <%-- <%
                            List<Department> departments = (List<Department>) request.getAttribute("departments");
                            if (departments != null && !departments.isEmpty()) {
                                for (Department dept : departments) {
                            %>
                                <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 rounded-lg bg-blue-100 flex items-center justify-center text-blue-600 font-bold mr-3">
                                            <%= dept.getCode() != null ? dept.getCode() : "D" %>
                                        </div>
                                        <div>
                                            <h4 class="font-medium text-gray-900"><%= dept.getName() %></h4>
                                            <p class="text-sm text-gray-500"><%= dept.getActiveGrievances() %> active grievances</p>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="font-medium text-gray-900"><%= dept.getSlaCompliance() %>%</p>
                                        <p class="text-sm text-gray-500">SLA Compliance</p>
                                    </div>
                                </div>
                            <%
                                }
                            } else {
                            // Fallback to sample data
                            %> --%>
                                <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 rounded-lg bg-blue-100 flex items-center justify-center text-blue-600 font-bold mr-3">
                                            PW
                                        </div>
                                        <div>
                                            <h4 class="font-medium text-gray-900">Public Works</h4>
                                            <p class="text-sm text-gray-500">0 active grievances</p>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="font-medium text-gray-900">0%</p>
                                        <p class="text-sm text-gray-500">SLA Compliance</p>
                                    </div>
                                </div>
                                <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="h-10 w-10 rounded-lg bg-green-100 flex items-center justify-center text-green-600 font-bold mr-3">
                                            SN
                                        </div>
                                        <div>
                                            <h4 class="font-medium text-gray-900">Sanitation</h4>
                                            <p class="text-sm text-gray-500">0 active grievances</p>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="font-medium text-gray-900">0%</p>
                                        <p class="text-sm text-gray-500">SLA Compliance</p>
                                    </div>
                                </div>
                            <%-- <%
                            }
                            %> --%>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="bg-white rounded-xl p-6 card-shadow">
                    <h3 class="font-heading text-lg font-bold text-gov-dark mb-6">Quick Actions</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                        <button id="manage-users-btn" class="flex flex-col items-center justify-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition">
                            <div class="p-3 bg-blue-50 rounded-lg mb-3">
                                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                                </svg>
                            </div>
                            <span class="font-medium text-gray-900 text-center">Manage Users</span>
                        </button>
                        <button id="sla-settings-btn" class="flex flex-col items-center justify-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition">
                            <div class="p-3 bg-green-50 rounded-lg mb-3">
                                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                                </svg>
                            </div>
                            <span class="font-medium text-gray-900 text-center">SLA Settings</span>
                        </button>
                        <button id="generate-reports-btn" class="flex flex-col items-center justify-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition">
                            <div class="p-3 bg-yellow-50 rounded-lg mb-3">
                                <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                                </svg>
                            </div>
                            <span class="font-medium text-gray-900 text-center">Generate Reports</span>
                        </button>
                        <button id="system-settings-btn" class="flex flex-col items-center justify-center p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition">
                            <div class="p-3 bg-purple-50 rounded-lg mb-3">
                                <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                </svg>
                            </div>
                            <span class="font-medium text-gray-900 text-center">System Settings</span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Analytics Section -->
            <div id="analytics" class="dashboard-section">
                <!-- Page Header -->
                <div class="mb-8">
                    <h1 class="font-heading text-3xl font-bold text-gov-dark">Analytics Dashboard</h1>
                    <p class="text-gray-600 mt-2">Deep insights into grievance patterns, performance metrics, and system utilization.</p>
                    
                    <!-- Date Range Filter -->
                    <div class="mt-4 flex flex-wrap items-center gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Date Range</label>
                            <select id="analytics-date-range" class="form-input px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                <option value="7">Last 7 Days</option>
                                <option value="30" selected>Last 30 Days</option>
                                <option value="90">Last 90 Days</option>
                                <option value="365">Last Year</option>
                                <option value="custom">Custom Range</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Department</label>
                            <select id="analytics-department-filter" class="form-input px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                <option value="all">All Departments</option>
                                <option value="public-works">Public Works</option>
                                <option value="sanitation">Sanitation</option>
                                <option value="electricity">Electricity</option>
                                <option value="water-supply">Water Supply</option>
                                <option value="traffic">Traffic</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Grievance Type</label>
                            <select id="grievance-type-filter" class="form-input px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                <option value="all">All Types</option>
                                <option value="pothole">Potholes</option>
                                <option value="streetlight">Streetlights</option>
                                <option value="garbage">Garbage Accumulation</option>
                                <option value="water">Water Issues</option>
                                <option value="traffic">Traffic Issues</option>
                            </select>
                        </div>
                        <div class="pt-5">
                            <button id="analytics-apply-filters" class="px-4 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition">Apply Filters</button>
                            <button id="export-data" class="px-4 py-2 bg-gov-accent text-gov-dark font-medium rounded-lg hover:bg-yellow-500 transition ml-2">
                                <svg class="w-4 h-4 inline mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                </svg>
                                Export Data
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Tabs for different analytics views -->
                <div class="mb-6">
                    <div class="border-b border-gray-200">
                        <nav class="-mb-px flex space-x-8">
                            <button class="tab-button py-2 px-1 border-b-2 font-medium text-sm border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 transition active" data-tab="overview">
                                Overview
                            </button>
                            <button class="tab-button py-2 px-1 border-b-2 font-medium text-sm border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 transition" data-tab="performance">
                                Performance
                            </button>
                            <button class="tab-button py-2 px-1 border-b-2 font-medium text-sm border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 transition" data-tab="geographical">
                                Geographical
                            </button>
                            <button class="tab-button py-2 px-1 border-b-2 font-medium text-sm border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 transition" data-tab="trends">
                                Trends
                            </button>
                        </nav>
                    </div>
                </div>

                <!-- Tab Content -->
                <div id="analytics-tab-content">
                    <!-- Overview Tab -->
                    <div id="analytics-overview-tab" class="analytics-tab-panel active">
                        <!-- Key Metrics -->
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <p class="text-sm text-gray-500">Total Grievances</p>
                                        <h3 class="text-2xl font-bold text-gov-dark mt-1" id="analytics-total-grievances">0</h3>
                                    </div>
                                    <div class="p-3 bg-blue-50 rounded-lg">
                                        <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="flex items-center text-sm text-green-600" id="analytics-grievance-trend">
                                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                        </svg>
                                        <span>0% increase from last month</span>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <p class="text-sm text-gray-500">Avg. Resolution Time</p>
                                        <h3 class="text-2xl font-bold text-gov-dark mt-1" id="analytics-avg-resolution-time">0 days</h3>
                                    </div>
                                    <div class="p-3 bg-yellow-50 rounded-lg">
                                        <svg class="w-6 h-6 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="flex items-center text-sm text-red-600" id="analytics-resolution-trend">
                                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                                        </svg>
                                        <span>0% increase from last month</span>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <p class="text-sm text-gray-500">SLA Compliance</p>
                                        <h3 class="text-2xl font-bold text-gov-dark mt-1" id="analytics-sla-compliance">0%</h3>
                                    </div>
                                    <div class="p-3 bg-green-50 rounded-lg">
                                        <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="flex items-center text-sm text-green-600" id="analytics-sla-trend">
                                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                        </svg>
                                        <span>0% increase from last month</span>
                                    </div>
                                </div>
                            </div>

                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <p class="text-sm text-gray-500">Citizen Satisfaction</p>
                                        <h3 class="text-2xl font-bold text-gov-dark mt-1" id="analytics-satisfaction-rate">0/5</h3>
                                    </div>
                                    <div class="p-3 bg-purple-50 rounded-lg">
                                        <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10h4.764a2 2 0 011.789 2.894l-3.5 7A2 2 0 0115.263 21h-4.017c-.163 0-.326-.02-.485-.06L7 20m7-10V5a2 2 0 00-2-2h-.095c-.5 0-.905.405-.905.905 0 .714-.211 1.412-.608 2.006L7 11v9m7-10h-2M7 20H5a2 2 0 01-2-2v-6a2 2 0 012-2h2.5"></path>
                                        </svg>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <div class="flex items-center text-sm text-green-600" id="analytics-satisfaction-trend">
                                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                        </svg>
                                        <span>0% increase from last month</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Charts Row 1 -->
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                            <!-- Grievance Trends Chart -->
                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Grievance Trends</h3>
                                <div class="h-80">
                                    <canvas id="analyticsGrievanceTrendsChart"></canvas>
                                </div>
                            </div>

                            <!-- Category Distribution Chart -->
                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Grievance Categories</h3>
                                <div class="h-80">
                                    <canvas id="categoryDistributionChart"></canvas>
                                </div>
                            </div>
                        </div>

                        <!-- Charts Row 2 -->
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                            <!-- Status Distribution Chart -->
                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Grievance Status Distribution</h3>
                                <div class="h-80">
                                    <canvas id="statusDistributionChart"></canvas>
                                </div>
                            </div>

                            <!-- Department Performance Chart -->
                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Department Performance</h3>
                                <div class="h-80">
                                    <canvas id="analyticsDepartmentPerformanceChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Performance Tab -->
                    <div id="analytics-performance-tab" class="analytics-tab-panel hidden">
                        <!-- Performance content remains the same -->
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                            <!-- Resolution Time by Department -->
                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Resolution Time by Department (Days)</h3>
                                <div class="h-80">
                                    <canvas id="resolutionTimeChart"></canvas>
                                </div>
                            </div>

                            <!-- SLA Compliance Over Time -->
                            <div class="bg-white rounded-xl p-6 card-shadow">
                                <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">SLA Compliance Over Time</h3>
                                <div class="h-80">
                                    <canvas id="slaComplianceChart"></canvas>
                                </div>
                            </div>
                        </div>

                        <!-- Performance Metrics Table -->
                        <div class="bg-white rounded-xl p-6 card-shadow mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Department Performance Metrics</h3>
                            <div class="overflow-x-auto">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead>
                                        <tr>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Department</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total Grievances</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Resolved</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Avg. Resolution Time</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">SLA Compliance</th>
                                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Citizen Rating</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-200" id="performance-table-body">
                                        <!-- Performance data would be populated similarly -->
                                        <tr>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900">Public Works</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">000</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">000</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">0.0 days</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">0%</td>
                                            <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">0/5</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Other analytics tabs (Geographical, Trends) would follow the same pattern -->
                    <!-- For brevity, keeping the structure but not showing all content -->
                </div>
            </div>

            <!-- Departments Section -->
            <div id="departments" class="dashboard-section">
                <!-- Page Header -->
                <div class="mb-8">
                    <h1 class="font-heading text-3xl font-bold text-gov-dark">Department Management</h1>
                    <p class="text-gray-600 mt-2">Manage departments, assign staff, and monitor performance.</p>
                </div>

                <!-- Department Actions -->
                <div class="bg-white rounded-xl p-6 card-shadow mb-8">
                    <div class="flex justify-between items-center mb-6">
                        <h3 class="font-heading text-lg font-bold text-gov-dark">Departments</h3>
                        <a href="addDepartment.jsp" > <button id="add-department-btn" class="px-4 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition flex items-center">
                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                            Add Department
                        </button></a>
                    </div>

                    <!-- Departments List -->
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead>
                                <tr>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Department</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Head</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Staff Count</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Active Grievances</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">SLA Compliance</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200" id="departments-management-table">
                                <%-- <%
                                List<Department> allDepartments = (List<Department>) request.getAttribute("allDepartments");
                                if (allDepartments != null && !allDepartments.isEmpty()) {
                                    for (Department dept : allDepartments) {
                                %>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900"><%= dept.getName() %></td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= dept.getDepartmentHead() != null ? dept.getDepartmentHead() : "Not assigned" %></td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= dept.getStaffCount() %></td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= dept.getActiveGrievances() %></td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= dept.getSlaCompliance() %>%</td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                            <button class="text-gov-primary hover:underline mr-2">Edit</button>
                                            <button class="text-red-600 hover:underline">Delete</button>
                                        </td>
                                    </tr>
                                <%
                                    }
                                } else {
                                %> --%>
                                    <tr>
                                        <td colspan="6" class="px-4 py-3 text-center text-sm text-gray-500">No departments found</td>
                                    </tr>
                               <%--  <%
                                }
                                %> --%>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Department Performance -->
                <div class="bg-white rounded-xl p-6 card-shadow">
                    <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Department Performance</h3>
                    <div class="h-80">
                        <canvas id="departmentsPerformanceChart"></canvas>
                    </div>
                </div>
            </div>

            <!-- SLA Management Section -->
            <div id="sla" class="dashboard-section">
                <!-- Page Header -->
                <div class="mb-8">
                    <h1 class="font-heading text-3xl font-bold text-gov-dark">SLA Management</h1>
                    <p class="text-gray-600 mt-2">Configure and monitor Service Level Agreements for different grievance categories.</p>
                </div>

                <!-- SLA Configuration -->
                <div class="bg-white rounded-xl p-6 card-shadow mb-8">
                    <div class="flex justify-between items-center mb-6">
                        <h3 class="font-heading text-lg font-bold text-gov-dark">SLA Configuration</h3>
                        <button id="add-sla-btn" class="px-4 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition flex items-center">
                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                            Add SLA Rule
                        </button>
                    </div>

                    <!-- SLA Rules Table -->
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead>
                                <tr>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Grievance Category</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Department</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">SLA Time</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Escalation Level</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200" id="sla-rules-table">
                                <!-- SLA data would be populated similarly -->
                                <tr>
                                    <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900">Potholes</td>
                                    <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">Public Works</td>
                                    <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">7 days</td>
                                    <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">Level 2</td>
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <span class="status-badge status-completed">Active</span>
                                    </td>
                                    <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                        <button class="text-gov-primary hover:underline mr-2">Edit</button>
                                        <button class="text-red-600 hover:underline">Disable</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- SLA Compliance Overview -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">SLA Compliance by Department</h3>
                        <div class="h-80">
                            <canvas id="slaComplianceByDeptChart"></canvas>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">SLA Compliance Trends</h3>
                        <div class="h-80">
                            <canvas id="slaTrendsChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- System Settings Section -->
            <div id="settings" class="dashboard-section">
                <!-- Page Header -->
                <div class="mb-8">
                    <h1 class="font-heading text-3xl font-bold text-gov-dark">System Settings</h1>
                    <p class="text-gray-600 mt-2">Configure system-wide settings and preferences.</p>
                </div>

                <!-- Settings Cards -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
                    <!-- General Settings -->
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">General Settings</h3>
                        <div class="space-y-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">System Name</label>
                                <input type="text" class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg" value="Setu Grievance Redressal System">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Default Language</label>
                                <select class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg">
                                    <option>English</option>
                                    <option>Hindi</option>
                                    <option>Marathi</option>
                                    <option>Gujarati</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Auto-logout Time (minutes)</label>
                                <input type="number" class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg" value="30">
                            </div>
                            <div class="flex items-center">
                                <input type="checkbox" class="form-checkbox text-gov-primary" id="email-notifications" checked>
                                <label for="email-notifications" class="ml-2 text-sm text-gray-700">Enable Email Notifications</label>
                            </div>
                        </div>
                        <div class="mt-6">
                            <button class="px-4 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition">Save General Settings</button>
                        </div>
                    </div>

                    <!-- Notification Settings -->
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Notification Settings</h3>
                        <div class="space-y-4">
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm font-medium text-gray-700">New Grievance Alerts</p>
                                    <p class="text-xs text-gray-500">Notify when new grievances are submitted</p>
                                </div>
                                <input type="checkbox" class="form-checkbox text-gov-primary" checked>
                            </div>
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm font-medium text-gray-700">SLA Breach Alerts</p>
                                    <p class="text-xs text-gray-500">Notify when SLAs are about to be breached</p>
                                </div>
                                <input type="checkbox" class="form-checkbox text-gov-primary" checked>
                            </div>
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm font-medium text-gray-700">Escalation Alerts</p>
                                    <p class="text-xs text-gray-500">Notify when grievances are escalated</p>
                                </div>
                                <input type="checkbox" class="form-checkbox text-gov-primary" checked>
                            </div>
                            <div class="flex items-center justify-between">
                                <div>
                                    <p class="text-sm font-medium text-gray-700">Resolution Notifications</p>
                                    <p class="text-xs text-gray-500">Notify when grievances are resolved</p>
                                </div>
                                <input type="checkbox" class="form-checkbox text-gov-primary">
                            </div>
                        </div>
                        <div class="mt-6">
                            <button class="px-4 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition">Save Notification Settings</button>
                        </div>
                    </div>
                </div>

                <!-- System Information -->
                <div class="bg-white rounded-xl p-6 card-shadow">
                    <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">System Information</h3>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <h4 class="font-medium text-gray-700 mb-2">System Status</h4>
                            <div class="space-y-2">
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">Database</span>
                                    <span class="text-sm font-medium text-green-600">Operational</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">API Services</span>
                                    <span class="text-sm font-medium text-green-600">Operational</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">File Storage</span>
                                    <span class="text-sm font-medium text-green-600">Operational</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">Email Service</span>
                                    <span class="text-sm font-medium text-green-600">Operational</span>
                                </div>
                            </div>
                        </div>
                        <div>
                            <h4 class="font-medium text-gray-700 mb-2">System Metrics</h4>
                            <div class="space-y-2">
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">Uptime</span>
                                    <span class="text-sm font-medium">99.8%</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">Response Time</span>
                                    <span class="text-sm font-medium">128ms</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">Storage Used</span>
                                    <span class="text-sm font-medium">0%(no data found)</span>
                                </div>
                                <div class="flex justify-between">
                                    <span class="text-sm text-gray-500">Last Backup</span>
                                    <span class="text-sm font-medium">Today, null AM/PM</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- User Management Section -->
            <div id="users" class="dashboard-section">
                <!-- Page Header -->
                <div class="mb-8">
                    <h1 class="font-heading text-3xl font-bold text-gov-dark">User Management</h1>
                    <p class="text-gray-600 mt-2">Manage system users, roles, and permissions.</p>
                </div>

                <!-- User Actions -->
                <div class="bg-white rounded-xl p-6 card-shadow mb-8">
                    <div class="flex justify-between items-center mb-6">
                        <h3 class="font-heading text-lg font-bold text-gov-dark">Users</h3>
                        <a href="addDepAdmin.jsp" > <button id="add-user-btn" class="px-4 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition flex items-center">
                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                            Add User
                        </button></a>
                    </div>

                    <!-- Users Table -->
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead>
                                <tr>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">User</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Role</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Department</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Last Login</th>
                                    <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-200" id="users-management-table">
                               <%--  <%
                                List<User> users = (List<User>) request.getAttribute("users");
                                if (users != null && !users.isEmpty()) {
                                    for (User user : users) {
                                %>
                                    <tr>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm font-medium text-gray-900"><%= user.getName() %></td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= user.getRole() %></td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500"><%= user.getDepartment() != null ? user.getDepartment() : "N/A" %></td>
                                        <td class="px-4 py-3 whitespace-nowrap">
                                            <span class="status-badge status-<%= user.getStatus() %>"><%= user.getStatus() %></span>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                            <%= user.getLastLogin() != null ? user.getLastLogin().toString() : "Never" %>
                                        </td>
                                        <td class="px-4 py-3 whitespace-nowrap text-sm text-gray-500">
                                            <button class="text-gov-primary hover:underline mr-2">Edit</button>
                                            <button class="text-red-600 hover:underline">Deactivate</button>
                                        </td>
                                    </tr>
                                <%
                                    }
                                } else {
                                %> --%>
                                    <tr>
                                        <td colspan="6" class="px-4 py-3 text-center text-sm text-gray-500">No users found</td>
                                    </tr>
                               <%--  <%
                                }
                                %> --%>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- User Statistics -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-sm text-gray-500">Total Users</p>
                                <h3 class="text-2xl font-bold text-gov-dark mt-1">0</h3>
                            </div>
                            <div class="p-3 bg-blue-50 rounded-lg">
                                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-sm text-gray-500">Active Users</p>
                                <h3 class="text-2xl font-bold text-gov-dark mt-1">0</h3>
                            </div>
                            <div class="p-3 bg-green-50 rounded-lg">
                                <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <div class="flex justify-between items-start">
                            <div>
                                <p class="text-sm text-gray-500">Roles Distribution</p>
                                <h3 class="text-2xl font-bold text-gov-dark mt-1">5 Types</h3>
                            </div>
                            <div class="p-3 bg-purple-50 rounded-lg">
                                <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Footer -->
    <footer class="footer-bg text-white mt-auto">
        <div class="container mx-auto px-6 py-8">
            <div class="border-t border-gray-700 pt-6 text-center text-gray-400 text-sm">
                <p>Designed, Developed and Hosted by Team SETU</p>
                <p>&copy; 2025 All Rights Reserved. Last Updated: <span id="footer-date"></span></p>
            </div>
        </div>
    </footer>

    <!-- All modals remain the same -->
    <div id="user-management-modal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">User Management</h3>
                <button class="close-modal">&times;</button>
            </div>
            <div class="modal-body">
                <p>User management functionality would go here. This would include:</p>
                <ul class="list-disc pl-5 mt-2">
                    <li>Adding new users</li>
                    <li>Editing user permissions</li>
                    <li>Deactivating users</li>
                    <li>Resetting passwords</li>
                </ul>
            </div>
            <div class="modal-footer">
                <button class="px-4 py-2 bg-gray-300 rounded-lg hover:bg-gray-400 transition close-modal">Cancel</button>
                <button class="px-4 py-2 bg-gov-primary text-white rounded-lg hover:bg-green-800 transition">Save Changes</button>
            </div>
        </div>
    </div>

    <!-- Other modals (sla-settings, report-generation, system-settings, export) remain the same -->

    <script>
        // Basic initialization functions
        function updateDateTime() {
            const now = new Date();
            const options = { 
                weekday: 'long', 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric', 
                hour: '2-digit', 
                minute: '2-digit', 
                timeZone: 'Asia/Kolkata', 
                hour12: true 
            };
            
            const dtElement = document.getElementById('datetime-text');
            const footerDateElement = document.getElementById('footer-date');
            const systemUpdateTime = document.getElementById('system-update-time');
            
            if (dtElement) {
                dtElement.textContent = now.toLocaleDateString('en-IN', options) + ' IST';
            }
            
            if (footerDateElement) {
                footerDateElement.textContent = now.toLocaleDateString('en-IN', { 
                    weekday: 'long', 
                    year: 'numeric', 
                    month: 'long', 
                    day: 'numeric' 
                });
            }

            if (systemUpdateTime) {
                systemUpdateTime.textContent = 'Today, ' + now.toLocaleTimeString('en-IN', { 
                    hour: '2-digit', 
                    minute: '2-digit',
                    hour12: true 
                });
            }
        }

        function initializeNavigation() {
            const navItems = document.querySelectorAll('.nav-item');
            const sections = document.querySelectorAll('.dashboard-section');
            
            navItems.forEach(item => {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    const targetSection = this.getAttribute('data-section');
                    
                    // Remove active class from all nav items
                    navItems.forEach(navItem => {
                        navItem.classList.remove('active');
                        navItem.classList.remove('text-white');
                        navItem.classList.add('text-gray-300');
                    });
                    
                    // Remove active class from all sections
                    sections.forEach(section => {
                        section.classList.remove('active');
                    });
                    
                    // Add active class to clicked nav item
                    this.classList.add('active');
                    this.classList.add('text-white');
                    this.classList.remove('text-gray-300');
                    
                    // Show corresponding section
                    const targetElement = document.getElementById(targetSection);
                    if (targetElement) {
                        targetElement.classList.add('active');
                    }
                });
            });
        }

        function initializeCharts() {
            // Initialize all charts with static data
            // In real implementation, you would fetch data from servlet via AJAX
            
            // Grievance Trends Chart
            const grievanceTrendsCtx = document.getElementById('grievanceTrendsChart');
            if (grievanceTrendsCtx) {
                new Chart(grievanceTrendsCtx.getContext('2d'), {
                    type: 'line',
                    data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                        datasets: [
                            {
                                label: 'Grievances Reported',
                                data: [65, 78, 66, 82, 95, 112, 98, 87, 105, 127],
                                borderColor: '#065f46',
                                backgroundColor: 'rgba(6, 95, 70, 0.1)',
                                tension: 0.4,
                                fill: true
                            },
                            {
                                label: 'Grievances Resolved',
                                data: [45, 52, 48, 61, 72, 85, 78, 70, 82, 89],
                                borderColor: '#facc15',
                                backgroundColor: 'rgba(250, 204, 21, 0.1)',
                                tension: 0.4,
                                fill: true
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false
                    }
                });
            }

            // Initialize other charts similarly...
            // Department Performance Chart
            const departmentPerformanceCtx = document.getElementById('departmentPerformanceChart');
            if (departmentPerformanceCtx) {
                new Chart(departmentPerformanceCtx.getContext('2d'), {
                    type: 'bar',
                    data: {
                        labels: ['Public Works', 'Sanitation', 'Electricity', 'Water Supply', 'Traffic'],
                        datasets: [{
                            label: 'SLA Compliance (%)',
                            data: [78, 92, 85, 88, 76],
                            backgroundColor: 'rgba(6, 95, 70, 0.7)',
                            borderColor: '#065f46',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                max: 100
                            }
                        }
                    }
                });
            }
        }

        function initializeLogoutButton() {
            const logoutBtn = document.getElementById('logout-btn');
            if (logoutBtn) {
                logoutBtn.addEventListener('click', function() {
                    if (confirm('Are you sure you want to logout?')) {
                        window.location.href = 'logout';
                    }
                });
            }
        }

        // Initialize the application when DOM is loaded
        document.addEventListener('DOMContentLoaded', function() {
            updateDateTime();
            initializeNavigation();
            initializeCharts();
            initializeLogoutButton();
            
            // Update datetime every minute
            setInterval(updateDateTime, 60000);
        });
    </script>
</body>
</html>