<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Setu | Citizen Grievance Redressal Portal</title>

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Google Fonts: Poppins (for headings) & Inter (for body) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/loginstyle.css">
<style>
@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-4px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.animate-fade-in {
	animation: fadeIn 0.4s ease-out;
}
</style>
<script>
	// Custom Tailwind CSS configuration for an Indian Government theme
	tailwind.config = {
		theme : {
			extend : {
				fontFamily : {
					sans : [ 'Inter', 'sans-serif' ],
					heading : [ 'Poppins', 'sans-serif' ],
				},
				colors : {
					'primary-blue' : '#1E3A8A', // A deep, authoritative blue from the Ashoka Chakra
					'accent-saffron' : '#F97316', // Vibrant Saffron/Orange
					'accent-green' : '#059669', // Rich Green
					'light-bg' : '#F3F4F6', // Light Gray background
					'dark-text' : '#1F2937', // Dark Gray for text
					'light-blue-bg' : '#EFF6FF', // A very light blue for sections
					'brand-gold' : '#FFC107', // From prototype 1
				},
				boxShadow : {
					'subtle' : '0 4px 12px 0 rgba(0, 0, 0, 0.05)',
					'lifted' : '0 10px 30px -5px rgba(0, 0, 0, 0.1)',
				},
				animation : {
					'gradient-pan' : 'gradient-pan 6s ease infinite',
				},
				keyframes : {
					'gradient-pan' : {
						'0%, 100%' : {
							backgroundPosition : '0% 50%'
						},
						'50%' : {
							backgroundPosition : '100% 50%'
						},
					}
				}
			}
		}
	}
</script>
</head>
<body class="bg-light-bg text-dark-text font-sans antialiased">

	<!-- Top Bar -->
	<div class="tricolor-bar h-1.5"></div>
	<div class="bg-primary-blue text-white text-xs py-1">
		<div class="container mx-auto px-6 flex justify-between items-center">
			<span>For India</span> <span id="datetime">Monday, 6 October
				2025 | 6:28 PM IST</span>
		</div>
	</div>

	<!-- Header -->
	<header
		class="bg-white/90 backdrop-blur-lg sticky top-0 z-50 shadow-md border-b border-gray-200">
		<div class="container mx-auto px-6 py-3">
			<nav class="flex justify-between items-center">
				<a href="../index.html" class="flex items-center gap-3"> <img
					src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763747450/SETU_LOGO_wwapwe.jpg"
					alt="Setu logo" class="h-12">
					<div>
						<span
							class="text-2xl font-heading font-extrabold text-primary-blue">सेतु
							Setu</span>
						<p class="text-xs text-gray-500 font-semibold tracking-wide">Citizen
							Grievance Redressal Portal</p>
					</div>
				</a>
				<ul class="hidden md:flex items-center space-x-8">
					<li><a href="../index.html"
						class="font-semibold text-gray-700 hover:text-primary-blue transition-colors">Home</a></li>
					<li><a href="../index.html#features"
						class="font-semibold text-gray-700 hover:text-primary-blue transition-colors">Features</a></li>
					<li><a href="../index.html#process"
						class="font-semibold text-gray-700 hover:text-primary-blue transition-colors">Process</a></li>
					<li><a href="../gov/govLogin.jsp"
						class="px-5 py-2.5 text-sm font-bold text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200 hover:shadow-inner transition">Department
							Login</a></li>
				</ul>
				<button id="mobile-menu-button" class="md:hidden text-dark-text">
					<svg class="w-7 h-7" fill="none" stroke="currentColor"
						viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
						<path stroke-linecap="round" stroke-linejoin="round"
							stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
				</button>
			</nav>
		</div>
		<!-- Mobile Menu -->
		<div id="mobile-menu"
			class="hidden md:hidden bg-white shadow-lg border-t border-gray-200">
			<ul class="flex flex-col items-center space-y-4 py-4">
				<li><a href="../index.html"
					class="block font-semibold text-gray-700 hover:text-primary-blue">Home</a></li>
				<li><a href="../index.html#features"
					class="block font-semibold text-gray-700 hover:text-primary-blue">Features</a></li>
				<li><a href="../index.html#process"
					class="block font-semibold text-gray-700 hover:text-primary-blue">Process</a></li>
				<li><a href="../gov/govLogin.jsp"
					class="w-11/12 text-center mt-2 px-5 py-2.5 font-bold text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200">Department
						Login</a></li>
			</ul>
		</div>
	</header>
	<%
	if (error != null && !error.isEmpty()) {
	%>
	<div class="container mx-auto px-6 mt-4 animate-fade-in">
		<div id="error-message"
			class="flex items-start p-4 mb-4 text-sm text-red-800 bg-red-50 border border-red-300 rounded-xl shadow-sm relative"
			role="alert">

			<!-- Icon -->
			<i class="fas fa-exclamation-circle text-red-600 text-lg mr-3 mt-0.5"></i>

			<!-- Message -->
			<div class="flex-1">
				<p class="font-semibold text-red-900 mb-0.5">Error</p>
				<p class="text-red-700"><%=error%></p>
			</div>

			<!-- Close Button -->
			<button type="button"
				class="absolute top-3 right-3 text-red-500 hover:text-red-700 transition"
				onclick="fadeOutAlert(this)">
				<i class="fas fa-times text-sm"></i>
			</button>
		</div>
	</div>
	<%
	}
	%>
	<!-- Main Content -->
	<main>
		<!-- Hero Section -->
		<section class="hero-container pt-16 pb-20 md:pt-20 md:pb-24">
			<svg id="bridge-bg" xmlns="http://www.w3.org/2000/svg"
				viewBox="0 0 1440 320" style="transform: translate(-50%, 0px);">
				<path fill="#d4e3ff" fill-opacity="1"
					d="M0,192L48,176C96,160,192,128,288,133.3C384,139,480,181,576,186.7C672,192,768,160,864,133.3C960,107,1056,85,1152,90.7C1248,96,1344,128,1392,144L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>
			<svg id="bridge-fg" xmlns="http://www.w3.org/2000/svg"
				viewBox="0 0 1440 320" style="transform: translate(-50%, 0px);">
				<path fill="#ffffff" fill-opacity="1"
					d="M0,224L60,202.7C120,181,240,139,360,138.7C480,139,600,181,720,192C840,203,960,181,1080,154.7C1200,128,1320,96,1380,80L1440,64L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"></path></svg>

			<div class="container mx-auto px-6 text-center relative z-10">
				<h1
					class="font-heading text-4xl md:text-5xl lg:text-6xl font-extrabold text-dark-text leading-tight mb-4">Your
					Voice, Our Action.</h1>
				<p class="text-lg md:text-xl text-gray-600 max-w-3xl mx-auto mb-8">Welcome
					to Setu, the official portal for Citizen Grievance Redressal. A
					unified platform to ensure your concerns are heard and resolved
					with transparency and accountability.</p>
				<div class="flex flex-col sm:flex-row gap-4 justify-center">
					<button id="show-register"
						class="px-10 py-4 text-lg font-bold text-white rounded-lg hover:shadow-lifted transform hover:-translate-y-1 transition-all duration-300 animate-gradient-pan bg-[length:400%_400%]"
						style="background-image: linear-gradient(to right, #1E3A8A, #F97316, #1E3A8A, #F97316);">
						Create Account</button>
					<button id="show-login"
						class="px-8 py-4 text-lg font-bold text-primary-blue bg-white rounded-lg border-2 border-primary-blue hover:bg-blue-50 transition-all duration-300 transform hover:scale-105 shadow-lg shadow-blue-500/10">Citizen
						Login</button>
				</div>
			</div>
		</section>

		<!-- Registration Section -->
		<section id="register-section"
			class="auth-section py-20 bg-light-blue-bg">
			<div class="container mx-auto px-6 max-w-4xl">
				<div
					class="card-glow bg-white rounded-2xl shadow-lifted overflow-hidden">
					<div class="grid md:grid-cols-2">
						<!-- Left side - Form -->
						<div class="p-8 md:p-12">
							<div class="flex justify-between items-center mb-8">
								<h2 class="font-heading text-3xl font-bold text-primary-blue">Create
									Your Account</h2>
								<button id="close-register"
									class="text-gray-500 hover:text-gray-700">
									<svg class="w-6 h-6" fill="none" stroke="currentColor"
										viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
								</button>
							</div>

							<form action="../Registration" method="POST"
								id="registration-form" class="space-y-6">
								<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
									<div>
										<label for="full_name"
											class="block text-sm font-medium text-gray-700 mb-1">Full
											Name</label> <input type="text" id="fullName" name="fullName"
											required
											class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
									</div>
									<div>
										<label for="email"
											class="block text-sm font-medium text-gray-700 mb-1">Email
											Address</label> <input type="email" id="email" name="email" required
											class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
									</div>
								</div>

								<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
									<div>
										<label for="phone_number"
											class="block text-sm font-medium text-gray-700 mb-1">Phone
											Number</label> <input type="tel" id="phoneNumber" name="phoneNumber"
											required
											class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
									</div>
									<div>
										<label for="address"
											class="block text-sm font-medium text-gray-700 mb-1">Address</label>
										<input type="text" id="address" name="address" required
											class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
									</div>
								</div>

								<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
									<div>
										<label for="password"
											class="block text-sm font-medium text-gray-700 mb-1">Password</label>
										<input type="password" id="password" name="password" required
											class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
										<div id="password-strength" class="mt-2">
											<div class="password-strength bg-gray-200"></div>
											<p id="password-feedback" class="text-xs mt-1 text-gray-500">Password
												strength indicator</p>
										</div>
									</div>
									<div>
										<label for="confirm_password"
											class="block text-sm font-medium text-gray-700 mb-1">Confirm
											Password</label> <input type="password" id="confirm_password"
											name="confirm_password" required
											class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
										<p id="password-match" class="text-xs mt-1 text-gray-500"></p>
									</div>
								</div>

								<div class="flex items-center">
									<input type="checkbox" id="terms" name="terms" required
										class="h-4 w-4 text-primary-blue focus:ring-primary-blue border-gray-300 rounded">
									<label for="terms" class="ml-2 block text-sm text-gray-700">
										I agree to the <a href="term.html"
										class="text-primary-blue hover:underline">Terms of Service</a>
										and <a href="privacy-policy.html"
										class="text-primary-blue hover:underline">Privacy Policy</a>
									</label>
								</div>

								<button type="submit"
									class="w-full py-3 px-4 bg-primary-blue text-white font-bold rounded-lg hover:bg-blue-800 transition duration-300 transform hover:scale-105">
									Create Account</button>

								<div class="text-center mt-4">
									<p class="text-sm text-gray-600">
										Already have an account?
										<button type="button" id="switch-to-login"
											class="text-primary-blue font-medium hover:underline">Sign
											In</button>
									</p>
								</div>
							</form>
						</div>

						<!-- Right side - Info -->
						<div
							class="bg-primary-blue text-white p-8 md:p-12 flex flex-col justify-center">
							<div class="mb-6">
								<h3 class="font-heading text-2xl font-bold mb-4">Benefits
									of Creating an Account</h3>
								<ul class="space-y-3">
									<li class="flex items-start"><svg
											class="h-5 w-5 text-accent-saffron mr-2 mt-0.5"
											fill="currentColor" viewBox="0 0 20 20"
											xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
												d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
												clip-rule="evenodd"></path>
                                        </svg> <span>Track your
											grievance status in real-time</span></li>
									<li class="flex items-start"><svg
											class="h-5 w-5 text-accent-saffron mr-2 mt-0.5"
											fill="currentColor" viewBox="0 0 20 20"
											xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
												d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
												clip-rule="evenodd"></path>
                                        </svg> <span>Receive SMS and
											email notifications</span></li>
									<li class="flex items-start"><svg
											class="h-5 w-5 text-accent-saffron mr-2 mt-0.5"
											fill="currentColor" viewBox="0 0 20 20"
											xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
												d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
												clip-rule="evenodd"></path>
                                        </svg> <span>Earn civic points
											for active participation</span></li>
									<li class="flex items-start"><svg
											class="h-5 w-5 text-accent-saffron mr-2 mt-0.5"
											fill="currentColor" viewBox="0 0 20 20"
											xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
												d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
												clip-rule="evenodd"></path>
                                        </svg> <span>Access your
											grievance history anytime</span></li>
								</ul>
							</div>
							<div class="mt-8 p-4 bg-blue-800 rounded-lg">
								<p class="text-sm">Your data is secured with 256-bit
									encryption and compliant with Government of India data
									protection standards.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Login Section -->
		<section id="login-section"
			class="auth-section py-20 bg-light-blue-bg">
			<div class="container mx-auto px-6 max-w-4xl">
				<div
					class="card-glow bg-white rounded-2xl shadow-lifted overflow-hidden">
					<div class="grid md:grid-cols-2">
						<!-- Left side - Info -->
						<div
							class="bg-primary-blue text-white p-8 md:p-12 flex flex-col justify-center order-2 md:order-1">
							<div class="mb-6">
								<h3 class="font-heading text-2xl font-bold mb-4">Welcome
									Back!</h3>
								<p class="mb-6">Sign in to access your Setu account and
									continue making a difference in your community.</p>
								<ul class="space-y-3">
									<li class="flex items-start"><svg
											class="h-5 w-5 text-accent-saffron mr-2 mt-0.5"
											fill="currentColor" viewBox="0 0 20 20"
											xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
												d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
												clip-rule="evenodd"></path>
                                        </svg> <span>Check status of
											your submitted grievances</span></li>
									<li class="flex items-start"><svg
											class="h-5 w-5 text-accent-saffron mr-2 mt-0.5"
											fill="currentColor" viewBox="0 0 20 20"
											xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
												d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
												clip-rule="evenodd"></path>
                                        </svg> <span>View your civic
											points and achievements</span></li>
									<li class="flex items-start"><svg
											class="h-5 w-5 text-accent-saffron mr-2 mt-0.5"
											fill="currentColor" viewBox="0 0 20 20"
											xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
												d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
												clip-rule="evenodd"></path>
                                        </svg> <span>Submit new
											grievances and track progress</span></li>
								</ul>
							</div>
							<div class="mt-8 p-4 bg-blue-800 rounded-lg">
								<p class="text-sm">
									Having trouble signing in? <a href="forget.jsp"
										class="text-accent-saffron underline">Reset your password</a>
									or <a href="#" class="text-accent-saffron underline">contact
										support</a>.
								</p>
							</div>
						</div>

						<!-- Right side - Form -->
						<div class="p-8 md:p-12 order-1 md:order-2">
							<div class="flex justify-between items-center mb-8">
								<h2 class="font-heading text-3xl font-bold text-primary-blue">Citizen
									Login</h2>
								<button id="close-login"
									class="text-gray-500 hover:text-gray-700">
									<svg class="w-6 h-6" fill="none" stroke="currentColor"
										viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round"
											stroke-linejoin="round" stroke-width="2"
											d="M6 18L18 6M6 6l12 12"></path>
                                    </svg>
								</button>
							</div>

							<form id="login-form" class="space-y-6" action="../Login"
								method="post">
								<div>
									<label for="login_email"
										class="block text-sm font-medium text-gray-700 mb-1">Email
										Address</label> <input type="email" id="login_email" name="email"
										required
										class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
								</div>

								<div>
									<label for="login_password"
										class="block text-sm font-medium text-gray-700 mb-1">Password</label>
									<input type="password" id="login_password" name="password"
										required
										class="form-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-transparent transition">
									<div class="flex justify-between items-center mt-2">
										<div class="flex items-center"></div>
										<a href="forget.jsp"
											class="text-sm text-primary-blue hover:underline">Forgot
											password?</a>
									</div>
								</div>

								<button type="submit"
									class="w-full py-3 px-4 bg-primary-blue text-white font-bold rounded-lg hover:bg-blue-800 transition duration-300 transform hover:scale-105">
									Sign In</button>

								<div class="text-center mt-4">
									<p class="text-sm text-gray-600">
										Don't have an account?
										<button type="button" id="switch-to-register"
											class="text-primary-blue font-medium hover:underline">Create
											Account</button>
									</p>
								</div>
							</form>

							<div class="mt-8 pt-6 border-t border-gray-200">
								<h3 class="text-sm font-medium text-gray-700 mb-4">
									Quick Login Options
								</h3>
								<div class="grid grid-cols-2 gap-4">
								<% 
								String CLIENT_ID = System.getenv("CLIENT_ID");
								%>
									<a
										href="https://accounts.google.com/o/oauth2/v2/auth?client_id=<%= CLIENT_ID%>&redirect_uri=https://ionstack.site/Logincallback&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile">
									<button
										class="flex items-center justify-center px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition">
										<img
											src="https://www.svgrepo.com/show/380993/google-logo-search-new.svg"
											alt="Google" class="h-5 w-5 mr-2"> <span
											class="text-sm">Google</span>
									</button>
									</a>
									<button
										class="flex items-center justify-center px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition">
										<img src="https://www.svgrepo.com/show/515892/digilocker.svg"
											alt="DigiLocker" class="h-5 w-5 mr-2"> <span
											class="text-sm">DigiLocker</span>
									</button>
								</div>
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
					<div
						class="flex flex-col md:flex-row items-center md:items-start gap-4 mb-6">
						<img
							src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763748052/SETU_LOGO-removebg_kxwnmb.png"
							alt="setu logo" class="h-16 invert">
						<div>
							<h3 class="font-heading font-bold text-xl mb-2">Setu
								Grievance Redressal Portal</h3>
							<p class="text-blue-200 text-sm">Government of India
								Initiative</p>
						</div>
					</div>
					<p class="text-blue-200 text-sm mb-6 leading-relaxed">A single
						window platform for citizens to register grievances and track
						resolution status.</p>

					<div class="flex space-x-4 justify-center md:justify-start">
						<a href="https://www.facebook.com/"
							class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition"
							aria-label="Facebook"> <i class="fab fa-facebook-f text-sm"></i>
						</a> <a href="https://x.com/"
							class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition"
							aria-label="Twitter"> <i class="fab fa-twitter text-sm"></i>
						</a> <a href="https://www.youtube.com/youtube"
							class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition"
							aria-label="YouTube"> <i class="fab fa-youtube text-sm"></i>
						</a> <a href="https://www.instagram.com/accounts/login/"
							class="h-8 w-8 bg-blue-700 rounded-full flex items-center justify-center text-white hover:bg-blue-600 transition"
							aria-label="Instagram"> <i class="fab fa-instagram text-sm"></i>
						</a>
					</div>
				</div>

				<!-- Contact & Help -->
				<div>
					<h4
						class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Contact
						& Help</h4>
					<div class="space-y-4">
						<div class="flex items-start">
							<div
								class="flex-shrink-0 h-10 w-10 bg-blue-800 rounded-lg flex items-center justify-center mr-3">
								<i class="fas fa-phone-alt text-white text-sm"></i>
							</div>
							<div>
								<p class="text-blue-200 text-sm font-medium">Helpline</p>
								<p class="text-white font-medium">1800-11-1234</p>
								<p class="text-blue-300 text-xs">Toll Free</p>
							</div>
						</div>

						<div class="flex items-start">
							<div
								class="flex-shrink-0 h-10 w-10 bg-blue-800 rounded-lg flex items-center justify-center mr-3">
								<i class="fas fa-envelope text-white text-sm"></i>
							</div>
							<div>
								<p class="text-blue-200 text-sm font-medium">Email Support</p>
								<p class="text-white font-medium">support@setu.gov.in</p>
							</div>
						</div>

						<div class="flex items-start">
							<div
								class="flex-shrink-0 h-10 w-10 bg-blue-800 rounded-lg flex items-center justify-center mr-3">
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
					<h4
						class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Government
						Initiatives</h4>
					<div class="space-y-3">
						<a href="https://www.digitalindia.gov.in/"
							class="flex items-center p-3 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
							<img
							src="https://indiadesignsystem.bombaydc.com/assets/india-designs/display/Digital-India/white.svg"
							alt="Digital India Logo" class="h-6 mr-3"> <span
							class="text-sm">Digital India</span>
						</a> <a href="https://www.mygov.in/"
							class="flex items-center p-3 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
							<img
							src="https://cdn.brandfetch.io/idMNzAn3uw/theme/dark/logo.svg?c=1dxbfHSJFAPEGdCLU4o5B"
							alt="MyGov Logo" class="h-5 mr-3"> <span class="text-sm">MyGov</span>
						</a> <a href="https://www.india.gov.in/"
							class="flex items-center p-3 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
							<i class="fas fa-university text-white mr-3"></i> <span
							class="text-sm">National Portal of India</span>
						</a>
					</div>
				</div>
			</div>

			<!-- Important Links Section -->
			<div class="border-t border-blue-700 pt-8 mb-8">
				<h4 class="font-heading font-bold text-lg mb-6 text-center">Important
					Links</h4>
				<div class="grid grid-cols-2 md:grid-cols-6 gap-4 text-center">
					<a href="privacy-policy.html"
						class="text-blue-200 hover:text-white transition text-sm py-2">Privacy
						Policy</a> <a href="term.html"
						class="text-blue-200 hover:text-white transition text-sm py-2">Terms
						of Service</a> <a href="copy-right.html"
						class="text-blue-200 hover:text-white transition text-sm py-2">Copyright
						Policy</a> <a href="help-support.html"
						class="text-blue-200 hover:text-white transition text-sm py-2">Help
						& Support</a> <a href="how-to-submit.html"
						class="text-blue-200 hover:text-white transition text-sm py-2">Submit
						Grievance</a> <a href="guidelines.html"
						class="text-blue-200 hover:text-white transition text-sm py-2">Guidelines</a>
				</div>
			</div>

			<!-- Copyright & Info Section -->
			<div class="border-t border-blue-700 pt-6">
				<div class="text-center">
					<p class="text-blue-300 text-sm">
						Designed, Developed and Hosted by <span
							class="font-semibold text-white">Team SETU</span>
					</p>
					<p class="text-blue-300 text-sm mt-1">&copy; 2025 Setu
						Grievance Redressal Portal. All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</footer>
	    <div class="gtranslate_wrapper hidden"></div>
<script>window.gtranslateSettings = {"default_language":"en","native_language_names":true,"languages":["en","hi","mr","pa","gu","ta","te","ml","kn","bn"],"wrapper_selector":".gtranslate_wrapper","horizontal_position":"left","vertical_position":"bottom"}</script>
<script src="../js/lang.js" defer></script>
<link rel="stylesheet" href="../style/lang.css">
	<script>
    // Smooth fade-out for alert
    function fadeOutAlert(btn) {
        const alert = btn.closest('#error-message');
        alert.classList.add('opacity-0', 'transition', 'duration-500');
        setTimeout(() => alert.remove(), 500);
    }

    // Optional: Auto-hide after 5 seconds
    setTimeout(() => {
        const alert = document.getElementById('error-message');
        if (alert) fadeOutAlert(alert);
    }, 7000);
</script>
	<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>
