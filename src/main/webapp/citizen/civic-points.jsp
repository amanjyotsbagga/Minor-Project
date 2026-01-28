<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="citizen_auth_check.jspf"%>
     <%
     int civicPoints = citizen.getCivicPoints();
     int level = (civicPoints / 50) + 1;
     %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Civic Points | Setu | Citizen Grievance Redressal Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/civic-points.css">
    <script src="${pageContext.request.contextPath}/js/tailwindConfig.js"></script>
</head>
<body class="bg-light-bg text-dark-text font-sans antialiased">
    <!-- Top Bar -->
        <div class="gtranslate_wrapper hidden"></div>
<script>window.gtranslateSettings = {"default_language":"en","native_language_names":true,"languages":["en","hi","mr","pa","gu","ta","te","ml","kn","bn"],"wrapper_selector":".gtranslate_wrapper","horizontal_position":"left","vertical_position":"bottom"}</script>
<script src="../js/lang.js" defer></script>
<link rel="stylesheet" href="../style/lang.css">
    <div class="tricolor-bar h-1.5"></div>
    <div class="bg-primary-blue text-white text-xs py-1">
        <div class="container mx-auto px-6 flex justify-between items-center">
            <span>For India</span>
            <span id="datetime">Monday, 6 October 2025 | 6:28 PM IST</span>
        </div>
    </div>

    <!-- Header -->
    <header class="bg-white/90 backdrop-blur-lg sticky top-0 z-50 shadow-md border-b border-gray-200">
        <div class="container mx-auto px-6 py-3">
            <nav class="flex justify-between items-center">
                <a href="${pageContext.request.contextPath}/index.html" class="flex items-center gap-3">
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763747450/SETU_LOGO_wwapwe.jpg" alt="Setu logo" class="h-12">
                    <div>
                        <span class="text-2xl font-heading font-extrabold text-primary-blue">सेतु Setu</span>
                        <p class="text-xs text-gray-500 font-semibold tracking-wide">Citizen Grievance Redressal Portal</p>
                    </div>
                </a>
                <div class="flex items-center space-x-4">
                    <a href="profile.jsp"><div class="hidden md:flex items-center space-x-2 bg-blue-50 px-4 py-2 rounded-lg">
                        <div class="h-10 w-10 bg-primary-blue rounded-full flex items-center justify-center text-white font-bold"><%= profileName%></div>
                        <div>
                            <p class="text-sm font-medium"><%= name%></p>
                            <p class="text-xs text-gray-500">Civic Points: <%= civicPoints%></p>
                        </div>
                    </div></a>
                    <a href="dashboard.jsp" class="px-4 py-2 text-sm font-medium text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200 transition">
                        Dashboard
                    </a>
                    <button id="mobile-menu-button" class="md:hidden text-dark-text">
                        <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                        </svg>
                    </button>
                </div>
            </nav>
        </div>
    </header>

    <!-- Mobile Overlay -->
    <div class="mobile-overlay" id="mobile-overlay"></div>

    <!-- Main Content -->
    <div class="flex">
        <!-- Sidebar -->
        <div class="sidebar w-64 bg-white min-h-screen shadow-lg fixed md:relative z-40 md:z-auto">
            <div class="p-6 border-b border-gray-200">
                <h2 class="font-heading text-xl font-bold text-primary-blue">Civic Points</h2>
            </div>
            <nav class="mt-6">
                <a href="dashboard.jsp" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-home mr-3"></i>
                    <span>Dashboard</span>
                </a>
                <a href="submit.jsp" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-plus-circle mr-3"></i>
                    <span>Submit Grievance</span>
                </a>
                </a>
                <a href="track-status.jsp" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-chart-line mr-3"></i>
                    <span>Track Status</span>
                </a>
                <a href="civic-points.jsp" class="flex items-center px-6 py-3 text-primary-blue bg-blue-50 border-r-4 border-primary-blue">
                    <i class="fas fa-award mr-3"></i>
                    <span>Civic Points</span>
                </a>
                <a href="profile.jsp" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-user mr-3"></i>
                    <span>Profile & Settings</span>
                </a>
                <a href="#" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-question-circle mr-3"></i>
                    <span>Help & Support</span>
                </a>
            </nav>
        </div>

        <!-- Civic Points Content -->
        <div class="flex-1 p-6 md:p-8">
            <!-- Header Section -->
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8">
                <div>
                    <h1 class="font-heading text-2xl md:text-3xl font-bold text-primary-blue">Civic Points</h1>
                    <p class="text-gray-600 mt-2">Earn points for your civic engagement and unlock rewards</p>
                </div>
                <div class="mt-4 md:mt-0">
                    <button class="px-6 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center">
                        <i class="fas fa-gift mr-2"></i>
                        Redeem Rewards
                    </button>
                </div>
            </div>

            <!-- Points Overview -->
            <div class="bg-gradient-to-r from-primary-blue to-blue-700 rounded-2xl p-6 text-white mb-8 card-glow">
                <div class="flex flex-col md:flex-row items-center justify-between">
                    <div class="text-center md:text-left mb-6 md:mb-0">
                        <h2 class="font-heading text-2xl md:text-3xl font-bold mb-2">Your Civic Points</h2>
                        <div class="flex items-center justify-center md:justify-start">
                            <span class="text-4xl md:text-5xl font-bold mr-3"><%= civicPoints%></span>
                            <span class="bg-white/20 px-3 py-1 rounded-full text-sm">Level <%=  level%></span>
                        </div>
                        <p class="mt-2 text-blue-100">You're doing great! Keep participating to earn more points.</p>
                    </div>
                    <div class="relative">
                        <div class="h-40 w-40 rounded-full bg-blue-800 flex items-center justify-center">
                            <div class="h-32 w-32 rounded-full bg-blue-900 flex flex-col items-center justify-center">
                                <span class="text-2xl font-bold">Level <%=  level%></span>
                                <span class="text-xs text-blue-200"><%= civicPoints%>/<%= level * 50%> points</span>
                            </div>
                        </div>
                        <div class="absolute top-0 left-0 h-40 w-40">
                            <svg class="h-40 w-40 progress-ring" viewBox="0 0 100 100">
                                <circle cx="50" cy="50" r="45" stroke="#F97316" stroke-width="3" fill="transparent" 
                                        stroke-dasharray="283" stroke-dashoffset="160" stroke-linecap="round" />
                            </svg>
                        </div>
                    </div>
                </div>
                <div class="mt-6 pt-6 border-t border-blue-600">
                    <div class="flex justify-between text-center">
                        <div>
                            <p class="text-blue-200 text-sm">Next Level</p>
                            <p class="font-bold">Level <%= level + 1%></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
                <div class="stats-card bg-white rounded-2xl p-6 shadow-lifted">
                    <div class="flex justify-between items-start">
                        <div>
                            <p class="text-gray-500 text-sm">This Month</p>
                            <h3 class="font-heading text-2xl font-bold text-primary-blue mt-1">45</h3>
                        </div>
                        <div class="h-12 w-12 bg-blue-100 rounded-lg flex items-center justify-center">
                            <i class="fas fa-calendar-alt text-primary-blue text-xl"></i>
                        </div>
                    </div>
                    
                </div>

                <div class="stats-card bg-white rounded-2xl p-6 shadow-lifted">
                    <div class="flex justify-between items-start">
                        <div>
                            <p class="text-gray-500 text-sm">Grievances</p>
                            <h3 class="font-heading text-2xl font-bold text-accent-saffron mt-1">120</h3>
                        </div>
                        <div class="h-12 w-12 bg-orange-100 rounded-lg flex items-center justify-center">
                            <i class="fas fa-file-alt text-accent-saffron text-xl"></i>
                        </div>
                    </div>
                    <div class="mt-4 flex items-center text-sm">
                        <span class="text-gray-500">Points from grievances</span>
                    </div>
                </div>

                <div class="stats-card bg-white rounded-2xl p-6 shadow-lifted">
                    <div class="flex justify-between items-start">
                        <div>
                            <p class="text-gray-500 text-sm">Rank</p>
                            <h3 class="font-heading text-2xl font-bold text-accent-green mt-1">#42</h3>
                        </div>
                        <div class="h-12 w-12 bg-green-100 rounded-lg flex items-center justify-center">
                            <i class="fas fa-trophy text-accent-green text-xl"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Content Grid -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <!-- Left Column -->
                <div class="lg:col-span-2 space-y-8">
                    <!-- How to Earn Points -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">How to Earn Points</h2>
                        </div>
                        <div class="p-6">
                            <div class="space-y-6">
                                <div class="flex items-start">
                                    <div class="h-10 w-10 bg-blue-100 rounded-full flex items-center justify-center text-primary-blue font-bold mr-4 flex-shrink-0">
                                        5
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-lg">Submit a Grievance</h3>
                                        <p class="text-gray-600 mt-1">Earn points for each valid grievance you submit to the portal</p>
                                    </div>
                                </div>
                                <div class="flex items-start">
                                    <div class="h-10 w-10 bg-blue-100 rounded-full flex items-center justify-center text-primary-blue font-bold mr-4 flex-shrink-0">
                                        10
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-lg">Grievance Resolved</h3>
                                        <p class="text-gray-600 mt-1">Get bonus points when your grievance is successfully resolved</p>
                                    </div>
                                </div>
                                <div class="flex items-start">
                                    <div class="h-10 w-10 bg-blue-100 rounded-full flex items-center justify-center text-primary-blue font-bold mr-4 flex-shrink-0">
                                        5
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-lg">Provide Feedback</h3>
                                        <p class="text-gray-600 mt-1">Earn points for providing constructive feedback on resolved grievances</p>
                                    </div>
                                </div>
                                <div class="flex items-start">
                                    <div class="h-10 w-10 bg-blue-100 rounded-full flex items-center justify-center text-primary-blue font-bold mr-4 flex-shrink-0">
                                        5
                                    </div>
                                    <div>
                                        <h3 class="font-medium text-lg">Verified Information</h3>
                                        <p class="text-gray-600 mt-1">Provide verified information that helps resolve public issues</p>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-8 pt-6 border-t border-gray-200">
                                <a href="submit.jsp"><button class="w-full py-3 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center justify-center">
                                    <i class="fas fa-plus-circle mr-2"></i>
                                    Submit New Grievance to Earn Points
                                </button></a>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Activities -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Recent Activities</h2>
                        </div>
                        <div class="divide-y divide-gray-100">
                            <div class="p-6">
                                <div class="flex justify-between items-start">
                                    <div class="flex items-start">
                                        <div class="h-10 w-10 bg-blue-100 rounded-full flex items-center justify-center text-primary-blue mr-4">
                                            <i class="fas fa-file-alt"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium">Grievance Submitted</h3>
                                            <p class="text-sm text-gray-600 mt-1">You submitted a new grievance SETU-2025-01542</p>
                                        </div>
                                    </div>
                                    <span class="bg-blue-100 text-primary-blue px-2 py-1 rounded-full text-sm font-medium">+5 pts</span>
                                </div>
                            </div>
                            <div class="p-6">
                                <div class="flex justify-between items-start">
                                    <div class="flex items-start">
                                        <div class="h-10 w-10 bg-green-100 rounded-full flex items-center justify-center text-green-600 mr-4">
                                            <i class="fas fa-check"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium">Grievance Resolved</h3>
                                            <p class="text-sm text-gray-600 mt-1">Your grievance SETU-2025-01489 has been resolved</p>
                                        </div>
                                    </div>
                                    <span class="bg-green-100 text-green-800 px-2 py-1 rounded-full text-sm font-medium">+10 pts</span>
                                </div>
                            </div>
                            <div class="p-6">
                                <div class="flex justify-between items-start">
                                    <div class="flex items-start">
                                        <div class="h-10 w-10 bg-purple-100 rounded-full flex items-center justify-center text-purple-600 mr-4">
                                            <i class="fas fa-comment-alt"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium">Feedback Provided</h3>
                                            <p class="text-sm text-gray-600 mt-1">You provided feedback on a resolved grievance</p> 
                                        </div>
                                    </div>
                                    <span class="bg-purple-100 text-purple-800 px-2 py-1 rounded-full text-sm font-medium">+5 pts</span>
                                </div>
                            </div>
                            <div class="p-6">
                                <div class="flex justify-between items-start">
                                    <div class="flex items-start">
                                        <div class="h-10 w-10 bg-yellow-100 rounded-full flex items-center justify-center text-yellow-600 mr-4">
                                            <i class="fas fa-info-circle"></i>
                                        </div>
                                        <div>
                                            <h3 class="font-medium">Verified Information</h3>
                                            <p class="text-sm text-gray-600 mt-1">You provided verified information for a public issue</p>
                                        </div>
                                    </div>
                                    <span class="bg-yellow-100 text-yellow-800 px-2 py-1 rounded-full text-sm font-medium">+5 pts</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="space-y-8">
                    <!-- Badges & Achievements -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Badges & Achievements</h2>
                        </div>
                        <div class="p-6">
                            <div class="grid grid-cols-2 gap-4">
                                <div class="badge-card bg-blue-50 rounded-lg p-4 text-center">
                                    <div class="h-16 w-16 bg-primary-blue rounded-full flex items-center justify-center text-white text-xl mx-auto mb-2">
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h3 class="font-medium text-sm">First Grievance</h3>
                                    <p class="text-xs text-gray-600 mt-1">Earned</p>
                                </div>
                                <div class="badge-card bg-orange-50 rounded-lg p-4 text-center">
                                    <div class="h-16 w-16 bg-accent-saffron rounded-full flex items-center justify-center text-white text-xl mx-auto mb-2">
                                        <i class="fas fa-check-circle"></i>
                                    </div>
                                    <h3 class="font-medium text-sm">Verified Citizen</h3>
                                    <p class="text-xs text-gray-600 mt-1">Earned</p>
                                </div>
                                <div class="badge-card bg-yellow-50 rounded-lg p-4 text-center">
                                    <div class="h-16 w-16 bg-brand-gold rounded-full flex items-center justify-center text-white text-xl mx-auto mb-2">
                                        <i class="fas fa-bullhorn"></i>
                                    </div>
                                    <h3 class="font-medium text-sm">Active Citizen</h3>
                                    <p class="text-xs text-gray-600 mt-1">15/20</p>
                                </div>
                                <div class="badge-card bg-gray-100 rounded-lg p-4 text-center opacity-70">
                                    <div class="h-16 w-16 bg-gray-400 rounded-full flex items-center justify-center text-white text-xl mx-auto mb-2">
                                        <i class="fas fa-trophy"></i>
                                    </div>
                                    <h3 class="font-medium text-sm">Top Contributor</h3>
                                    <p class="text-xs text-gray-600 mt-1">Locked</p>
                                </div>
                            </div>	
                        </div>
                    </div>

                    <!-- Rewards -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Rewards</h2>
                        </div>
                        <div class="p-6">
                            <div class="space-y-4">
                                <div class="flex justify-between items-center p-3 bg-blue-50 rounded-lg">
                                    <div class="flex items-center">
                                        <i class="fas fa-ticket-alt text-primary-blue text-xl mr-3"></i>
                                        <div>
                                            <p class="font-medium">Priority Support</p>
                                            <p class="text-xs text-gray-600">Get faster grievance resolution</p>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs text-gray-500">Cost</p>
                                        <p class="font-medium text-primary-blue">100 pts</p>
                                    </div>
                                </div>
                                <div class="flex justify-between items-center p-3 bg-blue-50 rounded-lg">
                                    <div class="flex items-center">
                                        <i class="fas fa-award text-primary-blue text-xl mr-3"></i>
                                        <div>
                                            <p class="font-medium">Citizen Gold Batch</p>
                                            <p class="text-xs text-gray-600">Special recognition for active citizens</p>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs text-gray-500">Cost</p>
                                        <p class="font-medium text-primary-blue">500 pts</p>
                                    </div>
                                </div>
                                <div class="flex justify-between items-center p-3 bg-blue-50 rounded-lg">
                                    <div class="flex items-center">
                                        <i class="fas fa-certificate text-primary-blue text-xl mr-3"></i>
                                        <div>
                                            <p class="font-medium">Certificate of Appreciation</p>
                                            <p class="text-xs text-gray-600">From Government of India</p>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs text-gray-500">Cost</p>
                                        <p class="font-medium text-primary-blue">1000 pts</p>
                                    </div>
                                </div>
                            </div>
                            <button class="w-full mt-6 py-3 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center justify-center">
                                <i class="fas fa-gift mr-2"></i>
                                Redeem Rewards
                            </button>
                        </div>
                    </div>

                    <!-- Leaderboard -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Leaderboard</h2>
                        </div>
                        <div class="p-6">
                            <div class="space-y-4">
                                <div class="flex items-center p-3 bg-yellow-50 rounded-lg">
                                    <div class="h-8 w-8 bg-yellow-500 rounded-full flex items-center justify-center text-white text-xs font-bold mr-3">1</div>
                                    <div class="flex-1">
                                        <p class="font-medium">Priya Singh</p>
                                        <p class="text-xs text-gray-600">Chandigarh</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs text-gray-500">Points</p>
                                        <p class="font-medium text-yellow-700">420</p>
                                    </div>
                                </div>
                                <div class="flex items-center p-3 bg-gray-50 rounded-lg">
                                    <div class="h-8 w-8 bg-gray-500 rounded-full flex items-center justify-center text-white text-xs font-bold mr-3">2</div>
                                    <div class="flex-1">
                                        <p class="font-medium">Amit Kumar</p>
                                        <p class="text-xs text-gray-600">Chandigarh</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs text-gray-500">Points</p>
                                        <p class="font-medium text-gray-700">385</p>
                                    </div>
                                </div>
                                <div class="flex items-center p-3 bg-orange-50 rounded-lg">
                                    <div class="h-8 w-8 bg-orange-500 rounded-full flex items-center justify-center text-white text-xs font-bold mr-3">3</div>
                                    <div class="flex-1">
                                        <p class="font-medium">Neha Gupta</p>
                                        <p class="text-xs text-gray-600">Chandigarh</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs text-gray-500">Points</p>
                                        <p class="font-medium text-orange-700">350</p>
                                    </div>
                                </div>
                                <div class="flex items-center p-3 bg-blue-50 rounded-lg border-2 border-primary-blue">
                                    <div class="h-8 w-8 bg-primary-blue rounded-full flex items-center justify-center text-white text-xs font-bold mr-3">42</div>
                                    <div class="flex-1">
                                        <p class="font-medium">You</p>
                                        <p class="text-xs text-gray-600">Chandigarh</p>
                                    </div>
                                    <div class="text-right">
                                        <p class="text-xs text-gray-500">Points</p>
                                        <p class="font-medium text-primary-blue">245</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Enhanced Footer -->
<footer class="bg-primary-blue text-white">
    <div class="container mx-auto px-6 pt-12 pb-8">
        <!-- Main Footer Content -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-10">
            <!-- Brand & Description -->
            <div class="lg:col-span-1">
                <div class="flex items-start gap-4 mb-6">
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763748052/SETU_LOGO-removebg_kxwnmb.png" alt="setu logo" class="h-16 invert">
                    <div>
                        <h3 class="font-heading font-bold text-xl mb-2">Setu Grievance Redressal Portal</h3>
                        <p class="text-blue-200 text-sm">A platform that connects citizen and government</p>
                    </div>
                </div>
                <p class="text-blue-200 text-sm mb-4">A single window platform for citizens to register their grievances and track their resolution status.</p>
                <div class="flex space-x-4">
                    <a href="https://www.facebook.com/" class="text-blue-200 hover:text-white transition" aria-label="Facebook">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="https://x.com/" class="text-blue-200 hover:text-white transition" aria-label="Twitter">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="https://www.youtube.com/youtube" class="text-blue-200 hover:text-white transition" aria-label="YouTube">
                        <i class="fab fa-youtube"></i>
                    </a>
                    <a href="https://www.instagram.com/accounts/login/" class="text-blue-200 hover:text-white transition" aria-label="Instagram">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
            </div>

            <!-- Quick Links -->
            <div>
                <h4 class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Quick Links</h4>
                <ul class="space-y-3">
                    <li><a href="dashboard.jsp" class="text-blue-200 hover:text-white transition text-sm">Dashboard</a></li>
                    <li><a href="submit.jsp" class="text-blue-200 hover:text-white transition text-sm">Submit Grievance</a></li>
                    <li><a href="track-status.jsp" class="text-blue-200 hover:text-white transition text-sm">Track Status</a></li>
                    <li><a href="civic-points.jsp" class="text-blue-200 hover:text-white transition text-sm">Civic Points</a></li>
                    <li><a href="profile.jsp" class="text-blue-200 hover:text-white transition text-sm">Profile & Settings</a></li>
                    <li><a href="feedback.jsp" class="text-blue-200 hover:text-white transition text-sm">Feedback</a></li>
                </ul>
            </div>

            <!-- Contact & Help -->
            <div>
                <h4 class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Contact & Help</h4>
                <ul class="space-y-3">
                    <li class="flex items-start">
                        <i class="fas fa-phone-alt text-blue-300 mt-1 mr-3 text-sm"></i>
                        <div>
                            <p class="text-blue-200 text-sm font-medium">Helpline</p>
                            <p class="text-white text-sm">1800-11-1234 (Toll Free)</p>
                        </div>
                    </li>
                    <li class="flex items-start">
                        <i class="fas fa-envelope text-blue-300 mt-1 mr-3 text-sm"></i>
                        <div>
                            <p class="text-blue-200 text-sm font-medium">Email</p>
                            <p class="text-white text-sm">support@setu.gov.in</p>
                        </div>
                    </li>
                    <li class="flex items-start">
                        <i class="fas fa-clock text-blue-300 mt-1 mr-3 text-sm"></i>
                        <div>
                            <p class="text-blue-200 text-sm font-medium">Working Hours</p>
                            <p class="text-white text-sm">Mon-Sat: 9:00 AM - 6:00 PM</p>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Government Initiatives -->
            <div>
                <h4 class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Government Initiatives</h4>
                <div class="flex flex-col space-y-4">
                    <a href="https://www.digitalindia.gov.in/" class="flex items-center p-2 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
                        <img src="https://indiadesignsystem.bombaydc.com/assets/india-designs/display/Digital-India/white.svg" alt="Digital India Logo" class="h-8 mr-3">
                        <span class="text-sm">Digital India</span>
                    </a>
                    <a href="https://www.mygov.in/" class="flex items-center p-2 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
                        <img src="https://cdn.brandfetch.io/idMNzAn3uw/theme/dark/logo.svg?c=1dxbfHSJFAPEGdCLU4o5B" alt="MyGov Logo" class="h-6 mr-3">
                        <span class="text-sm">MyGov</span>
                    </a>
                    <a href="https://www.india.gov.in/" class="flex items-center p-2 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
                        <i class="fas fa-university text-white mr-3"></i>
                        <span class="text-sm">National Portal of India</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- Important Links Section -->
        <div class="border-t border-blue-700 pt-8 mb-8">
            <h4 class="font-heading font-bold text-lg mb-4 text-center">Important Links</h4>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-center">
                <a href="privacy-policy.html" class="text-blue-200 hover:text-white transition text-sm">Privacy Policy</a>
                <a href="term.html" class="text-blue-200 hover:text-white transition text-sm">Terms of Service</a>
                <a href="copy-right.html" class="text-blue-200 hover:text-white transition text-sm">Copyright Policy</a>
                <a href="help-support.html" class="text-blue-200 hover:text-white transition text-sm">Help & Support</a>
                <a href="feedback.jsp" class="text-blue-200 hover:text-white transition text-sm">Feedback</a>
                <a href="how-to-submit.html" class="text-blue-200 hover:text-white transition text-sm">How to submit grievance</a>
                <a href="guidelines.html" class="text-blue-200 hover:text-white transition text-sm">Guidelines</a>
            </div>
        </div>

        <!-- Copyright & Info Section -->
        <div class="border-t border-blue-700 pt-6">
            <div class="flex justify-center items-center">
                <p class="text-blue-300 text-sm text-center">
                    Designed, Developed and Hosted by 
                    <span class="font-semibold">Team SETU</span>
                </p>
            </div>
        </div>
    </div>
</footer>

    <script src="${pageContext.request.contextPath}/js/civic-points.js"></script>
</body>
</html>