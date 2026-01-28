document.addEventListener('DOMContentLoaded', function() {
            // Mobile Menu Toggle
            const mobileMenuButton = document.getElementById('mobile-menu-button');
            const mobileMenu = document.getElementById('mobile-menu');
            mobileMenuButton.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });

            // Hero parallax effect
            const hero = document.querySelector('.hero-container');
            if(hero) {
                const bg = document.getElementById('bridge-bg');
                const fg = document.getElementById('bridge-fg');
                hero.addEventListener('mousemove', (e) => {
                    const x = (e.clientX / window.innerWidth) - 0.5;
                    const y = (e.clientY / window.innerHeight) - 0.5;
                    bg.style.transform = `translate(-50%, 0) translateX(${-x * 30}px) translateY(${-y * 15}px)`;
                    fg.style.transform = `translate(-50%, 0) translateX(${-x * 60}px) translateY(${-y * 30}px)`;
                });
            }

            // Card glow effect - FIXED: Now inputs should work properly
            const cards = document.querySelectorAll('.card-glow');
            cards.forEach(card => {
                card.addEventListener('mousemove', e => {
                    const rect = card.getBoundingClientRect();
                    card.style.setProperty('--x', e.clientX - rect.left + 'px');
                    card.style.setProperty('--y', e.clientY - rect.top + 'px');
                });
            });

            // Auth section toggling
            const showRegisterBtn = document.getElementById('show-register');
            const showLoginBtn = document.getElementById('show-login');
            const closeRegisterBtn = document.getElementById('close-register');
            const closeLoginBtn = document.getElementById('close-login');
            const switchToLoginBtn = document.getElementById('switch-to-login');
            const switchToRegisterBtn = document.getElementById('switch-to-register');
            const registerSection = document.getElementById('register-section');
            const loginSection = document.getElementById('login-section');
            const heroSection = document.querySelector('.hero-container');

            function showRegister() {
                registerSection.classList.add('active');
                loginSection.classList.remove('active');
                heroSection.style.display = 'none';
                // Scroll to registration section
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }

            function showLogin() {
                loginSection.classList.add('active');
                registerSection.classList.remove('active');
                heroSection.style.display = 'none';
                // Scroll to login section
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }

            function showHero() {
                registerSection.classList.remove('active');
                loginSection.classList.remove('active');
                heroSection.style.display = 'block';
                // Scroll to top
                window.scrollTo({ top: 0, behavior: 'smooth' });
            }

            showRegisterBtn.addEventListener('click', showRegister);
            showLoginBtn.addEventListener('click', showLogin);
            closeRegisterBtn.addEventListener('click', showHero);
            closeLoginBtn.addEventListener('click', showHero);
            switchToLoginBtn.addEventListener('click', showLogin);
            switchToRegisterBtn.addEventListener('click', showRegister);

            // Password strength indicator
            const passwordInput = document.getElementById('password');
            const passwordStrength = document.querySelector('.password-strength');
            const passwordFeedback = document.getElementById('password-feedback');
            const confirmPasswordInput = document.getElementById('confirm_password');
            const passwordMatch = document.getElementById('password-match');

            if (passwordInput) {
                passwordInput.addEventListener('input', function() {
                    const password = this.value;
                    let strength = 0;
                    let feedback = '';

                    // Check password length
                    if (password.length >= 8) strength += 25;
                    
                    // Check for lowercase letters
                    if (/[a-z]/.test(password)) strength += 25;
                    
                    // Check for uppercase letters
                    if (/[A-Z]/.test(password)) strength += 25;
                    
                    // Check for numbers and special characters
                    if (/[0-9]/.test(password)) strength += 15;
                    if (/[^A-Za-z0-9]/.test(password)) strength += 10;

                    // Update strength bar and feedback
                    if (strength < 40) {
                        passwordStrength.style.backgroundColor = '#EF4444';
                        feedback = 'Weak password';
                    } else if (strength < 70) {
                        passwordStrength.style.backgroundColor = '#F59E0B';
                        feedback = 'Medium password';
                    } else {
                        passwordStrength.style.backgroundColor = '#10B981';
                        feedback = 'Strong password';
                    }
                    
                    passwordStrength.style.width = `${strength}%`;
                    passwordFeedback.textContent = feedback;
                });
            }

            // Password confirmation check
            if (confirmPasswordInput) {
                confirmPasswordInput.addEventListener('input', function() {
                    if (this.value !== passwordInput.value) {
                        passwordMatch.textContent = 'Passwords do not match';
                        passwordMatch.style.color = '#EF4444';
                    } else {
                        passwordMatch.textContent = 'Passwords match';
                        passwordMatch.style.color = '#10B981';
                    }
                });
            }
            // Real-time date and time update
            function updateDateTime() {
                const now = new Date();
                const options = { 
                    weekday: 'long', 
                    year: 'numeric', 
                    month: 'long', 
                    day: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit',
                    timeZone: 'Asia/Kolkata'
                };
                const formatter = new Intl.DateTimeFormat('en-IN', options);
                const formattedDate = formatter.format(now) + ' IST';
                document.getElementById('datetime').textContent = formattedDate;
            }
            
            updateDateTime();
            setInterval(updateDateTime, 60000); // Update every minute
        });
		
		// Add this at the end of your login.js
		document.addEventListener("DOMContentLoaded", function() {
		    // Get the form to show from the servlet
		    const formToShow = '<%= request.getAttribute("formToShow") %>';
		    
		    if (formToShow === 'register') {
		        // Show the register section
		        document.getElementById('register-section').style.display = 'block';
		        document.getElementById('login-section').style.display = 'none';
		    } else if (formToShow === 'login') {
		        // Show the login section
		        document.getElementById('register-section').style.display = 'none';
		        document.getElementById('login-section').style.display = 'block';
		    }
		});
		
		
		
		
		function handleFormSubmission(event, loadingText = "Processing...") {
		        const form = event.target;
		        const submitButton = form.querySelector('button[type="submit"]');

		        if (submitButton && form.checkValidity()) {
		            submitButton.setAttribute('disabled', 'true');
		            submitButton.innerHTML = `
		                <i class="fas fa-spinner animate-spin-slow mr-2"></i>
		                ${loadingText}
		            `;
		            
		            // Allow the form to submit normally to the server after this point
		            // The loading state will persist until the server responds and the page navigates
		        } else {
		            // If the form is invalid, let the browser handle validation display (e.g., required field tooltips)
		            // and do not prevent default submission or show loading state.
		        }
		    }

		    // Attach handler to the registration form
		    const registrationForm = document.getElementById('registration-form');
		    if (registrationForm) {
		        registrationForm.addEventListener('submit', (e) => handleFormSubmission(e, 'Creating Account...'));
		    }
		

			// Attach handler to the login form
			const loginForm = document.getElementById('login-form');
			if (loginForm) {
			    loginForm.addEventListener('submit', (e) => handleFormSubmission(e, 'Signing In...'));
			}
		
		