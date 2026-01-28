<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String error = request.getParameter("error");
String role = request.getParameter("role") != null ? request.getParameter("role") : "worker";
String username = request.getParameter("username") != null ? request.getParameter("username") : "";
%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Login | Setu Grievance Redressal Portal</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    
    <script>
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
    <link rel="stylesheet" href="../style/govLogin.css">
</head>
<body class="body-bg text-dark-text font-sans antialiased flex flex-col min-h-screen">

    <!-- Top Bar -->
    <div class="header-bg text-gray-300 text-xs py-2 border-b border-gray-700">
        <div class="container mx-auto px-6 flex justify-between items-center">
            <span class="flex items-center">
                <i class="fas fa-shield-alt mr-1"></i>
                 Official Use Only
            </span>
            <span id="datetime" class="flex items-center">
                <i class="fas fa-clock mr-1"></i>
                <span id="datetime-text"></span>
            </span>
        </div>
    </div>

    <!-- Header -->
    <header class="header-bg sticky top-0 z-50 shadow-md border-b border-gray-700">
        <div class="container mx-auto px-6 py-3">
            <nav class="flex justify-between items-center">
                <a href="../index.jsp" class="flex items-center gap-3">
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763748052/SETU_LOGO-removebg_kxwnmb.png" alt="setu logo" class="h-12 filter">
                    <div>
                        <span class="text-2xl font-heading font-extrabold text-white">सेतु <span class="text-gray-400">Setu</span></span>
                        <p class="text-xs text-gray-400 font-semibold tracking-wide">Official Grievance Dashboard</p>
                    </div>
                </a>
                <div class="flex items-center gap-4">
                    <a href="../citizen/login.jsp" class="px-4 py-2 text-sm font-medium text-gray-300 hover:text-white transition">Citizen Portal</a>
                    <a href="../index.html" class="px-5 py-2.5 text-sm font-bold text-gov-dark bg-white rounded-lg hover:bg-gray-200 transition">Home</a>
                </div>
            </nav>
        </div>
    </header>

    <!-- Error Message -->
<%
    if (error != null && !error.isEmpty()) {
%>
  <div class="container mx-auto px-6 mt-4 animate-fade-in">
    <div id="error-message"
         class="flex items-start p-4 mb-4 text-sm text-red-800 bg-red-50 border border-red-300 rounded-xl shadow-sm relative"
         role="alert">

        <!-- Icon -->
        <i class="fas fa-exclamation-circle text-red-600 text-lg mr-3 mt-0.5"></i>

        <!-- Message -->
        <div class="flex-1">
            <p class="font-semibold text-red-900 mb-0.5">Error</p>
            <p class="text-red-700"><%= error %></p>
        </div>

        <!-- Close Button -->
        <button type="button"
                class="absolute top-3 right-3 text-red-500 hover:text-red-700 transition"
                onclick="fadeOutAlert(this)">
            <i class="fas fa-times text-sm"></i>
        </button>
    </div>
</div>
    <%
    }
%>

    <!-- Main Content -->
    <main class="flex-grow flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="container mx-auto max-w-4xl">
            <div class="bg-gov-light rounded-2xl shadow-lifted overflow-hidden animate-fade-in">
                <div class="grid md:grid-cols-2">
                    <!-- Left side - Form -->
                    <div class="p-8 md:p-12">
                        <div class="mb-8">
                            <h2 class="font-heading text-3xl font-bold text-gov-primary">Department Login</h2>
                            <p class="mt-2 text-sm text-gray-600">Access the Official Grievance Management Dashboard.</p>
                        </div>
                        <!-- Role Selector -->
                        <div class="mb-6">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Login As</label>
                            <div class="grid grid-cols-2 gap-2">
                                <a href="?role=worker" class="role-link flex items-center justify-center py-2 px-3 border border-gray-300 rounded-lg text-sm transition hover:bg-gray-50 <%= "worker".equals(role) ? "active" : "" %>">
                                    <span class="role-indicator role-worker"></span>Worker
                                </a>
                                <a href="?role=operator" class="role-link flex items-center justify-center py-2 px-3 border border-gray-300 rounded-lg text-sm transition hover:bg-gray-50 <%= "operator".equals(role) ? "active" : "" %>">
                                    <span class="role-indicator role-operator"></span>Operator
                                </a>
                                <a href="?role=dept-admin" class="role-link flex items-center justify-center py-2 px-3 border border-gray-300 rounded-lg text-sm transition hover:bg-gray-50 <%= "dept-admin".equals(role) ? "active" : "" %>">
                                    <span class="role-indicator role-dept-admin"></span>Dept Admin
                                </a>
                                <a href="?role=super-admin" class="role-link flex items-center justify-center py-2 px-3 border border-gray-300 rounded-lg text-sm transition hover:bg-gray-50 <%= "super-admin".equals(role) ? "active" : "" %>">
                                    <span class="role-indicator role-super-admin"></span>Super Admin
                                </a>
                            </div>
                        </div>
                        
                        <form action="../GovLogi" method="POST" class="space-y-6">
                            <input type="hidden" name="role" value="<%= role %>">
                            
                            <div>
                                <label for="official-id" class="block text-sm font-medium text-gray-700 mb-1">Official ID / Email</label>
                                <input type="text" id="email" name="email" required 
                                       value="<%= getUsername(role) %>"
                                       class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition" 
                                       placeholder="Enter your official ID">
                            </div>
                            
                            <div class="relative">
                                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                                <input type="password" id="password" name="password" required 
                                       class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition pr-10" 
                                       placeholder="Enter your password">
                                <button type="button" onclick="togglePassword()" class="password-toggle">
                                    <i class="fas fa-eye" id="eye-icon"></i>
                                </button>
                            </div>
                            
                           
                            <% if ("dept-admin".equals(role) || "operator".equals(role) || "worker".equals(role)) { %>
                            <div>
                                <label for="department" class="block text-sm font-medium text-gray-700 mb-1">Department</label>
                                <select id="department" name="department" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-gov-primary focus:border-transparent transition">
                                    <option value="">Select Department</option>
                                    <option value="sanitation">Municipal-Corporation</option>
                                    <option value="public-works">Electricity-Department</option>
                                    <option value="electricity">Transport</option>
                                    <option disabled="disabled" value="water">Water Supply Department</option>
                                    <option disabled="disabled" value="traffic">Traffic & Transportation</option>
                                </select>
                            </div>
                            <% } %>
                            
                            <button type="submit" class="w-full py-3 px-4 bg-gov-primary text-white font-bold rounded-lg hover:bg-green-800 transition duration-300 transform hover:scale-[1.02] shadow-md hover:shadow-glow">
                                Sign In
                            </button>
                        </form>
                    </div>
                    
                    <!-- Right side - Info -->
                    <div class="bg-gov-dark text-white p-8 md:p-12 flex flex-col justify-center rounded-r-2xl animate-slide-up">
                        <div class="mb-6">
                            <h3 class="font-heading text-2xl font-bold text-white mb-4">Official Grievance Dashboard</h3>
                            <p class="mb-6 text-gray-300">This portal provides authorized personnel with tools to manage and resolve citizen grievances efficiently.</p>
                            <ul class="space-y-4">
                                <li class="flex items-start">
                                    <i class="fas fa-chart-bar text-gov-accent mr-3 mt-0.5"></i>
                                    <span>Access real-time analytics and reporting dashboards.</span>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-comments text-gov-accent mr-3 mt-0.5"></i>
                                    <span>Communicate directly with citizens and provide updates.</span>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-check-circle text-gov-accent mr-3 mt-0.5"></i>
                                    <span>Track and manage grievances within defined SLAs.</span>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-file-alt text-gov-accent mr-3 mt-0.5"></i>
                                    <span>Generate detailed reports for performance analysis.</span>
                                </li>
                            </ul>
                        </div>
                         
                        <!-- System Status -->
                        <div class="mt-6 p-4 bg-gray-900/50 rounded-lg">
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
                                    <span>0</span>
                                </div>
                                <div class="flex justify-between">
                                    <span>Grievances Today:</span>
                                    <span>0</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Security notice -->
                        <div class="mt-6 p-4 bg-gray-900/50 rounded-lg">
                            <h4 class="font-bold mb-2 flex items-center">
                                <i class="fas fa-shield-alt text-gov-accent mr-2"></i>
                                Security Notice
                            </h4>
                            <p class="text-sm text-gray-300">This is a restricted Government of India system. Access is limited to authorized personnel only. All activities are monitored and logged.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer-bg text-white mt-auto">
        <div class="container mx-auto px-6 py-8">
            <div class="border-t border-gray-700 pt-6 text-center text-gray-400 text-sm">
                <p>Designed, Developed and Hosted by Team SETU</p>
                <p>&copy; 2025 All Rights Reserved. Last Updated: <span id="footer-date"></span></p>
            </div>
        </div>
    </footer>

    <script>
        // Simple JavaScript for UI enhancements only
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const eyeIcon = document.getElementById('eye-icon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.className = 'fas fa-eye-slash';
            } else {
                passwordInput.type = 'password';
                eyeIcon.className = 'fas fa-eye';
            }
        }

        // Update datetime
        function updateDateTime() {
            const specificDate = new Date(2025, 9, 22, 23, 24, 0);
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
                dtElement.textContent = specificDate.toLocaleDateString('en-IN', options) + ' IST';
            }
            
            if (footerDateElement) {
                footerDateElement.textContent = specificDate.toLocaleDateString('en-IN', { 
                    weekday: 'long', 
                    year: 'numeric', 
                    month: 'long', 
                    day: 'numeric' 
                });
            }
        }

        // Initialize on load
        document.addEventListener('DOMContentLoaded', function() {
            updateDateTime();
        });
        
        
       
        // Smooth fade-out for alert
        function fadeOutAlert(btn) {
            const alert = btn.closest('#error-message');
            alert.classList.add('opacity-0', 'transition', 'duration-500');
            setTimeout(() => alert.remove(), 500);
        }

        // Optional: Auto-hide after 5 seconds
        setTimeout(() => {
            const alert = document.getElementById('error-message');
            if (alert) fadeOutAlert(alert);
        }, 7000);
    </script>
</body>
</html>

<%!
// Helper method to get demo username based on role
private String getUsername(String role) {
    switch(role) {
        case "worker":
            return "worker@setu.ind.in";
        case "operator":
            return "operator@setu.ind.in";
        case "dept-admin":
            return "admin@sanitation.ind.in";
        case "super-admin":
            return "superadmin@setu.ind.in";
        default:
            return "worker@setu.ind.in";
    }
}
%>