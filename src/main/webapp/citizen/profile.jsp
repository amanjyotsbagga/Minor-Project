<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Settings | Setu | Citizen Grievance Redressal Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/profile.css">
    <script src="${pageContext.request.contextPath}/js/tailwindConfig.js"></script>
</head>
<body class="bg-light-bg text-dark-text font-sans antialiased">
    <!-- Top Bar -->    <div class="gtranslate_wrapper hidden"></div>
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
                   <a href="profile.jsp"> <div class="hidden md:flex items-center space-x-2 bg-blue-50 px-4 py-2 rounded-lg">
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
                <h2 class="font-heading text-xl font-bold text-primary-blue">Profile Settings</h2>
            </div>
            <nav class="mt-6">
                <button data-tab="personal" class="tab-button active w-full flex items-center px-6 py-3 text-primary-blue bg-blue-50 border-r-4 border-primary-blue text-left">
                    <i class="fas fa-user mr-3"></i>
                    <span>Personal Information</span>
                </button>
                <button data-tab="password" class="tab-button w-full flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition text-left">
                    <i class="fas fa-lock mr-3"></i>
                    <span>Password & Security</span>
                </button>
                <button data-tab="notifications" class="tab-button w-full flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition text-left">
                    <i class="fas fa-bell mr-3"></i>
                    <span>Notification Settings</span>
                </button>
                <button data-tab="privacy" class="tab-button w-full flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition text-left">
                    <i class="fas fa-shield-alt mr-3"></i>
                    <span>Privacy & Data</span>
                </button>
                <button data-tab="preferences" class="tab-button w-full flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition text-left">
                    <i class="fas fa-cog mr-3"></i>
                    <span>Preferences</span>
                </button>
            </nav>
        </div>

        <!-- Profile Content -->
        <div class="flex-1 p-6 md:p-8">
            <!-- Header Section -->
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-8">
                <div>
                    <h1 class="font-heading text-2xl md:text-3xl font-bold text-primary-blue">Profile Settings</h1>
                    <p class="text-gray-600 mt-2">Manage your account settings and preferences</p>
                </div>
                <div class="mt-4 md:mt-0 flex space-x-4">
                    <button id="discard-btn" class="px-6 py-2 border border-gray-300 text-gray-700 font-medium rounded-lg hover:bg-gray-50 transition">
                        Discard Changes
                    </button>
                    <button id="save-btn" class="px-6 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center">
                        <i class="fas fa-save mr-2"></i>
                        Save Changes
                    </button>
                </div>
            </div>

            <!-- Tab Content -->
            <div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
                <!-- Personal Information Tab -->
                <div id="personal-tab" class="tab-content p-6 md:p-8">
                    <h2 class="font-heading text-xl font-bold text-primary-blue mb-6">Personal Information</h2>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                        <div class="md:col-span-2">
                            <div class="flex flex-col md:flex-row items-start md:items-center space-y-4 md:space-y-0 md:space-x-6">
                                <div class="relative">
                                    <div class="h-24 w-24 bg-primary-blue rounded-full flex items-center justify-center text-white text-2xl font-bold">
                                        RS
                                    </div>
                                    <button class="absolute bottom-0 right-0 h-8 w-8 bg-accent-saffron rounded-full flex items-center justify-center text-white">
                                        <i class="fas fa-camera text-sm"></i>
                                    </button>
                                </div>
                                <div>
                                    <h3 class="font-medium text-lg">Profile Photo</h3>
                                    <p class="text-gray-600 text-sm mt-1">Recommended: Square JPG, PNG, at least 500x500 pixels</p>
                                    <div class="mt-3 flex space-x-3">
                                        <button class="px-4 py-2 bg-blue-100 text-primary-blue font-medium rounded-lg hover:bg-blue-200 transition text-sm">
                                            Upload New
                                        </button>
                                        <button class="px-4 py-2 bg-gray-100 text-gray-700 font-medium rounded-lg hover:bg-gray-200 transition text-sm">
                                            Remove
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form class="space-y-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="fullName" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                                <input type="text" id="fullName" name="fullName" value="Rahul Sharma" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                            </div>
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                                <input type="email" id="email" name="email" value="rahul.sharma@example.com" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" readonly>
                                <p class="text-xs text-gray-500 mt-1">Email cannot be changed here. Go to Password & Security tab.</p>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                                <div class="flex">
                                    <div class="flex-shrink-0 z-10 inline-flex items-center py-3 px-4 text-sm text-gray-500 bg-gray-100 border border-r-0 border-gray-300 rounded-l-lg">+91</div>
                                    <input type="tel" id="phone" name="phone" value="9876543210" class="form-input w-full px-4 py-3 border border-gray-300 rounded-r-lg rounded-l-none focus:ring-2 focus:ring-primary-blue focus:border-transparent transition" readonly>
                                </div>
                                <p class="text-xs text-gray-500 mt-1">Phone number cannot be changed here. Go to Password & Security tab.</p>
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Aadhaar Verification</label>
                                <div class="flex items-center space-x-4">
                                    <div class="flex items-center space-x-2">
                                        <span id="aadhaar-status" class="status-pending px-3 py-1 rounded-full text-xs font-medium">
                                            <i class="fas fa-clock mr-1"></i> Not Verified
                                        </span>
                                    </div>
                                    <a href="aadhar.html" class="px-4 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition text-sm whitespace-nowrap">
                                        Verify Now
                                    </a>
                                </div>
                                <p class="text-xs text-gray-500 mt-1">Verify your Aadhaar for enhanced account security</p>
                            </div>
                        </div>

                        <div>
                            <label for="address" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
                            <textarea id="address" name="address" rows="3" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">H.No. 123, Sector 15, Chandigarh, 160015</textarea>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <div>
                                <label for="state" class="block text-sm font-medium text-gray-700 mb-1">State</label>
                                <select id="state" name="state" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                    <option>Andaman and Nicobar Islands</option>
<option>Andhra Pradesh</option>
<option>Arunachal Pradesh</option>
<option>Assam</option>
<option>Bihar</option>
<option>Chandigarh</option>
<option>Chhattisgarh</option>
<option>Dadra and Nagar Haveli and Daman and Diu</option>
<option>Delhi</option>
<option>Goa</option>
<option>Gujarat</option>
<option>Haryana</option>
<option>Himachal Pradesh</option>
<option>Jammu and Kashmir</option>
<option>Jharkhand</option>
<option>Karnataka</option>
<option>Kerala</option>
<option>Ladakh</option>
<option>Lakshadweep</option>
<option>Madhya Pradesh</option>
<option>Maharashtra</option>
<option>Manipur</option>
<option>Meghalaya</option>
<option>Mizoram</option>
<option>Nagaland</option>
<option>Odisha</option>
<option>Puducherry</option>
<option>Punjab</option>
<option>Rajasthan</option>
<option>Sikkim</option>
<option>Tamil Nadu</option>
<option>Telangana</option>
<option>Tripura</option>
<option>Uttar Pradesh</option>
<option>Uttarakhand</option>
<option>West Bengal</option>

                                </select>
                            </div>
                            <div>
                                <label for="city" class="block text-sm font-medium text-gray-700 mb-1">City</label>
                                <input type="text" id="city" name="city" value="Chandigarh" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                            </div>
                            <div>
                                <label for="pincode" class="block text-sm font-medium text-gray-700 mb-1">Pincode</label>
                                <input type="text" id="pincode" name="pincode" value="160015" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Password & Security Tab -->
                <div id="password-tab" class="tab-content p-6 md:p-8 hidden">
                    <h2 class="font-heading text-xl font-bold text-primary-blue mb-6">Password & Security</h2>
                    
                    <div class="space-y-6">
                        <div class="bg-blue-50 p-4 rounded-lg mb-6">
                            <div class="flex">
                                <i class="fas fa-shield-alt text-primary-blue mt-1 mr-3"></i>
                                <div>
                                    <h3 class="font-medium text-primary-blue">Security Status: Strong</h3>
                                    <p class="text-sm text-blue-700 mt-1">Your account security is strong. Last password change: 15 Aug 2025</p>
                                </div>
                            </div>
                        </div>

                        <form class="space-y-6">
                            <div>
                                <h3 class="font-medium text-lg mb-4">Change Password</h3>
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                    <div>
                                        <label for="currentPassword" class="block text-sm font-medium text-gray-700 mb-1">Current Password</label>
                                        <input type="password" id="currentPassword" name="currentPassword" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                    </div>
                                    <div></div>
                                    <div>
                                        <label for="newPassword" class="block text-sm font-medium text-gray-700 mb-1">New Password</label>
                                        <input type="password" id="newPassword" name="newPassword" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                        <div id="password-strength" class="mt-2">
                                            <div class="h-2 bg-gray-200 rounded-full overflow-hidden">
                                                <div id="password-strength-bar" class="h-full transition-all duration-300" style="width: 0%"></div>
                                            </div>
                                            <p id="password-feedback" class="text-xs mt-1 text-gray-500">Password strength indicator</p>
                                        </div>
                                    </div>
                                    <div>
                                        <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-1">Confirm New Password</label>
                                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                        <p id="password-match" class="text-xs mt-1 text-gray-500"></p>
                                    </div>
                                </div>
                            </div>

                            <div class="border-t border-gray-200 pt-6">
                                <h3 class="font-medium text-lg mb-4">Two-Factor Authentication</h3>
                                <div class="space-y-4">
                                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                                        <div class="mb-3 md:mb-0">
                                            <p class="font-medium">Authenticator App</p>
                                            <p class="text-sm text-gray-600 mt-1">Use an authenticator app for two-factor authentication</p>
                                        </div>
                                        <div>
                                            <button class="px-4 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition text-sm">
                                                Set Up
                                            </button>
                                        </div>
                                    </div>
                                    <div class="flex flex-col md:flex-row justify-between items-start md:items-center">
                                        <div class="mb-3 md:mb-0">
                                            <p class="font-medium">SMS Authentication</p>
                                            <p class="text-sm text-gray-600 mt-1">Receive a verification code via SMS when signing in</p>
                                        </div>
                                        <div class="mt-3 md:mt-0">
                                            <label class="relative inline-flex items-center cursor-pointer">
                                                <input type="checkbox" class="sr-only peer" checked>
                                                <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="border-t border-gray-200 pt-6">
                                <h3 class="font-medium text-lg mb-4">Update Contact Information</h3>
                                <div class="space-y-4">
                                    <div id="email-change-section" class="p-4 bg-gray-50 rounded-lg">
                                        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-4">
                                            <div>
                                                <p class="font-medium">Change Email Address</p>
                                                <p class="text-sm text-gray-600 mt-1">Current: rahul.sharma@example.com</p>
                                            </div>
                                            <button type="button" id="change-email-btn" class="mt-3 md:mt-0 px-4 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition text-sm">
                                                Change Email
                                            </button>
                                        </div>
                                        <div id="email-otp-section" class="hidden">
                                            <div class="mb-4">
                                                <label for="email-change-password" class="block text-sm font-medium text-gray-700 mb-1">Enter Your Password</label>
                                                <input type="password" id="email-change-password" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                            </div>
                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                                                <div>
                                                    <label for="new-email" class="block text-sm font-medium text-gray-700 mb-1">New Email Address</label>
                                                    <input type="email" id="new-email" name="new-email" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                                </div>
                                                <div>
                                                    <label for="email-otp" class="block text-sm font-medium text-gray-700 mb-1">OTP Sent to Phone</label>
                                                    <div class="flex space-x-2">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex justify-between">
                                                <button type="button" id="send-email-otp" class="px-4 py-2 bg-accent-saffron text-white font-medium rounded-lg hover:bg-orange-600 transition text-sm">
                                                    Send OTP
                                                </button>
                                                <div class="flex space-x-2">
                                                    <button type="button" id="cancel-email-change" class="px-4 py-2 border border-gray-300 text-gray-700 font-medium rounded-lg hover:bg-gray-50 transition text-sm">
                                                        Cancel
                                                    </button>
                                                    <button type="button" id="verify-email-otp" class="px-4 py-2 bg-accent-green text-white font-medium rounded-lg hover:bg-green-700 transition text-sm">
                                                        Verify & Update
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div id="phone-change-section" class="p-4 bg-gray-50 rounded-lg">
                                        <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-4">
                                            <div>
                                                <p class="font-medium">Change Phone Number</p>
                                                <p class="text-sm text-gray-600 mt-1">Current: +91 9876543210</p>
                                            </div>
                                            <button type="button" id="change-phone-btn" class="mt-3 md:mt-0 px-4 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition text-sm">
                                                Change Phone
                                            </button>
                                        </div>
                                        <div id="phone-otp-section" class="hidden">
                                            <div class="mb-4">
                                                <label for="phone-change-password" class="block text-sm font-medium text-gray-700 mb-1">Enter Your Password</label>
                                                <input type="password" id="phone-change-password" class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                            </div>
                                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                                                <div>
                                                    <label for="new-phone" class="block text-sm font-medium text-gray-700 mb-1">New Phone Number</label>
                                                    <div class="flex">
                                                        <div class="flex-shrink-0 z-10 inline-flex items-center py-3 px-4 text-sm text-gray-500 bg-gray-100 border border-r-0 border-gray-300 rounded-l-lg">+91</div>
                                                        <input type="tel" id="new-phone" name="new-phone" class="form-input w-full px-4 py-3 border border-gray-300 rounded-r-lg rounded-l-none focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
                                                    </div>
                                                </div>
                                                <div>
                                                    <label for="phone-otp" class="block text-sm font-medium text-gray-700 mb-1">OTP Sent to Email</label>
                                                    <div class="flex space-x-2">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                        <input type="text" maxlength="1" class="otp-input">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex justify-between">
                                                <button type="button" id="send-phone-otp" class="px-4 py-2 bg-accent-saffron text-white font-medium rounded-lg hover:bg-orange-600 transition text-sm">
                                                    Send OTP
                                                </button>
                                                <div class="flex space-x-2">
                                                    <button type="button" id="cancel-phone-change" class="px-4 py-2 border border-gray-300 text-gray-700 font-medium rounded-lg hover:bg-gray-50 transition text-sm">
                                                        Cancel
                                                    </button>
                                                    <button type="button" id="verify-phone-otp" class="px-4 py-2 bg-accent-green text-white font-medium rounded-lg hover:bg-green-700 transition text-sm">
                                                        Verify & Update
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Notification Settings Tab -->
                <div id="notifications-tab" class="tab-content p-6 md:p-8 hidden">
                    <h2 class="font-heading text-xl font-bold text-primary-blue mb-6">Notification Settings</h2>
                    
                    <div class="space-y-6">
                        <div class="bg-blue-50 p-4 rounded-lg">
                            <div class="flex">
                                <i class="fas fa-info-circle text-primary-blue mt-1 mr-3"></i>
                                <div>
                                    <h3 class="font-medium text-primary-blue">Manage your notification preferences</h3>
                                    <p class="text-sm text-blue-700 mt-1">Choose how you want to be notified about your grievance status and other updates</p>
                                </div>
                            </div>
                        </div>

                        <div class="space-y-6">
                            <div class="border-b border-gray-200 pb-6">
                                <h3 class="font-medium text-lg mb-4">Grievance Updates</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Email Notifications</p>
                                            <p class="text-sm text-gray-600 mt-1">Receive grievance status updates via email</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer" checked>
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Push Notifications</p>
                                            <p class="text-sm text-gray-600 mt-1">Receive push notifications on your device</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer">
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="border-b border-gray-200 pb-6">
                                <h3 class="font-medium text-lg mb-4">News & Updates</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Government Initiatives</p>
                                            <p class="text-sm text-gray-600 mt-1">Receive updates about new government initiatives</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer" checked>
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Civic Engagement</p>
                                            <p class="text-sm text-gray-600 mt-1">Receive updates about civic engagement opportunities</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer">
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <h3 class="font-medium text-lg mb-4">Urgent Alerts</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Emergency Updates</p>
                                            <p class="text-sm text-gray-600 mt-1">Receive critical alerts about emergencies in your area</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer" checked>
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Service Disruptions</p>
                                            <p class="text-sm text-gray-600 mt-1">Get notified about service disruptions in your locality</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer" checked>
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Privacy & Data Tab -->
                <div id="privacy-tab" class="tab-content p-6 md:p-8 hidden">
                    <h2 class="font-heading text-xl font-bold text-primary-blue mb-6">Privacy & Data</h2>
                    
                    <div class="space-y-6">
                        <div class="bg-blue-50 p-4 rounded-lg">
                            <div class="flex">
                                <i class="fas fa-shield-alt text-primary-blue mt-1 mr-3"></i>
                                <div>
                                    <h3 class="font-medium text-primary-blue">Your data is secure with us</h3>
                                    <p class="text-sm text-blue-700 mt-1">We follow Government of India data protection standards to keep your information safe</p>
                                </div>
                            </div>
                        </div>

                        <div class="space-y-6">
                            <div class="border-b border-gray-200 pb-6">
                                <h3 class="font-medium text-lg mb-4">Data Sharing</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Share data with concerned departments</p>
                                            <p class="text-sm text-gray-600 mt-1">Allow sharing of necessary information with government departments to resolve your grievances</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer" checked>
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Anonymous data for analytics</p>
                                            <p class="text-sm text-gray-600 mt-1">Allow use of anonymized data to improve government services</p>
                                        </div>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer" checked>
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="border-b border-gray-200 pb-6">
                                <h3 class="font-medium text-lg mb-4">Data Management</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center p-4 bg-gray-50 rounded-lg">
                                        <div>
                                            <p class="font-medium">Delete Your Account</p>
                                            <p class="text-sm text-gray-600 mt-1">Permanently delete your account and all associated data</p>
                                        </div>
                                        <button class="px-4 py-2 bg-red-100 text-red-700 font-medium rounded-lg hover:bg-red-200 transition text-sm">
                                            Delete Account
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div>
                                <h3 class="font-medium text-lg mb-4">Privacy Policy</h3>
                                <div class="bg-gray-50 p-4 rounded-lg">
                                    <p class="text-sm text-gray-600">
                                        By using Setu, you agree to our Privacy Policy and Terms of Service. 
                                        We collect and process your data in accordance with the Government of India's 
                                        data protection standards and regulations.
                                    </p>
                                    <div class="mt-4 flex space-x-4">
                                        <a href="privacy-policy.html" class="text-primary-blue text-sm font-medium hover:underline">View Privacy Policy</a>
                                        <a href="term.html" class="text-primary-blue text-sm font-medium hover:underline">View Terms of Service</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Preferences Tab -->
                <div id="preferences-tab" class="tab-content p-6 md:p-8 hidden">
                    <h2 class="font-heading text-xl font-bold text-primary-blue mb-6">Preferences</h2>
                    
                    <div class="space-y-6">
                        <div class="bg-blue-50 p-4 rounded-lg">
                            <div class="flex">
                                <i class="fas fa-cog text-primary-blue mt-1 mr-3"></i>
                                <div>
                                    <h3 class="font-medium text-primary-blue">Customize your Setu experience</h3>
                                    <p class="text-sm text-blue-700 mt-1">Adjust settings to make Setu work the way you prefer</p>
                                </div>
                            </div>
                        </div>


                            <div class="border-b border-gray-200 pb-6">
                                <h3 class="font-medium text-lg mb-4">Display Preferences</h3>
                                <div class="space-y-4">
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">Dark Mode</p>
                                            <p class="text-sm text-gray-600 mt-1">Switch to dark mode for better visibility in low light</p>
                                        </div>
                                        <div class="flex items-center">
                                         <span class="px-2 py-1 bg-gray-200 text-gray-700 text-xs font-medium rounded mr-2">Coming Soon</span>
                                        <label class="relative inline-flex items-center cursor-pointer">
                                            <input type="checkbox" class="sr-only peer"disabled>
                                            <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-accent-green"></div>
                                        </label>
                                        </div>
                                    </div>
                                    <div class="flex justify-between items-center">
                                        <div>
                                            <p class="font-medium">High Contrast Mode</p>
                                            <p class="text-sm text-gray-600 mt-1">Increase contrast for better readability</p>
                                        </div>
                                        <div class="flex items-center">
                                            <span class="px-2 py-1 bg-gray-200 text-gray-700 text-xs font-medium rounded mr-2">Coming Soon</span>
                                            <label class="relative inline-flex items-center cursor-pointer opacity-50">
                                                <input type="checkbox" class="sr-only peer" disabled>
                                                <div class="w-11 h-6 bg-gray-200 rounded-full peer"></div>
                                            </label>
                                        </div>
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

   <script src="${pageContext.request.contextPath}/js/profile.js"></script>
</body>
</html>