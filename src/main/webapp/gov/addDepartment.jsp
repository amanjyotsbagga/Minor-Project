<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Department | Setu Grievance Redressal Portal</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts: Poppins (for headings) & Inter (for body) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    
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
        .department-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 1.5rem;
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
                <a href="super-admin-dashboard.jsp" class="flex items-center gap-3">
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
                <a href="super-admin-dashboard.jsp" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                    </svg>
                    Overview
                </a>
                <a href="addDepAdmin.jsp" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                    </svg>
                    Add User
                </a>
                <a href="addDepartment.jsp" class="nav-item active flex items-center p-3 rounded-lg text-white hover:bg-gray-800 transition">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
                    </svg>
                    Add Department
                </a>
                <a href="super-admin-dashboard.jsp" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                    </svg>
                    Department Management
                </a>
            </nav>
        </div>

        <!-- Main Content -->
        <main class="flex-1 p-6 overflow-auto">
            <!-- Page Header -->
            <div class="mb-8">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="font-heading text-3xl font-bold text-gov-dark">Add New Department</h1>
                        <p class="text-gray-600 mt-2">Create new government departments to organize and manage grievances efficiently.</p>
                    </div>
                    <a href="super-admin-dashboard.jsp" class="px-4 py-2 bg-gray-500 text-white font-medium rounded-lg hover:bg-gray-600 transition flex items-center">
                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                        </svg>
                        Back to Departments
                    </a>
                </div>
            </div>

            <!-- Add Department Form -->
            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-xl p-6 card-shadow">
                    <form id="add-department-form" action="AddDepartmentServlet" method="POST">
                        <!-- Department Basic Information -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Department Information</h3>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Department Name -->
                                <div class="md:col-span-2">
                                    <label for="department_name" class="block text-sm font-medium text-gray-700 mb-1">Department Name <span class="text-red-500">*</span></label>
                                    <input type="text" id="department_name" name="department_name" required
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                           placeholder="Enter department name"
                                           onkeyup="generateDepartmentCode()">
                                    <p class="text-xs text-gray-500 mt-1">Official name of the government department</p>
                                </div>

                                <!-- Department Code -->
                                <div>
                                    <label for="department_code" class="block text-sm font-medium text-gray-700 mb-1">Department Code</label>
                                    <input type="text" id="department_code" name="department_code"
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                           placeholder="e.g., PW, SN, EL"
                                           maxlength="5">
                                    <p class="text-xs text-gray-500 mt-1">Short code (2-5 characters) for department identification</p>
                                </div>

                                <!-- Department Head -->
                                <div>
                                    <label for="department_head_id" class="block text-sm font-medium text-gray-700 mb-1">Department Head</label>
                                    <select id="department_head_id" name="department_head_id"
                                            class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                        <option value="">Select Department Head</option>
                                       <%--  <%
                                        List<User> departmentAdmins = (List<User>) request.getAttribute("departmentAdmins");
                                        if (departmentAdmins != null && !departmentAdmins.isEmpty()) {
                                            for (User admin : departmentAdmins) {
                                        %>
                                            <option value="<%= admin.getUserId() %>"><%= admin.getFullName() %> (<%= admin.getEmail() %>)</option>
                                        <%
                                            }
                                        } else {
                                        %> --%>
                                            <option value="1">Rajesh Kumar (rajesh.kumar@gov.in)</option>
                                            <option value="2">Priya Sharma (priya.sharma@gov.in)</option>
                                            <option value="3">Amit Patel (amit.patel@gov.in)</option>
                                        <%-- <%
                                        }
                                        %> --%>
                                    </select>
                                    <p class="text-xs text-gray-500 mt-1">Optional - Can assign department head later</p>
                                </div>
                            </div>
                        </div>

                        <!-- Department Description -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Department Description</h3>
                            
                            <div>
                                <label for="description" class="block text-sm font-medium text-gray-700 mb-1">Description</label>
                                <textarea id="description" name="description" rows="4"
                                          class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                          placeholder="Describe the department's responsibilities, scope, and functions..."></textarea>
                                <p class="text-xs text-gray-500 mt-1">Detailed description of department functions and responsibilities</p>
                            </div>
                        </div>

                        <!-- Department Icon and Color -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Department Branding</h3>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Department Color -->
                                <div>
                                    <label for="department_color" class="block text-sm font-medium text-gray-700 mb-1">Department Color</label>
                                    <div class="flex items-center space-x-4">
                                        <input type="color" id="department_color" name="department_color" value="#065f46"
                                               class="w-12 h-12 rounded-lg border border-gray-300 cursor-pointer">
                                        <div class="flex-1">
                                            <input type="text" id="department_color_hex" value="#065f46"
                                                   class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                                   readonly>
                                        </div>
                                    </div>
                                    <p class="text-xs text-gray-500 mt-1">Color theme for department in dashboards and reports</p>
                                </div>

                                <!-- Preview -->
                                <div>
                                    <label class="block text-sm font-medium text-gray-700 mb-1">Department Preview</label>
                                    <div class="flex items-center p-4 border border-gray-200 rounded-lg">
                                        <div id="department-icon-preview" class="department-icon mr-4 bg-green-100 text-green-800">
                                            DC
                                        </div>
                                        <div>
                                            <h4 id="department-name-preview" class="font-medium text-gray-900">Department Name</h4>
                                            <p id="department-code-preview" class="text-sm text-gray-500">Code: DC</p>
                                        </div>
                                    </div>
                                    <p class="text-xs text-gray-500 mt-1">Preview of how department will appear in the system</p>
                                </div>
                            </div>
                        </div>

                        <!-- Service Categories -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Service Categories</h3>
                            
                            <div class="space-y-4">
                                <p class="text-sm text-gray-600">Select the types of services this department will handle:</p>
                                
                                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                                    <div class="flex items-center">
                                        <input type="checkbox" id="service-infrastructure" name="service_categories" value="infrastructure"
                                               class="form-checkbox text-gov-primary">
                                        <label for="service-infrastructure" class="ml-2 text-sm text-gray-700">Infrastructure</label>
                                    </div>
                                    <div class="flex items-center">
                                        <input type="checkbox" id="service-sanitation" name="service_categories" value="sanitation"
                                               class="form-checkbox text-gov-primary">
                                        <label for="service-sanitation" class="ml-2 text-sm text-gray-700">Sanitation</label>
                                    </div>
                                    <div class="flex items-center">
                                        <input type="checkbox" id="service-utilities" name="service_categories" value="utilities"
                                               class="form-checkbox text-gov-primary">
                                        <label for="service-utilities" class="ml-2 text-sm text-gray-700">Utilities</label>
                                    </div>
                                    <div class="flex items-center">
                                        <input type="checkbox" id="service-transport" name="service_categories" value="transport"
                                               class="form-checkbox text-gov-primary">
                                        <label for="service-transport" class="ml-2 text-sm text-gray-700">Transport</label>
                                    </div>
                                    <div class="flex items-center">
                                        <input type="checkbox" id="service-public-safety" name="service_categories" value="public_safety"
                                               class="form-checkbox text-gov-primary">
                                        <label for="service-public-safety" class="ml-2 text-sm text-gray-700">Public Safety</label>
                                    </div>
                                    <div class="flex items-center">
                                        <input type="checkbox" id="service-environment" name="service_categories" value="environment"
                                               class="form-checkbox text-gov-primary">
                                        <label for="service-environment" class="ml-2 text-sm text-gray-700">Environment</label>
                                    </div>
                                </div>
                                
                                <!-- Custom Service Category -->
                                <div class="mt-4">
                                    <label for="custom_service" class="block text-sm font-medium text-gray-700 mb-1">Add Custom Service Category</label>
                                    <div class="flex space-x-2">
                                        <input type="text" id="custom_service" 
                                               class="form-input flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                               placeholder="Enter custom service category">
                                        <button type="button" onclick="addCustomService()" 
                                                class="px-4 py-2 bg-gray-200 text-gray-700 font-medium rounded-lg hover:bg-gray-300 transition">
                                            Add
                                        </button>
                                    </div>
                                    <div id="custom-services-list" class="mt-2 flex flex-wrap gap-2"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Form Actions -->
                        <div class="flex justify-end space-x-4 pt-6 border-t border-gray-200">
                            <button type="button" onclick="window.history.back()" 
                                    class="px-6 py-2 border border-gray-300 text-gray-700 font-medium rounded-lg hover:bg-gray-50 transition">
                                Cancel
                            </button>
                            <button type="submit" 
                                    class="px-6 py-2 bg-gov-primary text-white font-medium rounded-lg hover:bg-green-800 transition flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                </svg>
                                Create Department
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Existing Departments Preview -->
                <div class="mt-8">
                    <div class="bg-white rounded-xl p-6 card-shadow">
                        <h3 class="font-heading text-lg font-bold text-gov-dark mb-4">Existing Departments</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                           <%--  <%
                            List<Department> existingDepartments = (List<Department>) request.getAttribute("existingDepartments");
                            if (existingDepartments != null && !existingDepartments.isEmpty()) {
                                for (Department dept : existingDepartments) {
                                    String colorClass = "bg-blue-100 text-blue-800";
                                    if (dept.getDepartmentId() % 3 == 0) colorClass = "bg-green-100 text-green-800";
                                    else if (dept.getDepartmentId() % 3 == 1) colorClass = "bg-purple-100 text-purple-800";
                            %>
                                <div class="flex items-center p-3 border border-gray-200 rounded-lg">
                                    <div class="department-icon <%= colorClass %> mr-3">
                                        <%= dept.getDepartmentCode() != null ? dept.getDepartmentCode().substring(0, Math.min(2, dept.getDepartmentCode().length())) : "D" %>
                                    </div>
                                    <div class="flex-1">
                                        <h4 class="font-medium text-gray-900 text-sm"><%= dept.getDepartmentName() %></h4>
                                        <p class="text-xs text-gray-500"><%= dept.getDescription() != null && dept.getDescription().length() > 50 ? 
                                            dept.getDescription().substring(0, 50) + "..." : dept.getDescription() %></p>
                                    </div>
                                </div>
                            <%
                                }
                            } else {
                            %> --%>
                                <div class="col-span-3 text-center py-8 text-gray-500">
                                    <svg class="w-12 h-12 mx-auto text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
                                    </svg>
                                    <p class="mt-2">No departments found</p>
                                </div>
                            <%-- <%
                            }
                            %> --%>
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

    <!-- Success/Error Modal -->
    <div id="result-modal" class="modal hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
        <div class="modal-content relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3 text-center">
                <div id="modal-icon" class="mx-auto flex items-center justify-center h-12 w-12 rounded-full"></div>
                <h3 id="modal-title" class="text-lg leading-6 font-medium text-gray-900 mt-2"></h3>
                <div class="mt-2 px-7 py-3">
                    <p id="modal-message" class="text-sm text-gray-500"></p>
                </div>
                <div class="items-center px-4 py-3">
                    <button id="modal-ok-btn" class="px-4 py-2 bg-gov-primary text-white text-base font-medium rounded-md w-full shadow-sm hover:bg-green-800 focus:outline-none focus:ring-2 focus:ring-green-300">
                        OK
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Update datetime
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
        }

        // Generate department code from name
        function generateDepartmentCode() {
            const nameInput = document.getElementById('department_name');
            const codeInput = document.getElementById('department_code');
            const namePreview = document.getElementById('department-name-preview');
            const codePreview = document.getElementById('department-code-preview');
            
            if (nameInput.value.trim() && (!codeInput.value || codeInput.value.length < 2)) {
                const name = nameInput.value.trim();
                let code = '';
                
                // Generate code from name words
                const words = name.split(' ');
                if (words.length === 1) {
                    code = words[0].substring(0, 3).toUpperCase();
                } else {
                    code = words.map(word => word[0]).join('').toUpperCase();
                }
                
                codeInput.value = code;
            }
            
            // Update preview
            if (nameInput.value.trim()) {
                namePreview.textContent = nameInput.value;
                codePreview.textContent = 'Code: ' + codeInput.value;
                
                // Update icon preview with first two letters
                const iconPreview = document.getElementById('department-icon-preview');
                const codeText = codeInput.value.substring(0, 2).toUpperCase();
                iconPreview.textContent = codeText;
            }
        }

        // Update color preview
        document.getElementById('department_color').addEventListener('input', function(e) {
            const hexInput = document.getElementById('department_color_hex');
            const iconPreview = document.getElementById('department-icon-preview');
            
            hexInput.value = e.target.value;
            
            // Update icon preview with new color
            iconPreview.style.backgroundColor = e.target.value + '20'; // Add opacity
            iconPreview.style.color = e.target.value;
        });

        // Add custom service category
        function addCustomService() {
            const customInput = document.getElementById('custom_service');
            const customServicesList = document.getElementById('custom-services-list');
            
            if (customInput.value.trim()) {
                const service = customInput.value.trim();
                const serviceId = 'custom-' + service.toLowerCase().replace(/\s+/g, '-');
                
                // Create badge for custom service
                const badge = document.createElement('div');
                badge.className = 'inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800';
                badge.innerHTML = `
                    ${service}
                    <input type="hidden" name="custom_services" value="${service}">
                    <button type="button" onclick="this.parentElement.remove()" class="ml-1 text-gray-500 hover:text-gray-700">
                        &times;
                    </button>
                `;
                
                customServicesList.appendChild(badge);
                customInput.value = '';
            }
        }

        // Form validation and submission
        document.getElementById('add-department-form').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const departmentName = document.getElementById('department_name').value.trim();
            const departmentCode = document.getElementById('department_code').value.trim();
            
            // Validate department name
            if (!departmentName) {
                showModal('error', 'Missing Information', 'Please enter a department name.');
                return;
            }
            
            // Validate department code
            if (!departmentCode) {
                showModal('error', 'Missing Information', 'Please enter a department code.');
                return;
            }
            
            if (departmentCode.length < 2 || departmentCode.length > 5) {
                showModal('error', 'Invalid Code', 'Department code must be between 2 and 5 characters.');
                return;
            }
            
            // If all validations pass, submit the form
            this.submit();
        });

        // Show modal function
        function showModal(type, title, message) {
            const modal = document.getElementById('result-modal');
            const modalIcon = document.getElementById('modal-icon');
            const modalTitle = document.getElementById('modal-title');
            const modalMessage = document.getElementById('modal-message');
            const okButton = document.getElementById('modal-ok-btn');

            // Set modal content based on type
            modalTitle.textContent = title;
            modalMessage.textContent = message;

            if (type === 'success') {
                modalIcon.innerHTML = '<svg class="h-12 w-12 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>';
            } else {
                modalIcon.innerHTML = '<svg class="h-12 w-12 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>';
            }

            // Show modal
            modal.classList.remove('hidden');

            // Close modal when OK button is clicked
            okButton.onclick = function() {
                modal.classList.add('hidden');
            }

            // Close modal when clicking outside
            window.onclick = function(event) {
                if (event.target === modal) {
                    modal.classList.add('hidden');
                }
            }
        }

        // Initialize when DOM is loaded
        document.addEventListener('DOMContentLoaded', function() {
            updateDateTime();
            
            // Update datetime every minute
            setInterval(updateDateTime, 60000);

            // Initialize logout button
            const logoutBtn = document.getElementById('logout-btn');
            if (logoutBtn) {
                logoutBtn.addEventListener('click', function() {
                    if (confirm('Are you sure you want to logout?')) {
                        window.location.href = 'logout';
                    }
                });
            }

            // Initialize preview
            generateDepartmentCode();

            // Check for success/error messages from servlet
            <%
            String success = (String) request.getAttribute("success");
            String error = (String) request.getAttribute("error");
            if (success != null) {
            %>
                showModal('success', 'Success', '<%= success %>');
            <%
            } else if (error != null) {
            %>
                showModal('error', 'Error', '<%= error %>');
            <%
            }
            %>
        });
    </script>
</body>
</html>