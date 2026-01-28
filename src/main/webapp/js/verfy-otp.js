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
   