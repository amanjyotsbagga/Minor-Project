<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // Get the email from the session (set by SignupServlet)
    String email = (String) session.getAttribute("emailForVerification");

    // Get the error message from the request (set by VerifyOtpServlet if an error occurs)
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Verification | Setu | Citizen Grievance Redressal Portal</title>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts: Poppins (for headings) & Inter (for body) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    
    <script>
        // Custom Tailwind CSS configuration for an Indian Government theme
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        heading: ['Poppins', 'sans-serif'],
                    },
                    colors: {
                        'primary-blue': '#1E3A8A', // A deep, authoritative blue from the Ashoka Chakra
                        'accent-saffron': '#F97316', // Vibrant Saffron/Orange
                        'accent-green': '#059669',   // Rich Green
                        'light-bg': '#F3F4F6',     // Light Gray background
                        'dark-text': '#1F2937',      // Dark Gray for text
                        'light-blue-bg': '#EFF6FF', // A very light blue for sections
                        'brand-gold': '#FFC107',    // From prototype 1
                    },
                    boxShadow: {
                        'subtle': '0 4px 12px 0 rgba(0, 0, 0, 0.05)',
                        'lifted': '0 10px 30px -5px rgba(0, 0, 0, 0.1)',
                    }
                }
            }
        }
    </script>
    <style>
        .tricolor-bar {
            background: linear-gradient(to right, #F97316 33.3%, #FFFFFF 33.3%, #FFFFFF 66.6%, #059669 66.6%);
        }
        .card-glow {
            box-shadow: 0 10px 30px -5px rgba(30, 58, 138, 0.1);
        }
        .loading-spinner {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .otp-input-single {
            width: 100%;
            padding: 16px;
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            letter-spacing: 8px;
            border: 2px solid #d1d5db;
            border-radius: 12px;
            transition: all 0.3s ease;
            background-color: white;
        }
        .otp-input-single:focus {
            border-color: #1E3A8A;
            box-shadow: 0 0 0 3px rgba(30, 58, 138, 0.1);
            outline: none;
            transform: scale(1.02);
        }
        .otp-input-single.filled {
            border-color: #059669;
            background-color: #f0fdf4;
        }
        .validation-error {
            background-color: #fef2f2;
            border: 1px solid #fecaca;
            color: #dc2626;
            padding: 12px 16px;
            border-radius: 8px;
            margin: 16px 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .validation-error.hidden {
            display: none;
        }
    </style>
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
            <span id="datetime"><%= new java.text.SimpleDateFormat("EEEE, dd MMMM yyyy | hh:mm a z").format(new java.util.Date()) %></span>
        </div>
    </div>

    <!-- Header -->
    <header class="bg-white/90 backdrop-blur-lg sticky top-0 z-50 shadow-md border-b border-gray-200">
        <div class="container mx-auto px-6 py-3">
            <nav class="flex justify-between items-center">
                <a href="../index.jsp" class="flex items-center gap-3">
                    <img src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763747450/SETU_LOGO_wwapwe.jpg" alt="setu logo" class="h-12">
                    <div>
                        <span class="text-2xl font-heading font-extrabold text-primary-blue">सेतु Setu</span>
                        <p class="text-xs text-gray-500 font-semibold tracking-wide">Citizen Grievance Redressal Portal</p>
                    </div>
                </a>
                <ul class="hidden md:flex items-center space-x-8">
                    <li><a href="../index.jsp" class="font-semibold text-gray-700 hover:text-primary-blue transition-colors">Home</a></li>
                    <li><a href="login.jsp" class="px-5 py-2.5 text-sm font-bold text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200 hover:shadow-inner transition">Citizen Login</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <!-- Verification Section -->
        <section class="py-20 bg-light-blue-bg">
            <div class="container mx-auto px-6 max-w-4xl">
                <div class="card-glow bg-white rounded-2xl shadow-lifted overflow-hidden">
                    <div class="grid md:grid-cols-2">
                        <!-- Left side - Form -->
                        <div class="p-8 md:p-12">
                            <div class="flex justify-between items-center mb-8">
                                <h2 class="font-heading text-3xl font-bold text-primary-blue">Verify Your Account</h2>
                                <a href="login.jsp" class="text-gray-500 hover:text-gray-700">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
                                </a>
                            </div>
                            
                            <!-- Email Display -->
                            <div class="bg-blue-50 p-4 rounded-lg mb-6">
                                <p class="text-sm text-primary-blue">We've sent a verification code to your registered email. Please enter the code to complete your registration.</p>
                                <p class="font-medium text-primary-blue mt-2"><%= (email != null) ? email : "your email" %></p>
                            </div>
                            
                            <!-- OTP Form -->
                            <form action="../VerifyOtp" method="POST" id="otp-form">
                            	<input type="hidden" name="email" value="<%= email%>">
                                <div class="mb-6">
                                    <label for="otp" class="block text-sm font-medium text-gray-700 mb-2">Enter 6-digit verification code</label>
                                    <input 
                                        type="text" 
                                        id="otp" 
                                        name="otp" 
                                        class="otp-input-single"
                                        maxlength="6" 
                                        required 
                                        autofocus 
                                        autocomplete="one-time-code"
                                        placeholder="Enter 6-digit code"
                                        pattern="[0-9]{6}"
                                        title="Please enter exactly 6 digits">
                                    <p class="text-sm text-gray-500 mt-2 text-center">Enter the 6-digit code sent to your email</p>
                                </div>
                                
                                <!-- Validation Error Message -->
                                <div id="validation-error" class="validation-error hidden">
                                    <svg class="w-5 h-5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                                    </svg>
                                    <span>Please enter a valid 6-digit verification code</span>
                                </div>
                                
                                <%
                                    if (error != null && !error.isEmpty()) {
                                %>
                                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg mt-4 text-sm" role="alert">
                                        <%= error %>
                                    </div>
                                <%
                                    }
                                %>
                                
                                <button type="submit" class="w-full py-3 px-4 bg-primary-blue text-white font-bold rounded-lg hover:bg-blue-800 transition duration-300 transform hover:scale-105 flex items-center justify-center mt-6">
                                    <span id="verify-text">Verify Account</span>
                                    <div id="verify-spinner" class="loading-spinner ml-2 hidden"></div>
                                </button>
                            </form>
                            
                            <div class="text-center mt-6">
                                <p class="text-sm text-gray-600">
                                    Didn't receive the code? 
                                    <a href="ResendOtpServlet" class="text-primary-blue font-medium hover:underline">Resend Code</a>
                                </p>
                            </div>
                        </div>
                        
                        <!-- Right side - Info -->
                        <div class="bg-primary-blue text-white p-8 md:p-12 flex flex-col justify-center">
                            <div class="mb-6">
                                <h3 class="font-heading text-2xl font-bold mb-4">Account Verification</h3>
                                <p class="mb-6">To ensure the security of your account and protect your personal information, we require verification of your email address.</p>
                                <ul class="space-y-4">
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">1</div>
                                        <span>Check your email inbox for a 6-digit verification code</span>
                                    </li>
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">2</div>
                                        <span>Enter the code in the verification field</span>
                                    </li>
                                    <li class="flex items-start">
                                        <div class="bg-accent-saffron rounded-full h-6 w-6 flex items-center justify-center text-white text-sm font-bold mr-3 flex-shrink-0">3</div>
                                        <span>Click "Verify Account" to complete your registration</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="mt-8 p-4 bg-blue-800 rounded-lg">
                                <h4 class="font-bold mb-2">Why Verification is Important</h4>
                                <ul class="text-sm space-y-1">
                                    <li class="flex items-start">
                                        <svg class="h-4 w-4 text-accent-saffron mr-2 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        <span>Ensures only legitimate users access government services</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg class="h-4 w-4 text-accent-saffron mr-2 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        <span>Protects your personal information and grievance history</span>
                                    </li>
                                    <li class="flex items-start">
                                        <svg class="h-4 w-4 text-accent-saffron mr-2 mt-0.5 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                                        </svg>
                                        <span>Enables secure communication about your grievances</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="text-center py-8 text-gray-500 text-sm bg-white border-t">
        &copy; 2025 Setu Grievance Redressal Portal. All Rights Reserved.
    </footer>

    <script>
        // Simple OTP input validation
        document.addEventListener('DOMContentLoaded', function() {
            const otpInput = document.getElementById('otp');
            const validationError = document.getElementById('validation-error');
            const form = document.getElementById('otp-form');
            
            // Auto-format OTP input (only numbers, max 6 digits)
            otpInput.addEventListener('input', function(e) {
                // Remove any non-digit characters
                this.value = this.value.replace(/\D/g, '');
                
                // Limit to 6 characters
                if (this.value.length > 6) {
                    this.value = this.value.slice(0, 6);
                }
                
                // Update styling
                if (this.value.length === 6) {
                    this.classList.add('filled');
                } else {
                    this.classList.remove('filled');
                }
                
                // Hide validation error when typing
                if (this.value.length > 0) {
                    validationError.classList.add('hidden');
                }
            });
            
            // Form submission handler
            form.addEventListener('submit', function(e) {
                const otpValue = otpInput.value.trim();
                
                if (otpValue.length !== 6) {
                    e.preventDefault();
                    validationError.classList.remove('hidden');
                    otpInput.focus();
                    return;
                }
                
                // Show loading state
                const verifyText = document.getElementById('verify-text');
                const verifySpinner = document.getElementById('verify-spinner');
                const submitButton = form.querySelector('button[type="submit"]');
                
                verifyText.textContent = 'Verifying...';
                verifySpinner.classList.remove('hidden');
                submitButton.disabled = true;
            });
            
            // Focus OTP input on page load
            setTimeout(() => {
                otpInput.focus();
            }, 500);
        });
    </script>
</body>
</html>