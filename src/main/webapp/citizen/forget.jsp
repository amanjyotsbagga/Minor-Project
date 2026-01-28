<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | Setu | Citizen Grievance Redressal Portal</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts: Poppins (for headings) & Inter (for body) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/forget.css">
    <script>
        
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        heading: ['Poppins', 'sans-serif'],
                    },
                    colors: {
                        'primary-blue': '#1E3A8A', 
                        'accent-saffron': '#F97316', 
                        'accent-green': '#059669',   
                        'light-bg': '#F3F4F6',     
                        'dark-text': '#1F2937',      
                        'light-blue-bg': '#EFF6FF', 
                        'brand-gold': '#FFC107',    
                    },
                    boxShadow: {
                        'subtle': '0 4px 12px 0 rgba(0, 0, 0, 0.05)',
                        'lifted': '0 10px 30px -5px rgba(0, 0, 0, 0.1)',
                    },
                    animation: {
                        'gradient-pan': 'gradient-pan 6s ease infinite',
                    },
                    keyframes: {
                        'gradient-pan': {
                            '0%, 100%': { backgroundPosition: '0% 50%' },
                            '50%': { backgroundPosition: '100% 50%' },
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-light-bg text-dark-text font-sans antialiased">
    <div class="gtranslate_wrapper hidden"></div>
<script>window.gtranslateSettings = {"default_language":"en","native_language_names":true,"languages":["en","hi","mr","pa","gu","ta","te","ml","kn","bn"],"wrapper_selector":".gtranslate_wrapper","horizontal_position":"left","vertical_position":"bottom"}</script>
<script src="../js/lang.js" defer></script>
<link rel="stylesheet" href="../style/lang.css">
    <!-- Top Bar -->
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
                <ul class="hidden md:flex items-center space-x-8">
                    <li><a href="../index.html" class="font-semibold text-gray-700 hover:text-primary-blue transition-colors">Home</a></li>
                    <li><a href="login.jsp" class="px-5 py-2.5 text-sm font-bold text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200 hover:shadow-inner transition">Citizen Login</a></li>
                </ul>
                <button id="mobile-menu-button" class="md:hidden text-dark-text">
                    <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
                </button>
            </nav>
        </div>
        <!-- Mobile Menu -->
        <div id="mobile-menu" class="hidden md:hidden bg-white shadow-lg border-t border-gray-200">
            <ul class="flex flex-col items-center space-y-4 py-4">
                <li><a href="../index.html" class="block font-semibold text-gray-700 hover:text-primary-blue">Home</a></li>
                <li><a href="login.jsp" class="w-11/12 text-center mt-2 px-5 py-2.5 font-bold text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200">Citizen Login</a></li>
            </ul>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <!-- Forgot Password Section -->
        <section class="py-20 bg-light-blue-bg">
            <div class="container mx-auto px-6 max-w-4xl">
                <div class="card-glow bg-white rounded-2xl shadow-lifted overflow-hidden">
                    <div class="grid md:grid-cols-2">
                        <!-- Left side - Form -->
                        <div class="p-8 md:p-12">
                            <div class="flex justify-between items-center mb-8">
                                <h2 class="font-heading text-3xl font-bold text-primary-blue">Reset Your Password</h2>
                                <a href="login.jsp" class="text-gray-500 hover:text-gray-700">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
                                </a>
                            </div>
                            
                            <!-- Step 1: Request Reset -->
                            <div id="step-request" class="space-y-6 fade-in">
                                <div class="bg-blue-50 p-4 rounded-lg mb-4">
                                    <p class="text-sm text-primary-blue">Enter your registered email address and phone number to receive a password reset link.</p>
                                </div>
                                
                                <form id="forgot-password-form" class="space-y-6">
                                    <div>
                                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                                        <input type="email" id="email" name="email" required class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" placeholder="Enter your registered email">
                                        <p id="email-error" class="text-xs text-red-500 mt-1 hidden">Please enter a valid email address</p>
                                    </div>
                                    
                                    <div>
                                        <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                                        <div class="flex">
                                            <div class="flex-shrink-0 z-10 inline-flex items-center py-3 px-4 text-sm text-gray-500 bg-gray-100 border border-r-0 border-gray-300 rounded-l-lg">
                                                +91
                                            </div>
                                            <input type="tel" id="phone" name="phone" required class="form-input w-full px-4 py-3 border border-gray-300 rounded-r-lg rounded-l-none focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" placeholder="Enter your registered phone number">
                                        </div>
                                        <p id="phone-error" class="text-xs text-red-500 mt-1 hidden">Please enter a valid 10-digit phone number</p>
                                    </div>
                                    <div>
                                        <label for="captcha" class="block text-sm font-medium text-gray-700 mb-1">Security Code</label>
                                        <div class="flex space-x-4">
                                            <div class="flex-1">
                                                <input type="text" id="captcha" name="captcha" required class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" placeholder="Enter the code shown">
                                            </div>
                                            <div class="bg-gray-200 rounded-lg flex items-center justify-center px-4 font-mono text-lg font-bold select-none" id="captcha-container">
                                                <span id="captcha-code">A3B7</span>
                                            </div>
                                            <button type="button" id="refresh-captcha" class="text-primary-blue hover:text-blue-800 transition-colors">
                                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                                                </svg>
                                            </button>
                                        </div>
                                        <p id="captcha-error" class="text-xs text-red-500 mt-1 hidden">Please enter the correct security code</p>
                                    </div>
                                    
                                    <button type="submit" id="submit-btn" class="w-full py-3 px-4 bg-primary-blue text-white font-bold rounded-lg hover:bg-blue-800 transition duration-300 transform hover:scale-105 flex items-center justify-center">
                                        <span id="submit-text">Send Reset Link</span>
                                        <div id="submit-spinner" class="loading-spinner ml-2 hidden"></div>
                                    </button>
                                    
                                    <div class="text-center mt-4">
                                        <p class="text-sm text-gray-600">
                                            Remember your password? 
                                            <a href="login.jsp" class="text-primary-blue font-medium hover:underline">Sign In</a>
                                        </p>
                                    </div>
                                </form>
                            </div>
                            
                            <!-- Step 2: Verification Code -->
                            <div id="step-verify" class="space-y-6 hidden">
                                <div class="bg-blue-50 p-4 rounded-lg mb-4">
                                    <p class="text-sm text-primary-blue">We've sent a 6-digit verification code to your registered email. Please enter it below.</p>
                                </div>
                                
                                <div>
                                    <label for="verification-code" class="block text-sm font-medium text-gray-700 mb-1">Verification Code</label>
                                    <div class="flex space-x-2">
                                        <input type="text" maxlength="1" class="form-input w-12 h-12 text-center text-xl border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" oninput="moveToNext(this, 1)">
                                        <input type="text" maxlength="1" class="form-input w-12 h-12 text-center text-xl border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" oninput="moveToNext(this, 2)">
                                        <input type="text" maxlength="1" class="form-input w-12 h-12 text-center text-xl border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" oninput="moveToNext(this, 3)">
                                        <input type="text" maxlength="1" class="form-input w-12 h-12 text-center text-xl border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" oninput="moveToNext(this, 4)">
                                        <input type="text" maxlength="1" class="form-input w-12 h-12 text-center text-xl border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" oninput="moveToNext(this, 5)">
                                        <input type="text" maxlength="1" class="form-input w-12 h-12 text-center text-xl border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" oninput="moveToNext(this, 6)">
                                    </div>
                                    <p id="code-error" class="text-xs text-red-500 mt-1 hidden">Please enter the 6-digit verification code</p>
                                </div>
                                
                                <div class="text-center">
                                    <p class="text-sm text-gray-600">Didn't receive the code? <button id="resend-code" class="text-primary-blue font-medium hover:underline">Resend Code</button></p>
                                    <p id="countdown" class="text-xs text-gray-500 mt-1">Resend available in <span id="countdown-timer">60</span> seconds</p>
                                </div>
                                
                                <button type="button" id="verify-code-btn" class="w-full py-3 px-4 bg-primary-blue text-white font-bold rounded-lg hover:bg-blue-800 transition duration-300 transform hover:scale-105">
                                    Verify Code
                                </button>
                                
                                <button type="button" id="back-to-request" class="w-full py-3 px-4 bg-gray-200 text-gray-700 font-bold rounded-lg hover:bg-gray-300 transition duration-300">
                                    Back
                                </button>
                            </div>
                            
                            <!-- Step 3: Reset Password -->
                            <div id="step-reset" class="space-y-6 hidden">
                                <div class="bg-blue-50 p-4 rounded-lg mb-4">
                                    <p class="text-sm text-primary-blue">Create a new password for your account. Make sure it's strong and secure.</p>
                                </div>
                                
                                <div>
                                    <label for="new-password" class="block text-sm font-medium text-gray-700 mb-1">New Password</label>
                                    <input type="password" id="new-password" name="new-password" required class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" placeholder="Enter your new password">
                                    <div id="password-strength" class="mt-2">
                                        <div class="h-2 bg-gray-200 rounded-full overflow-hidden">
                                            <div id="password-strength-bar" class="h-full transition-all duration-300" style="width: 0%"></div>
                                        </div>
                                        <p id="password-feedback" class="text-xs mt-1 text-gray-500">Password strength indicator</p>
                                    </div>
                                </div>
                                
                                <div>
                                    <label for="confirm-password" class="block text-sm font-medium text-gray-700 mb-1">Confirm New Password</label>
                                    <input type="password" id="confirm-password" name="confirm-password" required class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" placeholder="Confirm your new password">
                                    <p id="password-match" class="text-xs mt-1 text-gray-500"></p>
                                </div>
                                
                                <button type="button" id="reset-password-btn" class="w-full py-3 px-4 bg-primary-blue text-white font-bold rounded-lg hover:bg-blue-800 transition duration-300 transform hover:scale-105">
                                    Reset Password
                                </button>
                                
                                <button type="button" id="back-to-verify" class="w-full py-3 px-4 bg-gray-200 text-gray-700 font-bold rounded-lg hover:bg-gray-300 transition duration-300">
                                    Back
                                </button>
                            </div>
                            
                            <!-- Success Message -->
                            <div id="success-message" class="hidden mt-6 p-4 bg-accent-green/10 border border-accent-green/20 rounded-lg fade-in">
                                <div class="flex items-center">
                                    <svg class="h-5 w-5 text-accent-green mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <span class="text-accent-green font-medium">Password reset successful!</span>
                                </div>
                                <p class="text-sm text-gray-600 mt-2">Your password has been reset successfully. You can now log in with your new password.</p>
                                <div class="mt-4">
                                    <a href="login.jsp" class="inline-block w-full text-center py-2 px-4 bg-accent-green text-white font-medium rounded-lg hover:bg-green-700 transition duration-300">
                                        Go to Login
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Right side - Info -->
                        <div class="bg-primary-blue text-white p-8 md:p-12 flex flex-col justify-center">
                            <div class="mb-6">
                                <h3 class="font-heading text-2xl font-bold mb-4">Password Reset Instructions</h3>
                                <p class="mb-6">Follow these steps to securely reset your password:</p>
                                <ul class="space-y-4">
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">1</div>
                                        <span>Enter your registered email address and phone number</span>
                                    </li>
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">2</div>
                                        <span>Complete the security verification</span>
                                    </li>
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">3</div>
                                        <span>Check your email for the verification code</span>
                                    </li>
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">4</div>
                                        <span>Enter the verification code</span>
                                    </li>
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">5</div>
                                        <span>Create a new strong password</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="mt-8 p-4 bg-blue-800 rounded-lg">
                                <h4 class="font-bold mb-2">Password Security Tips</h4>
                                <ul class="text-sm space-y-1">
                                    <li class="flex items-start">
                                        <svg class="h-4 w-4 text-accent-saffron mr-2 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        <span>Use at least 8 characters with a mix of letters, numbers, and symbols</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg class="h-4 w-4 text-accent-saffron mr-2 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        <span>Avoid using personal information like your name or birthdate</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg class="h-4 w-4 text-accent-saffron mr-2 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        <span>Don't reuse passwords across different websites</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="mt-6 p-4 bg-blue-800 rounded-lg">
                                <h4 class="font-bold mb-2">Need Help?</h4>
                                <p class="text-sm">If you're having trouble resetting your password, please contact our support team at <a href="mailto:support@setu.gov.in" class="text-accent-saffron underline">support@setu.gov.in</a> or call our helpline at <strong>1800-1234-5678</strong>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

   <!-- Simplified Enhanced Footer -->
<footer class="bg-primary-blue text-white">
    <div class="container mx-auto px-6 pt-12 pb-8">
        <!-- Main Footer Content -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-10">
            <!-- Brand & Description -->
            <div class="text-center md:text-left">
                <div class="flex flex-col md:flex-row items-center md:items-start gap-4 mb-6">
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763748052/SETU_LOGO-removebg_kxwnmb.png" alt="setu logo" class="h-16 invert">
                    <div>
                        <h3 class="font-heading font-bold text-xl mb-2">Setu Grievance Redressal Portal</h3>
                        <p class="text-blue-200 text-sm">Government of India Initiative</p>
                    </div>
                </div>
                <p class="text-blue-200 text-sm mb-6 leading-relaxed">A single window platform for citizens to register grievances and track resolution status.</p>
                
                <div class="flex space-x-4 justify-center md:justify-start">
                    <a href="https://www.facebook.com/" class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition" aria-label="Facebook">
                        <i class="fab fa-facebook-f text-sm"></i>
                    </a>
                    <a href="https://x.com/" class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition" aria-label="Twitter">
                        <i class="fab fa-twitter text-sm"></i>
                    </a>
                    <a href="https://www.youtube.com/youtube" class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition" aria-label="YouTube">
                        <i class="fab fa-youtube text-sm"></i>
                    </a>
                    <a href="https://www.instagram.com/accounts/login/" class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition" aria-label="Instagram">
                        <i class="fab fa-instagram text-sm"></i>
                    </a>
                </div>
            </div>

            <!-- Contact & Help -->
            <div>
                <h4 class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Contact & Help</h4>
                <div class="space-y-4">
                    <div class="flex items-start">
                        <div class="flex-shrink-0 h-10 w-10 bg-blue-800 rounded-lg flex items-center justify-center mr-3">
                            <i class="fas fa-phone-alt text-white text-sm"></i>
                        </div>
                        <div>
                            <p class="text-blue-200 text-sm font-medium">Helpline</p>
                            <p class="text-white font-medium">1800-11-1234</p>
                            <p class="text-blue-300 text-xs">Toll Free</p>
                        </div>
                    </div>
                    
                    <div class="flex items-start">
                        <div class="flex-shrink-0 h-10 w-10 bg-blue-800 rounded-lg flex items-center justify-center mr-3">
                            <i class="fas fa-envelope text-white text-sm"></i>
                        </div>
                        <div>
                            <p class="text-blue-200 text-sm font-medium">Email Support</p>
                            <p class="text-white font-medium">support@setu.gov.in</p>
                        </div>
                    </div>
                    
                    <div class="flex items-start">
                        <div class="flex-shrink-0 h-10 w-10 bg-blue-800 rounded-lg flex items-center justify-center mr-3">
                            <i class="fas fa-clock text-white text-sm"></i>
                        </div>
                        <div>
                            <p class="text-blue-200 text-sm font-medium">Working Hours</p>
                            <p class="text-white font-medium">Mon-Sat: 9:00 AM - 6:00 PM</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Government Initiatives -->
            <div>
                <h4 class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Government Initiatives</h4>
                <div class="space-y-3">
                    <a href="https://www.digitalindia.gov.in/" class="flex items-center p-3 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
                        <img src="https://indiadesignsystem.bombaydc.com/assets/india-designs/display/Digital-India/white.svg" alt="Digital India Logo" class="h-6 mr-3">
                        <span class="text-sm">Digital India</span>
                    </a>
                    
                    <a href="https://www.mygov.in/" class="flex items-center p-3 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
                        <img src="https://cdn.brandfetch.io/idMNzAn3uw/theme/dark/logo.svg?c=1dxbfHSJFAPEGdCLU4o5B" alt="MyGov Logo" class="h-5 mr-3">
                        <span class="text-sm">MyGov</span>
                    </a>
                    
                    <a href="https://www.india.gov.in/" class="flex items-center p-3 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
                        <i class="fas fa-university text-white mr-3"></i>
                        <span class="text-sm">National Portal of India</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- Important Links Section -->
        <div class="border-t border-blue-700 pt-8 mb-8">
            <h4 class="font-heading font-bold text-lg mb-6 text-center">Important Links</h4>
            <div class="grid grid-cols-2 md:grid-cols-6 gap-4 text-center">
                <a href="privacy-policy.html" class="text-blue-200 hover:text-white transition text-sm py-2">Privacy Policy</a>
                <a href="term.html" class="text-blue-200 hover:text-white transition text-sm py-2">Terms of Service</a>
                <a href="copy-right.html" class="text-blue-200 hover:text-white transition text-sm py-2">Copyright Policy</a>
                <a href="help-support.html" class="text-blue-200 hover:text-white transition text-sm py-2">Help & Support</a>
                <a href="how-to-submit.html" class="text-blue-200 hover:text-white transition text-sm py-2">Submit Grievance</a>
                <a href="guidelines.html" class="text-blue-200 hover:text-white transition text-sm py-2">Guidelines</a>
            </div>
        </div>

        <!-- Copyright & Info Section -->
        <div class="border-t border-blue-700 pt-6">
            <div class="text-center">
                <p class="text-blue-300 text-sm">
                    Designed, Developed and Hosted by 
                    <span class="font-semibold text-white">Team SETU</span>
                </p>
                <p class="text-blue-300 text-sm mt-1">
                    &copy; 2025 Setu Grievance Redressal Portal. All Rights Reserved.
                </p>
            </div>
        </div>
    </div>
</footer>

    <script src="${pageContext.request.contextPath}/js/forget.js"></script>
</body>
</html>