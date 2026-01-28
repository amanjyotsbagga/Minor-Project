// DOM Elements
        const stepRequest = document.getElementById('step-request');
        const stepVerify = document.getElementById('step-verify');
        const stepReset = document.getElementById('step-reset');
        const successMessage = document.getElementById('success-message');
        const forgotPasswordForm = document.getElementById('forgot-password-form');
        const submitBtn = document.getElementById('submit-btn');
        const submitText = document.getElementById('submit-text');
        const submitSpinner = document.getElementById('submit-spinner');
        const verifyCodeBtn = document.getElementById('verify-code-btn');
        const resetPasswordBtn = document.getElementById('reset-password-btn');
        const backToRequestBtn = document.getElementById('back-to-request');
        const backToVerifyBtn = document.getElementById('back-to-verify');
        const resendCodeBtn = document.getElementById('resend-code');
        const countdownTimer = document.getElementById('countdown-timer');
        const emailInput = document.getElementById('email');
        const phoneInput = document.getElementById('phone');
        const captchaInput = document.getElementById('captcha');
        const newPasswordInput = document.getElementById('new-password');
        const confirmPasswordInput = document.getElementById('confirm-password');
        const passwordStrengthBar = document.getElementById('password-strength-bar');
        const passwordFeedback = document.getElementById('password-feedback');
        const passwordMatch = document.getElementById('password-match');

        // State variables
        let currentStep = 1;
        let countdownInterval;
        let countdownSeconds = 60;

        // Mobile menu toggle
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            const menu = document.getElementById('mobile-menu');
            menu.classList.toggle('hidden');
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

        // Form validation functions
        function validateEmail(email) {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(email);
        }

        function validatePhone(phone) {
            const re = /^[6-9]\d{9}$/;
            return re.test(phone);
        }

        // Show error message
        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = message;
            errorElement.classList.remove('hidden');
            document.getElementById(elementId.split('-')[0]).classList.add('shake');
            setTimeout(() => {
                document.getElementById(elementId.split('-')[0]).classList.remove('shake');
            }, 500);
        }

        // Hide error message
        function hideError(elementId) {
            const errorElement = document.getElementById(elementId);
            errorElement.classList.add('hidden');
        }

        // Move to next input in OTP
        function moveToNext(current, nextIndex) {
            if (current.value.length === 1) {
                const nextInput = document.querySelector(`#step-verify input:nth-child(${nextIndex + 1})`);
                if (nextInput) {
                    nextInput.focus();
                }
            }
        }

        // Generate CAPTCHA
        function generateCaptcha() {
            const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
            let result = '';
            for (let i = 0; i < 4; i++) {
                result += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            document.getElementById('captcha-code').textContent = result;
        }

        // Validate CAPTCHA
        function validateCaptcha(input) {
            return input.toUpperCase() === document.getElementById('captcha-code').textContent;
        }

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
            
            passwordStrengthBar.style.width = `${width}%`;
            passwordStrengthBar.className = `h-full transition-all duration-300 ${color}`;
            passwordFeedback.textContent = feedback;
            passwordFeedback.className = `text-xs mt-1 ${color.replace('bg-', 'text-')}`;
            
            return strength >= 3;
        }

        // Check if passwords match
        function checkPasswordMatch() {
            const password = newPasswordInput.value;
            const confirmPassword = confirmPasswordInput.value;
            
            if (confirmPassword === '') {
                passwordMatch.textContent = '';
                passwordMatch.className = 'text-xs mt-1 text-gray-500';
                return false;
            }
            
            if (password === confirmPassword) {
                passwordMatch.textContent = 'Passwords match';
                passwordMatch.className = 'text-xs mt-1 text-green-500';
                return true;
            } else {
                passwordMatch.textContent = 'Passwords do not match';
                passwordMatch.className = 'text-xs mt-1 text-red-500';
                return false;
            }
        }

        // Start countdown for resend code
        function startCountdown() {
            countdownSeconds = 60;
            resendCodeBtn.disabled = true;
            document.getElementById('countdown').classList.remove('hidden');
            
            countdownInterval = setInterval(() => {
                countdownSeconds--;
                countdownTimer.textContent = countdownSeconds;
                
                if (countdownSeconds <= 0) {
                    clearInterval(countdownInterval);
                    resendCodeBtn.disabled = false;
                    document.getElementById('countdown').classList.add('hidden');
                }
            }, 1000);
        }

        // Navigate between steps
        function goToStep(step) {
            // Hide all steps
            stepRequest.classList.add('hidden');
            stepVerify.classList.add('hidden');
            stepReset.classList.add('hidden');
            successMessage.classList.add('hidden');
            
            // Show current step
            switch(step) {
                case 1:
                    stepRequest.classList.remove('hidden');
                    break;
                case 2:
                    stepVerify.classList.remove('hidden');
                    // Focus first OTP input
                    document.querySelector('#step-verify input:first-child').focus();
                    startCountdown();
                    break;
                case 3:
                    stepReset.classList.remove('hidden');
                    break;
                case 4:
                    successMessage.classList.remove('hidden');
                    break;
            }
            
            currentStep = step;
        }

        // Event Listeners
        document.getElementById('refresh-captcha').addEventListener('click', generateCaptcha);

        emailInput.addEventListener('input', () => {
            hideError('email-error');
        });

        phoneInput.addEventListener('input', () => {
            hideError('phone-error');
        });

        captchaInput.addEventListener('input', () => {
            hideError('captcha-error');
        });

        newPasswordInput.addEventListener('input', () => {
            checkPasswordStrength(newPasswordInput.value);
            checkPasswordMatch();
        });

        confirmPasswordInput.addEventListener('input', checkPasswordMatch);

        // Form submission
        forgotPasswordForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Validate form
            let isValid = true;
            
            if (!validateEmail(emailInput.value)) {
                showError('email-error', 'Please enter a valid email address');
                isValid = false;
            }
            
            if (!validatePhone(phoneInput.value)) {
                showError('phone-error', 'Please enter a valid 10-digit phone number');
                isValid = false;
            }
            
            if (!validateCaptcha(captchaInput.value)) {
                showError('captcha-error', 'Please enter the correct security code');
                isValid = false;
            }
            
            if (isValid) {
                // Show loading state
                submitText.textContent = 'Sending...';
                submitSpinner.classList.remove('hidden');
                submitBtn.disabled = true;
                
                // Simulate API call
                setTimeout(() => {
                    // Hide loading state
                    submitText.textContent = 'Send Reset Link';
                    submitSpinner.classList.add('hidden');
                    submitBtn.disabled = false;
                    
                    // Move to next step
                    goToStep(2);
                }, 1500);
            }
        });

        // Verify code button
        verifyCodeBtn.addEventListener('click', function() {
            // Get all OTP inputs
            const otpInputs = document.querySelectorAll('#step-verify input');
            let otpCode = '';
            
            otpInputs.forEach(input => {
                otpCode += input.value;
            });
            
            // Validate OTP (in a real app, this would be sent to the server)
            if (otpCode.length === 6) {
                // Simulate API verification
                verifyCodeBtn.textContent = 'Verifying...';
                verifyCodeBtn.disabled = true;
                
                setTimeout(() => {
                    verifyCodeBtn.textContent = 'Verify Code';
                    verifyCodeBtn.disabled = false;
                    
                    // Move to next step
                    goToStep(3);
                }, 1000);
            } else {
                showError('code-error', 'Please enter the 6-digit verification code');
            }
        });

        // Reset password button
        resetPasswordBtn.addEventListener('click', function() {
            const password = newPasswordInput.value;
            const confirmPassword = confirmPasswordInput.value;
            
            // Validate password
            if (password.length < 8) {
                showError('password-feedback', 'Password must be at least 8 characters');
                return;
            }
            
            if (!checkPasswordMatch()) {
                return;
            }
            
            // Simulate API call to reset password
            resetPasswordBtn.textContent = 'Resetting...';
            resetPasswordBtn.disabled = true;
            
            setTimeout(() => {
                // Show success message
                goToStep(4);
            }, 1500);
        });

        // Back buttons
        backToRequestBtn.addEventListener('click', () => goToStep(1));
        backToVerifyBtn.addEventListener('click', () => goToStep(2));

        // Resend code button
        resendCodeBtn.addEventListener('click', function() {
            // Simulate API call to resend code
            resendCodeBtn.textContent = 'Sending...';
            resendCodeBtn.disabled = true;
            
            setTimeout(() => {
                resendCodeBtn.textContent = 'Resend Code';
                startCountdown();
            }, 1000);
        });

        // Initialize
        generateCaptcha();