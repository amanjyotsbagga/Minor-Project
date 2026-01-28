<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User | Setu Grievance Redressal Portal</title>
    
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
        .password-strength {
            height: 4px;
            border-radius: 2px;
            transition: all 0.3s ease;
        }
        .password-strength.weak {
            background-color: #dc2626;
            width: 25%;
        }
        .password-strength.fair {
            background-color: #f59e0b;
            width: 50%;
        }
        .password-strength.good {
            background-color: #10b981;
            width: 75%;
        }
        .password-strength.strong {
            background-color: #065f46;
            width: 100%;
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
                <a href="addDepAdmin.jsp" class="nav-item active flex items-center p-3 rounded-lg text-white hover:bg-gray-800 transition">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                    </svg>
                    Add User
                </a>
                <a href="super-admin-dashboard.jsp" class="nav-item flex items-center p-3 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition">
                    <svg class="nav-icon w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    User Management
                </a>
            </nav>
        </div>

        <!-- Main Content -->
        <main class="flex-1 p-6 overflow-auto">
            <!-- Page Header -->
            <div class="mb-8">
                <div class="flex items-center justify-between">
                    <div>
                        <h1 class="font-heading text-3xl font-bold text-gov-dark">Add Government User</h1>
                        <p class="text-gray-600 mt-2">Create new government user accounts with appropriate roles and permissions.</p>
                    </div>
                    <a href="super-admin-dashboard.jsp" class="px-4 py-2 bg-gray-500 text-white font-medium rounded-lg hover:bg-gray-600 transition flex items-center">
                        <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path>
                        </svg>
                        Back to Users
                    </a>
                </div>
            </div>

            <!-- Add User Form -->
            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-xl p-6 card-shadow">
                    <form id="add-user-form" action="../AddGovUserServlet" method="POST">
                        <!-- Personal Information Section -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Personal Information</h3>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Full Name -->
                                <div>
                                    <label for="full_name" class="block text-sm font-medium text-gray-700 mb-1">Full Name <span class="text-red-500">*</span></label>
                                    <input type="text" id="full_name" name="full_name" required
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                           placeholder="Enter full name">
                                    <p class="text-xs text-gray-500 mt-1">Enter the user's complete legal name</p>
                                </div>

                                <!-- Email -->
                                <div>
                                    <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address <span class="text-red-500">*</span></label>
                                    <input type="email" id="email" name="email" required
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                           placeholder="user@government.gov.in">
                                    <p class="text-xs text-gray-500 mt-1">Official government email address</p>
                                </div>
                            </div>
                        </div>

                        <!-- Account Security Section -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Account Security</h3>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Password -->
                                <div>
                                    <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password <span class="text-red-500">*</span></label>
                                    <input type="password" id="password" name="password" required
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                           placeholder="Enter password"
                                           onkeyup="checkPasswordStrength()">
                                    <div class="mt-2">
                                        <div class="password-strength weak" id="password-strength"></div>
                                        <p class="text-xs text-gray-500 mt-1" id="password-strength-text">Password strength</p>
                                    </div>
                                </div>

                                <!-- Confirm Password -->
                                <div>
                                    <label for="confirm_password" class="block text-sm font-medium text-gray-700 mb-1">Confirm Password <span class="text-red-500">*</span></label>
                                    <input type="password" id="confirm_password" name="confirm_password" required
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                           placeholder="Confirm password"
                                           onkeyup="checkPasswordMatch()">
                                    <p class="text-xs text-red-500 mt-1 hidden" id="password-match-error">Passwords do not match</p>
                                    <p class="text-xs text-green-500 mt-1 hidden" id="password-match-success">Passwords match</p>
                                </div>
                            </div>

                            <!-- Password Requirements -->
                            <div class="mt-4 p-4 bg-gray-50 rounded-lg">
                                <p class="text-sm font-medium text-gray-700 mb-2">Password Requirements:</p>
                                <ul class="text-xs text-gray-600 list-disc pl-5 space-y-1">
                                    <li>Minimum 8 characters</li>
                                    <li>At least one uppercase letter</li>
                                    <li>At least one lowercase letter</li>
                                    <li>At least one number</li>
                                    <li>At least one special character</li>
                                </ul>
                            </div>
                        </div>

                        <!-- Role and Department Section -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Role and Department</h3>
                            
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <!-- Role -->
                                <div>
                                    <label for="role" class="block text-sm font-medium text-gray-700 mb-1">User Role <span class="text-red-500">*</span></label>
                                    <select id="role" name="role" required
                                            class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition"
                                            onchange="toggleDepartmentField()">
                                        <option value="">Select Role</option>
                                        <option disabled="disabled" value="SUPER_ADMIN">Super Admin</option>
                                        <option value="DEPARTMENT_ADMIN">Department Admin</option>
                                        <option value="OPERATOR">Operator</option>
                                        <option value="WORKER">Worker</option>
                                    </select>
                                    <p class="text-xs text-gray-500 mt-1">Select the appropriate role for this user</p>
                                </div>

                                <!-- Department -->
                                <div id="department-field">
                                    <label for="department_id" class="block text-sm font-medium text-gray-700 mb-1">Department <span class="text-red-500">*</span></label>
                                    <select id="department_id" name="department_id"
                                            class="form-input w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                        <option value="">Select Department</option>
                                        <%-- <%
                                        List<Department> departments = (List<Department>) request.getAttribute("departments");
                                        if (departments != null && !departments.isEmpty()) {
                                            for (Department dept : departments) {
                                        %>
                                            <option value="<%= dept.getDepartmentId() %>"><%= dept.getDepartmentName() %></option>
                                        <%
                                            }
                                        } else {
                                        %> --%>
                                            <option value="1">Municipal-Corporation</option>
                                            <option value="2">Electricity-Department</option>
                                            <option value="3">Transport</option>
                                            <option disabled="disabled" value="4">Water Supply (soon)</option>
                                            <option disabled="disabled" value="5">Traffic (soon)</option>
                                        <%-- <%
                                        }
                                        %> --%>
                                    </select>
                                    <p class="text-xs text-gray-500 mt-1">Department assignment is required for all roles except Super Admin</p>
                                </div>
                            </div>

                            <!-- Role Descriptions -->
                            <div class="mt-4 p-4 bg-blue-50 rounded-lg">
                                <p class="text-sm font-medium text-gray-700 mb-2">Role Descriptions:</p>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs text-gray-600">
                                    <div>
                                        <p class="font-medium">Super Admin</p>
                                        <p>Full system access, can manage all users and departments</p>
                                    </div>
                                    <div>
                                        <p class="font-medium">Department Admin</p>
                                        <p>Manages specific department, can manage department users</p>
                                    </div>
                                    <div>
                                        <p class="font-medium">Operator</p>
                                        <p>Processes grievances, updates status, communicates with citizens</p>
                                    </div>
                                    <div>
                                        <p class="font-medium">Worker</p>
                                        <p>Field worker, receives assigned tasks and updates completion</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Account Status -->
                        <div class="mb-8">
                            <h3 class="font-heading text-lg font-bold text-gov-dark mb-4 border-b pb-2">Account Status</h3>
                            
                            <div class="flex items-center">
                                <input type="checkbox" id="is_active" name="is_active" value="true" checked
                                       class="form-checkbox text-gov-primary">
                                <label for="is_active" class="ml-2 text-sm text-gray-700">Activate user account immediately</label>
                            </div>
                            <p class="text-xs text-gray-500 mt-1">If unchecked, the user account will be created but marked as inactive</p>
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
                                Create User
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Quick Stats -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-8">
                    <div class="bg-white rounded-xl p-6 card-shadow text-center">
                        <div class="p-3 bg-blue-50 rounded-lg inline-flex mb-3">
                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                        </div>
                        <h4 class="font-medium text-gray-900">Total Users</h4>
                        <p class="text-2xl font-bold text-gov-dark mt-1">0</p>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow text-center">
                        <div class="p-3 bg-green-50 rounded-lg inline-flex mb-3">
                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                        <h4 class="font-medium text-gray-900">Active Users</h4>
                        <p class="text-2xl font-bold text-gov-dark mt-1">0</p>
                    </div>

                    <div class="bg-white rounded-xl p-6 card-shadow text-center">
                        <div class="p-3 bg-purple-50 rounded-lg inline-flex mb-3">
                            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                            </svg>
                        </div>
                        <h4 class="font-medium text-gray-900">Departments</h5>
                        <p class="text-2xl font-bold text-gov-dark mt-1">0</p>
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

        // Password strength checker
        function checkPasswordStrength() {
            const password = document.getElementById('password').value;
            const strengthBar = document.getElementById('password-strength');
            const strengthText = document.getElementById('password-strength-text');
            
            let strength = 0;
            let feedback = '';

            // Check password length
            if (password.length >= 8) strength++;
            if (password.length >= 12) strength++;

            // Check for character variety
            if (/[a-z]/.test(password)) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;

            // Update strength bar and text
            if (password.length === 0) {
                strengthBar.className = 'password-strength';
                strengthBar.style.width = '0%';
                strengthText.textContent = 'Password strength';
                strengthText.className = 'text-xs text-gray-500 mt-1';
            } else if (strength <= 2) {
                strengthBar.className = 'password-strength weak';
                strengthText.textContent = 'Weak password';
                strengthText.className = 'text-xs text-red-500 mt-1';
            } else if (strength <= 4) {
                strengthBar.className = 'password-strength fair';
                strengthText.textContent = 'Fair password';
                strengthText.className = 'text-xs text-yellow-500 mt-1';
            } else if (strength <= 5) {
                strengthBar.className = 'password-strength good';
                strengthText.textContent = 'Good password';
                strengthText.className = 'text-xs text-green-500 mt-1';
            } else {
                strengthBar.className = 'password-strength strong';
                strengthText.textContent = 'Strong password';
                strengthText.className = 'text-xs text-green-600 mt-1';
            }
        }

        // Password match checker
        function checkPasswordMatch() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm_password').value;
            const matchError = document.getElementById('password-match-error');
            const matchSuccess = document.getElementById('password-match-success');

            if (confirmPassword.length === 0) {
                matchError.classList.add('hidden');
                matchSuccess.classList.add('hidden');
            } else if (password === confirmPassword) {
                matchError.classList.add('hidden');
                matchSuccess.classList.remove('hidden');
            } else {
                matchError.classList.remove('hidden');
                matchSuccess.classList.add('hidden');
            }
        }

        // Toggle department field based on role
        function toggleDepartmentField() {
            const role = document.getElementById('role').value;
            const departmentField = document.getElementById('department-field');
            const departmentSelect = document.getElementById('department_id');

            if (role === 'SUPER_ADMIN') {
                departmentField.style.opacity = '0.5';
                departmentSelect.required = false;
            } else {
                departmentField.style.opacity = '1';
                departmentSelect.required = true;
            }
        }

        // Form validation and submission
        document.getElementById('add-user-form').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm_password').value;
            const role = document.getElementById('role').value;
            const department = document.getElementById('department_id').value;

            // Check password match
            if (password !== confirmPassword) {
                showModal('error', 'Password Mismatch', 'The passwords you entered do not match. Please check and try again.');
                return;
            }

            // Check password strength
            if (password.length < 8) {
                showModal('error', 'Weak Password', 'Password must be at least 8 characters long.');
                return;
            }

            // Check department requirement for non-super-admin roles
            if (role !== 'SUPER_ADMIN' && !department) {
                showModal('error', 'Department Required', 'Please select a department for this user role.');
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
            toggleDepartmentField(); // Initialize department field state
            
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