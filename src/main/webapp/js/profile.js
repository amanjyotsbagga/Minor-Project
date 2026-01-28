// Mobile menu toggle
       const mobileMenuButton = document.getElementById('mobile-menu-button')
           const sidebar = document.querySelector('.sidebar')
        // Toggle menu when button is clicked
   mobileMenuButton.addEventListener('click', function(e) {
       e.stopPropagation(); // Prevent this click from triggering the document click listener
       e.preventDefault();

           window.scrollTo({
               top: 0,
               behavior: 'smooth'
           });
       sidebar.classList.toggle('active')
       
   });

   // Close menu when clicking outside
   document.addEventListener('click', function(e) {
       // Check if the click is outside the sidebar and not on the menu button
       if (!sidebar.contains(e.target) && !mobileMenuButton.contains(e.target)) {
           sidebar.classList.remove('active');
       }
   });

   // Close menu when scrolling
   let scrollTimer;
   window.addEventListener('scroll', function() {
       // Clear any existing timer
       clearTimeout(scrollTimer);
       
       // Close the sidebar immediately on scroll
       sidebar.classList.remove('active');
       
       // Optional: Add a small delay to prevent multiple triggers during continuous scrolling
       scrollTimer = setTimeout(function() {
           // Additional actions after scrolling stops (if needed)
       }, 100);
   });

   // Close menu when clicking on a link inside the sidebar
   const sidebarLinks = document.querySelectorAll('.sidebar a');
   sidebarLinks.forEach(link => {
       link.addEventListener('click', function() {
           sidebar.classList.remove('active');
       });
   });
       // Update datetime
       function updateDateTime() {
           const now = new Date();
           const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
           const dateString = now.toLocaleDateString('en-IN', options);
           const timeString = now.toLocaleTimeString('en-IN', { hour: '2-digit', minute: '2-digit', hour12: true });
           document.getElementById('datetime').textContent = `${dateString} | ${timeString} IST`;
       }

       updateDateTime();
       setInterval(updateDateTime, 60000);

       // Tab functionality
       const tabButtons = document.querySelectorAll('.tab-button');
       const tabContents = document.querySelectorAll('.tab-content');

       tabButtons.forEach(button => {
           button.addEventListener('click', () => {
               const tabId = button.getAttribute('data-tab');
               
               // Update active tab button
               tabButtons.forEach(btn => btn.classList.remove('active'));
               button.classList.add('active');
               
               // Show active tab content
               tabContents.forEach(content => content.classList.add('hidden'));
               document.getElementById(`${tabId}-tab`).classList.remove('hidden');
           });
       });

       // Password strength checker
       function checkPasswordStrength(password) {
           let strength = 0;
           let feedback = '';
           
           // Check length
           if (password.length >= 8) strength += 1;
           else feedback = 'Password should be at least 8 characters';
           
           // Check for lowercase letters
           if (/[a-z]/.test(password)) strength += 1;
           
           // Check for uppercase letters
           if (/[A-Z]/.test(password)) strength += 1;
           
           // Check for numbers
           if (/[0-9]/.test(password)) strength += 1;
           
           // Check for special characters
           if (/[^A-Za-z0-9]/.test(password)) strength += 1;
           
           // Update UI based on strength
           let width = 0;
           let color = 'bg-red-500';
           
           if (strength <= 2) {
               width = 33;
               color = 'bg-red-500';
               feedback = 'Weak password';
           } else if (strength === 3) {
               width = 66;
               color = 'bg-yellow-500';
               feedback = 'Medium strength password';
           } else {
               width = 100;
               color = 'bg-green-500';
               feedback = 'Strong password';
           }
           
           document.getElementById('password-strength-bar').style.width = `${width}%`;
           document.getElementById('password-strength-bar').className = `h-full transition-all duration-300 ${color}`;
           document.getElementById('password-feedback').textContent = feedback;
           document.getElementById('password-feedback').className = `text-xs mt-1 ${color.replace('bg-', 'text-')}`;
           
           return strength >= 3;
       }

       // Check if passwords match
       function checkPasswordMatch() {
           const password = document.getElementById('newPassword').value;
           const confirmPassword = document.getElementById('confirmPassword').value;
           
           if (confirmPassword === '') {
               document.getElementById('password-match').textContent = '';
               document.getElementById('password-match').className = 'text-xs mt-1 text-gray-500';
               return false;
           }
           
           if (password === confirmPassword) {
               document.getElementById('password-match').textContent = 'Passwords match';
               document.getElementById('password-match').className = 'text-xs mt-1 text-green-500';
               return true;
           } else {
               document.getElementById('password-match').textContent = 'Passwords do not match';
               document.getElementById('password-match').className = 'text-xs mt-1 text-red-500';
               return false;
           }
       }

       // Password input event listeners
       document.getElementById('newPassword').addEventListener('input', function() {
           checkPasswordStrength(this.value);
           checkPasswordMatch();
       });

       document.getElementById('confirmPassword').addEventListener('input', checkPasswordMatch);

       // Save button functionality
       document.getElementById('save-btn').addEventListener('click', function() {
           // Show success message
           alert('Your changes have been saved successfully!');
       });

       // Discard button functionality
       document.getElementById('discard-btn').addEventListener('click', function() {
           if(confirm('Are you sure you want to discard all changes?')) {
               // Reload the page to reset changes
               location.reload();
           }
       });

       // Email change functionality
       document.getElementById('change-email-btn').addEventListener('click', function() {
           document.getElementById('email-otp-section').classList.remove('hidden');
           this.classList.add('hidden');
       });

       document.getElementById('cancel-email-change').addEventListener('click', function() {
           document.getElementById('email-otp-section').classList.add('hidden');
           document.getElementById('change-email-btn').classList.remove('hidden');
           // Clear fields
           document.getElementById('email-change-password').value = '';
           document.getElementById('new-email').value = '';
           clearOtpInputs(document.querySelectorAll('#email-otp-section .otp-input'));
       });

       // Phone change functionality
       document.getElementById('change-phone-btn').addEventListener('click', function() {
           document.getElementById('phone-otp-section').classList.remove('hidden');
           this.classList.add('hidden');
       });

       document.getElementById('cancel-phone-change').addEventListener('click', function() {
           document.getElementById('phone-otp-section').classList.add('hidden');
           document.getElementById('change-phone-btn').classList.remove('hidden');
           // Clear fields
           document.getElementById('phone-change-password').value = '';
           document.getElementById('new-phone').value = '';
           clearOtpInputs(document.querySelectorAll('#phone-otp-section .otp-input'));
       });

       // OTP input handling
       function setupOtpInputs(otpInputs) {
           otpInputs.forEach((input, index) => {
               input.addEventListener('input', (e) => {
                   if (e.target.value.length === 1 && index < otpInputs.length - 1) {
                       otpInputs[index + 1].focus();
                   }
               });
               
               input.addEventListener('keydown', (e) => {
                   if (e.key === 'Backspace' && index > 0 && e.target.value === '') {
                       otpInputs[index - 1].focus();
                   }
               });
           });
       }

       function clearOtpInputs(otpInputs) {
           otpInputs.forEach(input => {
               input.value = '';
           });
       }

       // Initialize OTP inputs
       const allOtpInputs = document.querySelectorAll('.otp-input');
       setupOtpInputs(allOtpInputs);

       // Send OTP functionality
       document.getElementById('send-email-otp').addEventListener('click', function() {
           const password = document.getElementById('email-change-password').value;
           if (!password) {
               alert('Please enter your password first');
               return;
           }
           alert('OTP sent to your registered phone number');
       });

       document.getElementById('send-phone-otp').addEventListener('click', function() {
           const password = document.getElementById('phone-change-password').value;
           if (!password) {
               alert('Please enter your password first');
               return;
           }
           alert('OTP sent to your registered email address');
       });

       // Verify OTP functionality
       document.getElementById('verify-email-otp').addEventListener('click', function() {
           const password = document.getElementById('email-change-password').value;
           if (!password) {
               alert('Please enter your password first');
               return;
           }
           alert('Email updated successfully!');
           document.getElementById('email-otp-section').classList.add('hidden');
           document.getElementById('change-email-btn').classList.remove('hidden');
           // Clear fields
           document.getElementById('email-change-password').value = '';
           document.getElementById('new-email').value = '';
           clearOtpInputs(document.querySelectorAll('#email-otp-section .otp-input'));
       });

       document.getElementById('verify-phone-otp').addEventListener('click', function() {
           const password = document.getElementById('phone-change-password').value;
           if (!password) {
               alert('Please enter your password first');
               return;
           }
           alert('Phone number updated successfully!');
           document.getElementById('phone-otp-section').classList.add('hidden');
           document.getElementById('change-phone-btn').classList.remove('hidden');
           // Clear fields
           document.getElementById('phone-change-password').value = '';
           document.getElementById('new-phone').value = '';
           clearOtpInputs(document.querySelectorAll('#phone-otp-section .otp-input'));
       });

       // Aadhaar status update (simulating verification from the Aadhaar page)
       // In a real implementation, this would be set based on the user's actual verification status
       // For demo purposes, we're setting it to "Not Verified" initially
       document.addEventListener('DOMContentLoaded', function() {
           // Check if there's a verification status in localStorage (set from the Aadhaar verification page)
           const aadhaarStatus = localStorage.getItem('aadhaarVerificationStatus');
           const statusElement = document.getElementById('aadhaar-status');
           
           if (aadhaarStatus === 'verified') {
               statusElement.textContent = 'Verified';
               statusElement.className = 'status-verified px-3 py-1 rounded-full text-xs font-medium';
               statusElement.innerHTML = '<i class="fas fa-check-circle mr-1"></i> Verified';
           } else {
               statusElement.textContent = 'Not Verified';
               statusElement.className = 'status-pending px-3 py-1 rounded-full text-xs font-medium';
               statusElement.innerHTML = '<i class="fas fa-clock mr-1"></i> Not Verified';
           }
       });