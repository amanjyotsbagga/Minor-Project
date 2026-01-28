// Global error handler
        window.addEventListener('error', function(e) {
            console.error('Global error caught:', e.error);
        });

        // Check if DOM is already loaded
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', initializeApp);
        } else {
            initializeApp();
        }

        function initializeApp() {
            try {
                
                
                // Update datetime
                updateDateTime();

                // Initialize all components
                initializeRoleSelection();
                initializePasswordToggle();
                initializeCaptcha();
                initializeFormSubmission();
            } catch (error) {
                console.error('Error during initialization:', error);
            }
        }

        function updateDateTime() {
            try {
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
            } catch (error) {
                console.error('Error updating datetime:', error);
            }
        }

        function initializeRoleSelection() {
            try {
                const roleButtons = document.querySelectorAll('.role-btn');
                const departmentSelect = document.getElementById('department-select');
                const demoCredentials = document.getElementById('demo-credentials');
                const demoUsername = document.getElementById('demo-username');
                const demoPassword = document.getElementById('demo-password');
                const officialIdInput = document.getElementById('official-id');
                
                if (!roleButtons.length) {
                    console.warn('No role buttons found');
                    return;
                }

                const roleCredentials = {
                    'worker': { username: 'worker@setu.gov.in', password: 'demo123' },
                    'operator': { username: 'operator@setu.gov.in', password: 'demo123' },
                    'dept-admin': { username: 'admin@sanitation.gov.in', password: 'demo123' },
                    'super-admin': { username: 'superadmin@setu.gov.in', password: 'demo123' }
                };
                
                function handleRoleSelection(selectedButton) {
                    if (!selectedButton) return;
                    
                    // Remove active state from all buttons
                    roleButtons.forEach(btn => {
                        btn.classList.remove('active');
                    });
                    
                    // Add active state to clicked button
                    selectedButton.classList.add('active');
                    
                    const role = selectedButton.getAttribute('data-role');
                    
                    
                    // Show/hide department selection
                    if (departmentSelect) {
                        if (role === 'dept-admin' || role === 'operator'|| role === 'worker') {
                            departmentSelect.classList.remove('hidden');
                        } else {
                            departmentSelect.classList.add('hidden');
                        }
                    }
                    
                    // Show demo credentials
                    if (roleCredentials[role] && demoCredentials && demoUsername && demoPassword) {
                        demoCredentials.classList.remove('hidden');
                        demoUsername.textContent = `Username: ${roleCredentials[role].username}`;
                        demoPassword.textContent = `Password: ${roleCredentials[role].password}`;
                        
                        if (officialIdInput) {
                            officialIdInput.value = roleCredentials[role].username;
                        }
                    }
                }
                
                roleButtons.forEach(button => {
                    button.addEventListener('click', function() {
                        handleRoleSelection(this);
                    });
                });

                // Auto-select first role
                if (roleButtons.length > 0) {
                    handleRoleSelection(roleButtons[0]);
                }
            } catch (error) {
                console.error('Error in role selection:', error);
            }
        }

        function initializePasswordToggle() {
            try {
                const togglePasswordBtn = document.getElementById('toggle-password');
                const passwordInput = document.getElementById('password');
                const eyeIcon = document.getElementById('eye-icon');
                
                if (!togglePasswordBtn || !passwordInput || !eyeIcon) {
                    console.warn('Password toggle elements not found');
                    return;
                }
                
                togglePasswordBtn.addEventListener('click', function() {
                    const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordInput.setAttribute('type', type);
                    
                    if (type === 'text') {
                        eyeIcon.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21"></path>';
                    } else {
                        eyeIcon.innerHTML = '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>';
                    }
                });
            } catch (error) {
                console.error('Error in password toggle:', error);
            }
        }

        function initializeCaptcha() {
            try {
                const captchaCodeEl = document.getElementById('captcha-code');
                const refreshCaptchaBtn = document.getElementById('refresh-captcha');
                
                if (!captchaCodeEl || !refreshCaptchaBtn) {
                    console.warn('CAPTCHA elements not found');
                    return;
                }
                
                function generateCaptcha() {
                    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
                    let result = '';
                    for (let i = 0; i < 4; i++) {
                        result += chars.charAt(Math.floor(Math.random() * chars.length));
                    }
                    captchaCodeEl.textContent = result;
                    
                }
                
                refreshCaptchaBtn.addEventListener('click', generateCaptcha);
                generateCaptcha();
            } catch (error) {
                console.error('Error in CAPTCHA initialization:', error);
            }
        }

        function initializeFormSubmission() {
            try {
                const form = document.getElementById('login-form');
                const captchaCodeEl = document.getElementById('captcha-code');
                const captchaInput = document.getElementById('captcha');
                const captchaError = document.getElementById('captcha-error');
                const loginButton = document.getElementById('login-button');
                
                if (!form || !captchaCodeEl || !captchaInput || !captchaError || !loginButton) {
                    console.warn('Form elements not found');
                    return;
                }
                
                form.addEventListener('submit', function(e) {
                    e.preventDefault();
                    
                    // Validate CAPTCHA
                    const correctCaptcha = captchaCodeEl.textContent.toUpperCase();
                    const enteredCaptcha = captchaInput.value.toUpperCase();
                    
                    if (enteredCaptcha !== correctCaptcha) {
                        captchaError.classList.remove('hidden');
                        captchaInput.classList.add('border-red-500');
                        generateCaptcha();
                        return;
                    }

                    captchaError.classList.add('hidden');
                    captchaInput.classList.remove('border-red-500');

                    // Show loading state
                    loginButton.disabled = true;
                    loginButton.innerHTML = `
                        <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white inline" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        Signing In...
                    `;

                    setTimeout(() => {
    try {
        const activeRoleBtn = document.querySelector('.role-btn.active');
        const roleName = activeRoleBtn ? activeRoleBtn.textContent.trim() : 'User';
        const role = activeRoleBtn ? activeRoleBtn.getAttribute('data-role') : 'user';
        
        loginButton.innerHTML = 'Login Successful!';
        loginButton.classList.remove('bg-gov-primary');
        loginButton.classList.add('bg-green-600');
        
        setTimeout(() => {
            try {
                alert(`Login successful as ${roleName}!`);
                loginButton.disabled = false;
                loginButton.innerHTML = 'Sign In';
                loginButton.classList.remove('bg-green-600');
                loginButton.classList.add('bg-gov-primary');
                
                // Log the role for debugging
                console.log(`User role: ${role}`);
                console.log(`Redirecting to ${role} dashboard...`);
                
                // In a real application, you would redirect here:
                window.location.href = `${role}-dashboard.html`;
                
            } catch (innerError) {
                console.error('Error in login success handler:', innerError);
                // Reset button state even if alert fails
                loginButton.disabled = false;
                loginButton.innerHTML = 'Sign In';
                loginButton.classList.remove('bg-green-600');
                loginButton.classList.add('bg-gov-primary');
            }
        }, 500);

    } catch (error) {
        console.error('Error during login simulation:', error);
        // Reset button state on error
        loginButton.disabled = false;
        loginButton.innerHTML = 'Sign In';
        loginButton.classList.remove('bg-green-600', 'bg-green-500');
        loginButton.classList.add('bg-gov-primary');
        
        // Show error message to user
        alert('Login simulation failed. Please try again.');
    }
}, 2000);
                });
            } catch (error) {
                console.error('Error in form submission:', error);
            }
        }

        // Fallback initialization after a short delay
        setTimeout(function() {
            if (typeof initializeApp === 'function') {
            } else {
                console.warn('App not initialized, attempting fallback...');

                try {
                    updateDateTime();
                    initializeCaptcha();
                } catch (e) {
                    console.error('Fallback initialization failed:', e);
                }
            }
        }, 1000);