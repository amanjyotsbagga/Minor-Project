<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Status | Setu | Citizen Grievance Redressal Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/track-report.css">
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
                <a href="../index.html" class="flex items-center gap-3">
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763747450/SETU_LOGO_wwapwe.jpg" alt="setu logo" class="h-12">
                    <div>
                        <span class="text-2xl font-heading font-extrabold text-primary-blue">सेतु Setu</span>
                        <p class="text-xs text-gray-500 font-semibold tracking-wide">Citizen Grievance Redressal Portal</p>
                    </div>
                </a>
                <div class="flex items-center space-x-4">
                    <a href="profile.jsp"><div class="hidden md:flex items-center space-x-2 bg-blue-50 px-4 py-2 rounded-lg">
                        <div class="h-10 w-10 bg-primary-blue rounded-full flex items-center justify-center text-white font-bold">RS</div>
                        <div>
                            <p class="text-sm font-medium">Rahul Sharma</p>
                            <p class="text-xs text-gray-500">Civic Points: 245</p>
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

    <!-- Main Content -->
    <div class="flex">
        <!-- Sidebar -->
        <div class="sidebar w-64 bg-white min-h-screen shadow-lg fixed md:relative z-40 md:z-auto">
            <div class="p-6 border-b border-gray-200">
                <h2 class="font-heading text-xl font-bold text-primary-blue">Track Status</h2>
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
                <a href="track-status.jsp" class="flex items-center px-6 py-3 text-primary-blue bg-blue-50 border-r-4 border-primary-blue">
                    <i class="fas fa-chart-line mr-3"></i>
                    <span>Track Status</span>
                </a>
                <a href="civic-points.jsp" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-award mr-3"></i>
                    <span>Civic Points</span>
                </a>
                <a href="profile.jsp" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-user mr-3"></i>
                    <span>Profile Settings</span>
                </a>
                <a href="help-support.html" class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
                    <i class="fas fa-question-circle mr-3"></i>
                    <span>Help & Support</span>
                </a>
            </nav>
        </div>

        <!-- Track Status Content -->
        <div class="flex-1 p-6 md:p-8">
            <!-- Header Section -->
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8">
                <div>
                    <h1 class="font-heading text-2xl md:text-3xl font-bold text-primary-blue">Track Grievance Status</h1>
                    <p class="text-gray-600 mt-2">Monitor the progress of your submitted grievances in real-time</p>
                </div>
                <div class="mt-4 md:mt-0">
                    <div class="relative">
                        <input type="text" placeholder="Search by Grievance ID..." class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent w-64">
                        <i class="fas fa-search absolute left-3 top-3 text-gray-400"></i>
                    </div>
                </div>
            </div>

            <!-- Main Content Grid -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <!-- Grievance List -->
                <div class="lg:col-span-1">
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Your Grievances</h2>
                            <span class="bg-primary-blue text-white text-xs font-bold rounded-full h-5 w-5 flex items-center justify-center">5</span>
                        </div>
                        <div class="max-h-[600px] overflow-y-auto">
                            <!-- Grievance Item 1 -->
                            <div class="grievance-item active p-6 border-b border-gray-100" data-grievance="SETU-2025-01542">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h3 class="font-medium text-gray-900">Water Supply Issue in Sector 15</h3>
                                        <p class="text-sm text-gray-500 mt-1">Submitted: 15 Oct 2025</p>
                                        <div class="flex items-center mt-2">
                                            <span class="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded">Water Department</span>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <span class="status-badge status-inprogress">In Progress</span>
                                        <p class="text-xs text-gray-500 mt-1">SETU-2025-01542</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Grievance Item 2 -->
                            <div class="grievance-item p-6 border-b border-gray-100" data-grievance="SETU-2025-01489">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h3 class="font-medium text-gray-900">Garbage Collection Not Regular</h3>
                                        <p class="text-sm text-gray-500 mt-1">Submitted: 10 Oct 2025</p>
                                        <div class="flex items-center mt-2">
                                            <span class="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded">Municipal Corporation</span>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <span class="status-badge status-resolved">Resolved</span>
                                        <p class="text-xs text-gray-500 mt-1">SETU-2025-01489</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Grievance Item 3 -->
                            <div class="grievance-item p-6 border-b border-gray-100" data-grievance="SETU-2025-01376">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h3 class="font-medium text-gray-900">Street Light Not Working</h3>
                                        <p class="text-sm text-gray-500 mt-1">Submitted: 5 Oct 2025</p>
                                        <div class="flex items-center mt-2">
                                            <span class="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded">Electricity Department</span>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <span class="status-badge status-pending">Pending</span>
                                        <p class="text-xs text-gray-500 mt-1">SETU-2025-01376</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Grievance Item 4 -->
                            <div class="grievance-item p-6 border-b border-gray-100" data-grievance="SETU-2025-01234">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h3 class="font-medium text-gray-900">Road Repair Required</h3>
                                        <p class="text-sm text-gray-500 mt-1">Submitted: 28 Sep 2025</p>
                                        <div class="flex items-center mt-2">
                                            <span class="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded">Public Works Dept</span>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <span class="status-badge status-inprogress">In Progress</span>
                                        <p class="text-xs text-gray-500 mt-1">SETU-2025-01234</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Grievance Item 5 -->
                            <div class="grievance-item p-6" data-grievance="SETU-2025-01128">
                                <div class="flex justify-between items-start">
                                    <div>
                                        <h3 class="font-medium text-gray-900">Drainage Blockage in Park</h3>
                                        <p class="text-sm text-gray-500 mt-1">Submitted: 20 Sep 2025</p>
                                        <div class="flex items-center mt-2">
                                            <span class="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded">Municipal Corporation</span>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <span class="status-badge status-resolved">Resolved</span>
                                        <p class="text-xs text-gray-500 mt-1">SETU-2025-01128</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    
                </div>

                <!-- Grievance Details -->
                <div class="lg:col-span-2">
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Grievance Details</h2>
                        </div>
                        
                        <!-- Default State (No Grievance Selected) -->
                        <div id="no-selection" class="p-8 text-center">
                            <div class="max-w-md mx-auto">
                                <i class="fas fa-search text-gray-300 text-6xl mb-4"></i>
                                <h3 class="font-heading text-xl font-bold text-gray-700 mb-2">Select a Grievance</h3>
                                <p class="text-gray-600">Choose a grievance from the list to view its detailed status and tracking information.</p>
                            </div>
                        </div>

                        <!-- Grievance Details Content -->
                        <div id="grievance-details" class="hidden">
                            <!-- Header -->
                            <div class="p-6 border-b border-gray-200">
                                <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                                    <div>
                                        <h3 class="font-heading text-2xl font-bold text-primary-blue" id="detail-title">Water Supply Issue in Sector 15</h3>
                                        <div class="flex flex-wrap items-center mt-2 gap-2">
                                            <span class="status-badge status-inprogress" id="detail-status">In Progress</span>
                                            <span class="text-sm text-gray-500">Grievance ID: <span id="detail-id" class="font-mono">SETU-2025-01542</span></span>
                                            <span class="text-sm text-gray-500">Submitted: <span id="detail-date">15 Oct 2025</span></span>
                                        </div>
                                    </div>
                                    <div class="mt-4 md:mt-0">
                                        <button class="px-4 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center">
                                            <i class="fas fa-download mr-2"></i>
                                            Download
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <!-- Grievance Information -->
                            <div class="p-6 border-b border-gray-200">
                                <h4 class="font-heading text-lg font-bold text-primary-blue mb-4">Grievance Information</h4>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <p class="text-sm text-gray-500">Department</p>
                                        <p class="font-medium" id="detail-department">Water Department</p>
                                    </div>
                                    <div>
                                        <p class="text-sm text-gray-500">Location</p>
                                        <p class="font-medium" id="detail-location">Sector 15, Chandigarh</p>
                                    </div>
                                    <div>
                                        <p class="text-sm text-gray-500">Priority</p>
                                        <p class="font-medium" id="detail-priority">High</p>
                                    </div>
                                    <div>
                                        <p class="text-sm text-gray-500">Expected Resolution</p>
                                        <p class="font-medium" id="detail-resolution">25 Oct 2025</p>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <p class="text-sm text-gray-500">Description</p>
                                    <p class="mt-1" id="detail-description">Irregular water supply in Sector 15 for the past 5 days. Water pressure is very low during morning and evening hours, affecting daily activities.</p>
                                </div>
                            </div>

                            <!-- Status Timeline -->
                            <div class="p-6 border-b border-gray-200">
                                <h4 class="font-heading text-lg font-bold text-primary-blue mb-4">Status Timeline</h4>
                                <div class="timeline">
                                    <div class="timeline-item completed">
                                        <div class="bg-gray-50 p-4 rounded-lg">
                                            <div class="flex justify-between items-start">
                                                <div>
                                                    <h5 class="font-medium">Grievance Submitted</h5>
                                                    <p class="text-sm text-gray-600 mt-1">Your grievance has been successfully submitted to the system.</p>
                                                </div>
                                                <span class="text-sm text-gray-500">15 Oct 2025, 10:30 AM</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item completed">
                                        <div class="bg-gray-50 p-4 rounded-lg">
                                            <div class="flex justify-between items-start">
                                                <div>
                                                    <h5 class="font-medium">Under Review</h5>
                                                    <p class="text-sm text-gray-600 mt-1">Your grievance is being reviewed by the department.</p>
                                                </div>
                                                <span class="text-sm text-gray-500">16 Oct 2025, 2:15 PM</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item completed">
                                        <div class="bg-gray-50 p-4 rounded-lg">
                                            <div class="flex justify-between items-start">
                                                <div>
                                                    <h5 class="font-medium">Field Inspection Scheduled</h5>
                                                    <p class="text-sm text-gray-600 mt-1">A field inspection has been scheduled for 18 Oct 2025.</p>
                                                </div>
                                                <span class="text-sm text-gray-500">17 Oct 2025, 11:00 AM</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item completed">
                                        <div class="bg-gray-50 p-4 rounded-lg">
                                            <div class="flex justify-between items-start">
                                                <div>
                                                    <h5 class="font-medium">Field Inspection Completed</h5>
                                                    <p class="text-sm text-gray-600 mt-1">Field inspection has been completed. Issue identified as water pressure problem.</p>
                                                </div>
                                                <span class="text-sm text-gray-500">18 Oct 2025, 4:30 PM</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item active">
                                        <div class="bg-blue-50 p-4 rounded-lg border-l-4 border-primary-blue">
                                            <div class="flex justify-between items-start">
                                                <div>
                                                    <h5 class="font-medium">Resolution In Progress</h5>
                                                    <p class="text-sm text-gray-600 mt-1">Technical team is working on resolving the water pressure issue.</p>
                                                </div>
                                                <span class="text-sm text-gray-500">20 Oct 2025, 9:45 AM</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="timeline-item">
                                        <div class="bg-gray-50 p-4 rounded-lg opacity-70">
                                            <div class="flex justify-between items-start">
                                                <div>
                                                    <h5 class="font-medium">Resolution Completed</h5>
                                                    <p class="text-sm text-gray-600 mt-1">Expected completion of resolution work.</p>
                                                </div>
                                                <span class="text-sm text-gray-500">25 Oct 2025 (Expected)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Department Contact -->
                            <div class="p-6">
                                <h4 class="font-heading text-lg font-bold text-primary-blue mb-4">Department Contact</h4>
                                <div class="bg-blue-50 p-4 rounded-lg">
                                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                                        <div>
                                            <h5 class="font-medium" id="detail-contact-dept">WaterDepartment@setu.com</h5>
                                            <div class="flex items-center mt-2">
                                              
                                            </div>
                                        </div>
                                        <div class="mt-4 md:mt-0">
                                            <button class="px-4 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center">
                                                <i class="fas fa-envelope mr-2"></i>
                                                Send Message
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Related Grievances -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden mt-8">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Related Grievances</h2>
                        </div>
                        <div class="p-6">
                            <div class="space-y-4">
                                <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                                    <div>
                                        <p class="font-medium">Sector 15 Water Pressure Issue</p>
                                        <p class="text-xs text-gray-600 mt-1">Submitted by: Neha Gupta • 12 Oct 2025</p>
                                    </div>
                                    <span class="status-badge status-resolved">Resolved</span>
                                </div>
                                <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                                    <div>
                                        <p class="font-medium">Water Supply Problem - Sector 15</p>
                                        <p class="text-xs text-gray-600 mt-1">Submitted by: Amit Kumar • 8 Oct 2025</p>
                                    </div>
                                    <span class="status-badge status-resolved">Resolved</span>
                                </div>
                                <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                                    <div>
                                        <p class="font-medium">Low Water Pressure in Morning</p>
                                        <p class="text-xs text-gray-600 mt-1">Submitted by: Priya Singh • 5 Oct 2025</p>
                                    </div>
                                    <span class="status-badge status-inprogress">In Progress</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Quick Actions -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden mt-8">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Quick Actions</h2>
                        </div>
                        <div class="p-6 space-y-4">
                            <a href="submit.jsp"><button class="w-full flex items-center justify-between p-4 bg-blue-50 text-primary-blue rounded-lg hover:bg-blue-100 transition">
                                <div class="flex items-center">
                                    <i class="fas fa-plus-circle mr-3"></i>
                                    <span>Submit New Grievance</span>
                                </div>
                                <i class="fas fa-chevron-right"></i>
                            </button></a>
                            <button class="w-full flex items-center justify-between p-4 bg-blue-50 text-primary-blue rounded-lg hover:bg-blue-100 transition">
                                <div class="flex items-center">
                                    <i class="fas fa-download mr-3"></i>
                                    <span>Download Status Report</span>
                                </div>
                                <i class="fas fa-chevron-right"></i>
                            </button>
                            <button class="w-full flex items-center justify-between p-4 bg-blue-50 text-primary-blue rounded-lg hover:bg-blue-100 transition">
                                <div class="flex items-center">
                                    <i class="fas fa-share-alt mr-3"></i>
                                    <span>Share Status Update</span>
                                </div>
                                <i class="fas fa-chevron-right"></i>
                            </button>
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
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763748052/SETU_LOGO-removebg_kxwnmb.png" alt="selu logo" class="h-16 invert">
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
    <script src="${pageContext.request.contextPath}/js/track-report.js"></script>
</body>
</html>