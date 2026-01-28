
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback | Setu | Citizen Grievance Redressal Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../style/feedback.css">
    <script src="../js/tailwindConfig.js"></script>
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
                <a href="dashboard.jsp" class="flex items-center gap-3">
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763747450/SETU_LOGO_wwapwe.jpg" alt="setu logo" class="h-12">
                    <div>
                        <span class="text-2xl font-heading font-extrabold text-primary-blue">Setu</span>
                        <p class="text-xs text-gray-500 font-semibold tracking-wide">Citizen Grievance Redressal Portal</p>
                    </div>
                </a>
                <div class="flex items-center space-x-4">
                    <div class="hidden md:flex items-center space-x-2 bg-blue-50 px-4 py-2 rounded-lg">
                        <div class="h-10 w-10 bg-primary-blue rounded-full flex items-center justify-center text-white font-bold">RS</div>
                        <div>
                            <p class="text-sm font-medium">Rahul Sharma</p>
                            <p class="text-xs text-gray-500">Civic Points: 245</p>
                        </div>
                    </div>
                    <a href="dashboard.jsp"><button id="back-dashbord" class="px-4 py-2 text-sm font-medium text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200 transition">
                        Dashboard   
                    </button></a>
                </div>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="flex">
        <!-- Feedback Form Content -->
        <div class="flex-1 p-6 md:p-8">
            <!-- Page Header -->
            <div class="bg-gradient-to-r from-primary-blue to-blue-700 rounded-2xl p-6 text-white mb-8 card-glow">
                <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                    <div>
                        <h1 class="font-heading text-2xl md:text-3xl font-bold mb-2">Share Your Feedback</h1>
                        <p class="text-blue-100">Help us improve Setu by sharing your experience and suggestions</p>
                    </div>
                    <div class="mt-4 md:mt-0 flex items-center">
                        <i class="fas fa-comment-alt text-white text-2xl mr-3"></i>
                        <span class="text-blue-100">Your opinion matters to us</span>
                    </div>
                </div>
            </div>

            <!-- Feedback Form -->
            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <!-- Main Form -->
                <div class="lg:col-span-2">
                    <div class="feedback-section bg-white rounded-2xl shadow-lifted p-8">
                        <form id="feedback-form">
                            <!-- Overall Experience -->
                            <div class="mb-8">
                                <h2 class="font-heading text-xl font-bold text-primary-blue mb-4">Overall Experience</h2>
                                <p class="text-gray-600 mb-4">How would you rate your experience with Setu?</p>
                                
                                <div class="text-center">
                                    <div class="feedback-emoji" id="emoji">😊</div>
                                    <div class="rating-stars">
                                        <input type="radio" id="star5" name="rating" value="5">
                                        <label for="star5">★</label>
                                        <input type="radio" id="star4" name="rating" value="4">
                                        <label for="star4">★</label>
                                        <input type="radio" id="star3" name="rating" value="3">
                                        <label for="star3">★</label>
                                        <input type="radio" id="star2" name="rating" value="2">
                                        <label for="star2">★</label>
                                        <input type="radio" id="star1" name="rating" value="1">
                                        <label for="star1">★</label>
                                    </div>
                                    <p class="text-sm text-gray-500 mt-2" id="rating-text">Select a rating</p>
                                </div>
                            </div>

                            <!-- Specific Feedback -->
                            <div class="mb-8">
                                <h2 class="font-heading text-xl font-bold text-primary-blue mb-4">Specific Feedback</h2>
                                <p class="text-gray-600 mb-4">What aspects of Setu would you like to provide feedback on?</p>
                                
                                <div class="feedback-categories">
                                    <div class="feedback-category">
                                        <input type="checkbox" id="usability" name="categories" value="usability">
                                        <label for="usability">
                                            <span class="font-medium">Usability & Interface</span>
                                            <p class="text-sm text-gray-500 mt-1">How easy was it to navigate and use the portal?</p>
                                        </label>
                                    </div>
                                    
                                    <div class="feedback-category">
                                        <input type="checkbox" id="grievance-process" name="categories" value="grievance-process">
                                        <label for="grievance-process">
                                            <span class="font-medium">Grievance Submission Process</span>
                                            <p class="text-sm text-gray-500 mt-1">How smooth was the process of submitting a grievance?</p>
                                        </label>
                                    </div>
                                    
                                    <div class="feedback-category">
                                        <input type="checkbox" id="tracking" name="categories" value="tracking">
                                        <label for="tracking">
                                            <span class="font-medium">Status Tracking</span>
                                            <p class="text-sm text-gray-500 mt-1">How effective was the status tracking feature?</p>
                                        </label>
                                    </div>
                                    
                                    <div class="feedback-category">
                                        <input type="checkbox" id="response-time" name="categories" value="response-time">
                                        <label for="response-time">
                                            <span class="font-medium">Response Time</span>
                                            <p class="text-sm text-gray-500 mt-1">How satisfied are you with the response time?</p>
                                        </label>
                                    </div>
                                    
                                    <div class="feedback-category">
                                        <input type="checkbox" id="resolution" name="categories" value="resolution">
                                        <label for="resolution">
                                            <span class="font-medium">Resolution Quality</span>
                                            <p class="text-sm text-gray-500 mt-1">How satisfied are you with the resolution of your grievances?</p>
                                        </label>
                                    </div>
                                    
                                    <div class="feedback-category">
                                        <input type="checkbox" id="support" name="categories" value="support">
                                        <label for="support">
                                            <span class="font-medium">Support & Help</span>
                                            <p class="text-sm text-gray-500 mt-1">How helpful was the support and help section?</p>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Detailed Feedback -->
                            <div class="mb-8">
                                <h2 class="font-heading text-xl font-bold text-primary-blue mb-4">Detailed Feedback</h2>
                                
                                <div class="mb-6">
                                    <label for="subject" class="block text-sm font-medium text-gray-700 mb-2">Subject</label>
                                    <input type="text" id="subject" name="subject" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue transition" placeholder="Brief summary of your feedback">
                                </div>
                                
                                <div class="mb-6">
                                    <label for="message" class="block text-sm font-medium text-gray-700 mb-2">Your Feedback</label>
                                    <textarea id="message" name="message" rows="6" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue transition" placeholder="Please provide detailed feedback about your experience with Setu"></textarea>
                                </div>
                                
                                <div class="mb-6">
                                    <label for="suggestions" class="block text-sm font-medium text-gray-700 mb-2">Suggestions for Improvement</label>
                                    <textarea id="suggestions" name="suggestions" rows="4" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue transition" placeholder="Any suggestions to make Setu better?"></textarea>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <div class="flex justify-end">
                                <button type="submit" class="px-8 py-3 bg-primary-blue text-white font-bold rounded-lg hover:bg-blue-800 transition flex items-center">
                                    <i class="fas fa-paper-plane mr-2"></i>
                                    Submit Feedback
                                </button>
                            </div>
                        </form>

                        <!-- Success Message -->
                        <div id="success-message" class="success-message">
                            <i class="fas fa-check-circle text-accent-green text-3xl mb-3"></i>
                            <h3 class="font-heading text-xl font-bold text-accent-green mb-2">Thank You for Your Feedback!</h3>
                            <p class="text-gray-700">Your feedback has been submitted successfully. We appreciate your time and will use your input to improve Setu.</p>
                            <p class="text-gray-500 mt-2">As a token of appreciation, you've earned <span class="font-bold">5 Civic Points</span>!</p>
                            <button id="new-feedback-btn" class="mt-4 px-6 py-2 bg-primary-blue text-white rounded-lg hover:bg-blue-800 transition">
                                Submit Another Feedback
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Sidebar -->
                <div class="space-y-8">
                    <!-- Why Feedback Matters -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Why Your Feedback Matters</h2>
                        </div>
                        <div class="p-6">
                            <ul class="space-y-4">
                                <li class="flex items-start">
                                    <i class="fas fa-user-edit text-primary-blue mt-1 mr-3"></i>
                                    <div>
                                        <p class="font-medium">Improve Citizen Experience</p>
                                        <p class="text-sm text-gray-500 mt-1">Your feedback helps us enhance the platform for all users</p>
                                    </div>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-cogs text-primary-blue mt-1 mr-3"></i>
                                    <div>
                                        <p class="font-medium">Identify Technical Issues</p>
                                        <p class="text-sm text-gray-500 mt-1">Report bugs or usability problems we might have missed</p>
                                    </div>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-lightbulb text-primary-blue mt-1 mr-3"></i>
                                    <div>
                                        <p class="font-medium">Drive Innovation</p>
                                        <p class="text-sm text-gray-500 mt-1">Your suggestions can lead to new features and improvements</p>
                                    </div>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-award text-primary-blue mt-1 mr-3"></i>
                                    <div>
                                        <p class="font-medium">Earn Civic Points</p>
                                        <p class="text-sm text-gray-500 mt-1">Get rewarded for contributing to better governance</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Feedback Guidelines -->
                    <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                        <div class="px-6 py-4 border-b border-gray-200">
                            <h2 class="font-heading text-xl font-bold text-primary-blue">Feedback Guidelines</h2>
                        </div>
                        <div class="p-6">
                            <ul class="space-y-3 text-sm text-gray-600">
                                <li class="flex items-start">
                                    <i class="fas fa-check text-accent-green mt-1 mr-2"></i>
                                    <span>Be specific and provide examples where possible</span>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-check text-accent-green mt-1 mr-2"></i>
                                    <span>Focus on the experience, not individuals</span>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-check text-accent-green mt-1 mr-2"></i>
                                    <span>Suggest constructive improvements</span>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-check text-accent-green mt-1 mr-2"></i>
                                    <span>Mention what you liked as well as what can be improved</span>
                                </li>
                                <li class="flex items-start">
                                    <i class="fas fa-check text-accent-green mt-1 mr-2"></i>
                                    <span>Your feedback is anonymous unless you choose to share contact details</span>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Civic Points Info -->
                    <div class="bg-gradient-to-r from-accent-green to-green-600 rounded-2xl p-6 text-white">
                        <div class="flex items-center mb-4">
                            <i class="fas fa-award text-2xl mr-3"></i>
                            <h3 class="font-heading text-xl font-bold">Earn Civic Points</h3>
                        </div>
                        <p class="mb-4">Submit valuable feedback and earn Civic Points that can be redeemed for exclusive benefits.</p>
                        <div class="bg-white/20 rounded-lg p-4">
                            <p class="font-bold text-lg">+5 Points</p>
                            <p class="text-sm">For submitting detailed feedback</p>
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
 <script src="../js/feedback.js"></script>
</body>
</html>
