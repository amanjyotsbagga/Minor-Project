<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Submit Grievance | Setu | Citizen Grievance Redressal
	Portal</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;700;800&family=Inter:wght@400;500;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/submit.css">
<script src="${pageContext.request.contextPath}/js/tailwindConfig.js"></script>
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
					alt="setu logo" class="h-12">
					<div>
						<span
							class="text-2xl font-heading font-extrabold text-primary-blue">सेतु
							Setu</span>
						<p class="text-xs text-gray-500 font-semibold tracking-wide">Citizen
							Grievance Redressal Portal</p>
					</div>
				</a>
				<div class="flex items-center space-x-4">
					<a href="profile.jsp"><div
							class="hidden md:flex items-center space-x-2 bg-blue-50 px-4 py-2 rounded-lg">
							<div
								class="h-10 w-10 bg-primary-blue rounded-full flex items-center justify-center text-white font-bold">RS</div>
							<div>
								<p class="text-sm font-medium">Rahul Sharma</p>
								<p class="text-xs text-gray-500">Civic Points: 245</p>
							</div>
						</div></a>
					<button id="logout-btn"
						class="px-4 py-2 text-sm font-medium text-primary-blue bg-blue-100 rounded-lg hover:bg-blue-200 transition">
						Logout</button>
					<button id="mobile-menu-button" class="md:hidden text-dark-text">
						<svg class="w-7 h-7" fill="none" stroke="currentColor"
							viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2"
								d="M4 6h16M4 12h16M4 18h16"></path>
                        </svg>
					</button>
				</div>
			</nav>
		</div>
	</header>

	<!-- Location Permission Modal -->
	<div id="location-modal"
		class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
		<div class="bg-white rounded-2xl p-6 max-w-sm mx-4">
			<div
				class="flex items-center justify-center w-12 h-12 bg-blue-100 rounded-full mx-auto mb-4">
				<i class="fas fa-map-marker-alt text-primary-blue text-xl"></i>
			</div>
			<h3
				class="font-heading font-bold text-lg text-center text-gray-900 mb-2">Location
				Access</h3>
			<p class="text-gray-600 text-sm text-center mb-6">We use your
				location to tag your grievance for better resolution. Your location
				data is stored securely and is only used for this purpose.</p>
			<div class="flex space-x-4">
				<button id="location-deny"
					class="flex-1 px-4 py-2 bg-gray-200 text-gray-800 font-medium rounded-lg hover:bg-gray-300 transition">Deny</button>
				<button id="location-allow"
					class="flex-1 px-4 py-2 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition">Allow</button>
			</div>
		</div>
	</div>

	<!-- Success Message Modal -->
	<div id="success-modal"
		class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
		<div class="bg-white rounded-2xl p-6 max-w-md mx-4">
			<div
				class="h-16 w-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
				<i class="fas fa-check text-green-600 text-2xl"></i>
			</div>
			<h3 class="text-xl font-bold text-green-800 mb-2 text-center">Grievance
				Submitted Successfully!</h3>
			<p class="text-green-700 mb-4 text-center">Your grievance has
				been registered with the following ID:</p>
			<p
				class="font-mono text-lg font-bold text-primary-blue mb-6 text-center"
				id="success-grievance-id"></p>
			<p class="text-gray-600 mb-6 text-center">You will receive
				updates on your registered email. You can track the status of your
				grievance in the "Track Status" section.</p>
			<div class="flex flex-col sm:flex-row justify-center gap-4">
				<a href="dashboard.jsp"
					class="px-6 py-3 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition text-center">
					Go to Dashboard </a>
				<button id="submit-another"
					class="px-6 py-3 bg-white text-primary-blue border border-primary-blue font-medium rounded-lg hover:bg-blue-50 transition">
					Submit Another Grievance</button>
			</div>
		</div>
	</div>

	<!-- Main Content -->
	<div class="flex">
		<!-- Sidebar -->
		<div
			class="sidebar w-64 bg-white min-h-screen shadow-lg fixed md:relative z-40 md:z-auto">
			<div class="p-6 border-b border-gray-200">
				<h2 class="font-heading text-xl font-bold text-primary-blue">Dashboard</h2>
			</div>
			<nav class="mt-6">
				<a href="dashboard.jsp"
					class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
					<i class="fas fa-home mr-3"></i> <span>Dashboard</span>
				</a> <a href="submit.jsp"
					class="flex items-center px-6 py-3 text-primary-blue bg-blue-50 border-r-4 border-primary-blue">
					<i class="fas fa-plus-circle mr-3"></i> <span>Submit
						Grievance</span>
				</a> <a href="track-status.jsp"
					class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
					<i class="fas fa-chart-line mr-3"></i> <span>Track Status</span>
				</a> <a href="civic-points.jsp"
					class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
					<i class="fas fa-award mr-3"></i> <span>Civic Points</span>
				</a> <a href="profile.jsp"
					class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
					<i class="fas fa-user mr-3"></i> <span>Profile & Settings</span>
				</a> <a href="help-support.html"
					class="flex items-center px-6 py-3 text-gray-600 hover:bg-blue-50 hover:text-primary-blue transition">
					<i class="fas fa-question-circle mr-3"></i> <span>Help &
						Support</span>
				</a>
			</nav>
		</div>

		<!-- Grievance Form Content -->
		<div class="flex-1 p-6 md:p-8">
			<!-- Page Header -->
			<div
				class="bg-gradient-to-r from-primary-blue to-blue-700 rounded-2xl p-6 text-white mb-8 card-glow">
				<div
					class="flex flex-col md:flex-row justify-between items-start md:items-center">
					<div>
						<h1 class="font-heading text-2xl md:text-3xl font-bold mb-2">Submit
							a New Grievance</h1>
						<p class="text-blue-100">Help us improve public services by
							reporting issues you've encountered.</p>
					</div>
					<a href="track-status.jsp"><button
							class="mt-4 md:mt-0 px-6 py-3 bg-white text-primary-blue font-bold rounded-lg hover:bg-blue-50 transition flex items-center">
							<i class="fas fa-history mr-2"></i> View Previous Grievances
						</button></a>
				</div>
			</div>

			<!-- Grievance Form -->
			<div class="bg-white rounded-2xl shadow-lifted overflow-hidden mb-8">
				<div class="px-6 py-4 border-b border-gray-200">
					<h2 class="font-heading text-xl font-bold text-primary-blue">Grievance
						Details</h2>
				</div>

				<!-- Progress Steps -->
				<div class="step-indicator px-6 pt-6">
					<div class="step active" data-step="1">
						<div class="step-number">1</div>
						<div class="step-label">Basic Info</div>
					</div>
					<div class="step" data-step="2">
						<div class="step-number">2</div>
						<div class="step-label">Details</div>
					</div>
					<div class="step" data-step="3">
						<div class="step-number">3</div>
						<div class="step-label">Review</div>
					</div>
				</div>

				<form id="grievance-form"
					action="${pageContext.request.contextPath}/SubmitGrievanceServlet"
					method="post" class="p-6" enctype="multipart/form-data">
					<!-- Step 1: Basic Information -->
					<input type="hidden" id="latitude" name="latitude" value="">
					<input type="hidden" id="longitude" name="longitude" value="">
					<div class="form-step active" id="step-1">
						<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
							<div>
								<label for="department"
									class="block text-sm font-medium text-gray-700 mb-2">Department/Authority
									<span class="text-red-500">*</span>
								</label> <select id="department" name="department"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue"
									required>
									<option value="">Select Department</option>
									<option value="dont-know">Don't Know</option>
									<option value="municipal-corporation">Municipal
										Corporation</option>
									<option value="electricity-department">Electricity
										Department</option>
									<option value="transport">Transport Department</option>
									<option value="water-department" disabled>Water
										Department <b>(coming soon)</b></option>
									<option value="public-works" disabled>Public Works
										Department <b>(coming soon)</b></option>
									<option value="health" disabled>Health Department <b>(coming
											soon)</b></option>
									<option value="education" disabled>Education
										Department <b>(coming soon)</b></option>
									<option value="police" disabled>Police Department <b>(coming
											soon)</b></option>
								</select>
							</div>

							<div>
								<label for="category"
									class="block text-sm font-medium text-gray-700 mb-2">Grievance
									Category <span class="text-red-500">*</span>
								</label> <select id="category" name="category"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue"
									required>
									<option value="">Select Category</option>
									<!-- Categories will be populated dynamically based on department selection -->
								</select>
							</div>

							<div class="md:col-span-2">
								<label for="subject"
									class="block text-sm font-medium text-gray-700 mb-2">Subject
									<span class="text-red-500">*</span>
								</label> <input type="text" id="subject" name="subject"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue"
									placeholder="Brief description of your grievance" required>
							</div>
						</div>

						<div class="flex justify-between mt-8">
							<div></div>
							<!-- Empty div for spacing -->
							<button type="button"
								class="next-step px-6 py-3 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center">
								Next Step <i class="fas fa-arrow-right ml-2"></i>
							</button>
						</div>
					</div>

					<!-- Step 2: Detailed Information -->
					<div class="form-step" id="step-2">
						<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
							<div class="md:col-span-2">
								<label for="description"
									class="block text-sm font-medium text-gray-700 mb-2">Detailed
									Description <span class="text-red-500">*</span>
								</label>
								<textarea id="description" name="description" rows="5"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue"
									placeholder="Please provide a detailed description of the issue, including when it started, how it affects you, and any other relevant details."
									required></textarea>
							</div>

							<div>
								<label for="location"
									class="block text-sm font-medium text-gray-700 mb-2">Location
									<span class="text-red-500">*</span>
								</label> <input type="text" id="location" name="location"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue"
									placeholder="Street, Area, Landmark" required>
							</div>

							<div>
								<label for="pincode"
									class="block text-sm font-medium text-gray-700 mb-2">Pincode
									<span class="text-red-500">*</span>
								</label> <input type="text" id="pincode" name="pincode"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue"
									placeholder="6-digit pincode" pattern="[0-9]{6}" required>
							</div>

							<div>
								<label for="date-observed"
									class="block text-sm font-medium text-gray-700 mb-2">Date
									First Observed</label> <input type="date" id="date-observed"
									name="dateObserved"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue">
							</div>

							<div>
								<label for="contact-preference"
									class="block text-sm font-medium text-gray-700 mb-2">Preferred
									Contact Method</label> <select id="contact-preference"
									name="contactPreference"
									class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-blue focus:border-primary-blue">
									<option value="email">Email</option>
								</select>
							</div>

							<div class="md:col-span-2">
								<label class="block text-sm font-medium text-gray-700 mb-2">Upload
									Supporting Documents <span class="text-red-500">*</span>
								</label>
								<p class="text-xs text-gray-500 mb-4">At least one
									photo/document is required to submit your grievance</p>

								<!-- Camera Option -->
								<div class="mb-4">
									<button type="button" id="camera-btn"
										class="px-4 py-2 bg-primary-blue text-white rounded-lg hover:bg-blue-800 transition flex items-center">
										<i class="fas fa-camera mr-2"></i> Use Camera
									</button>
									<video id="camera-preview" autoplay></video>
									<button type="button" id="capture-btn"
										class="px-4 py-2 bg-accent-green text-white rounded-lg hover:bg-green-700 transition flex items-center">
										<i class="fas fa-camera mr-2"></i> Capture Photo
									</button>
									<canvas id="canvas" style="display: none;"></canvas>
								</div>

								<!-- File Upload Option -->
								<div
									class="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-lg">
									<div class="space-y-1 text-center">
										<svg class="mx-auto h-12 w-12 text-gray-400"
											stroke="currentColor" fill="none" viewBox="0 0 48 48"
											aria-hidden="true">
                                            <path
												d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
												stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" />
                                        </svg>
										<div class="flex text-sm text-gray-600">
											<label for="file-upload"
												class="relative cursor-pointer bg-white rounded-md font-medium text-primary-blue hover:text-blue-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-primary-blue">
												<span>Upload files</span> <input id="file-upload"
												name="attachments" type="file" class="sr-only" multiple
												accept="image/*, .pdf">
											</label>
											<p class="pl-1">or drag and drop</p>
										</div>
										<p class="text-xs text-gray-500">PNG, JPG, PDF up to 10MB
											each</p>
									</div>
								</div>

								<!-- Preview of captured/uploaded images -->
								<div id="image-preview"
									class="mt-4 grid grid-cols-2 md:grid-cols-4 gap-4"></div>
								<div id="attachment-error"
									class="text-red-500 text-sm mt-2 hidden">Please upload at
									least one supporting document</div>
							</div>
						</div>

						<div class="flex justify-between mt-8">
							<button type="button"
								class="prev-step px-6 py-3 bg-gray-200 text-gray-700 font-medium rounded-lg hover:bg-gray-300 transition flex items-center">
								<i class="fas fa-arrow-left mr-2"></i> Previous Step
							</button>
							<button type="button"
								class="next-step px-6 py-3 bg-primary-blue text-white font-medium rounded-lg hover:bg-blue-800 transition flex items-center">
								Next Step <i class="fas fa-arrow-right ml-2"></i>
							</button>
						</div>
					</div>

					<!-- Step 3: Review and Submit -->
					<div class="form-step" id="step-3">
						<div class="bg-blue-50 p-4 rounded-lg mb-6">
							<h3 class="font-medium text-primary-blue mb-2">Review Your
								Grievance</h3>
							<p class="text-sm text-gray-600">Please review all the
								information below before submitting your grievance. You can go
								back to previous steps to make changes if needed.</p>
						</div>

						<div class="space-y-6">
							<div class="grid grid-cols-1 md:grid-cols-2 gap-4">
								<div>
									<h4 class="text-sm font-medium text-gray-500">Department</h4>
									<p id="review-department" class="mt-1 text-gray-900">-</p>
								</div>
								<div>
									<h4 class="text-sm font-medium text-gray-500">Category</h4>
									<p id="review-category" class="mt-1 text-gray-900">-</p>
								</div>
								<div class="md:col-span-2">
									<h4 class="text-sm font-medium text-gray-500">Subject</h4>
									<p id="review-subject" class="mt-1 text-gray-900">-</p>
								</div>
								<div>
									<h4 class="text-sm font-medium text-gray-500">Location</h4>
									<p id="review-location" class="mt-1 text-gray-900">-</p>
								</div>
								<div>
									<h4 class="text-sm font-medium text-gray-500">Pincode</h4>
									<p id="review-pincode" class="mt-1 text-gray-900">-</p>
								</div>
								<div>
									<h4 class="text-sm font-medium text-gray-500">Date First
										Observed</h4>
									<p id="review-date" class="mt-1 text-gray-900">-</p>
								</div>
								<div>
									<h4 class="text-sm font-medium text-gray-500">Contact
										Preference</h4>
									<p id="review-contact" class="mt-1 text-gray-900">-</p>
								</div>
								<div class="md:col-span-2">
									<h4 class="text-sm font-medium text-gray-500">Description</h4>
									<p id="review-description" class="mt-1 text-gray-900">-</p>
								</div>
								<div class="md:col-span-2">
									<h4 class="text-sm font-medium text-gray-500">Attachments</h4>
									<p id="review-attachments" class="mt-1 text-gray-900">None</p>
									<div id="review-geotags" class="mt-2 space-y-1"></div>
								</div>
							</div>

							<div class="border-t border-gray-200 pt-6">
								<div class="flex items-start">
									<div class="flex items-center h-5">
										<input id="consent" name="consent" type="checkbox"
											class="focus:ring-primary-blue h-4 w-4 text-primary-blue border-gray-300 rounded"
											required>
									</div>
									<div class="ml-3 text-sm">
										<label for="consent" class="font-medium text-gray-700">I
											confirm that the information provided is accurate to the best
											of my knowledge</label>
										<p class="text-gray-500">By submitting this grievance, I
											agree to the terms of service and privacy policy of the Setu
											Grievance Redressal Portal.</p>
									</div>
								</div>
							</div>
						</div>

						<div class="flex justify-between mt-8">
							<button type="button"
								class="prev-step px-6 py-3 bg-gray-200 text-gray-700 font-medium rounded-lg hover:bg-gray-300 transition flex items-center">
								<i class="fas fa-arrow-left mr-2"></i> Previous Step
							</button>
							<button type="submit"
								class="submit-grievance px-6 py-3 bg-accent-green text-white font-medium rounded-lg hover:bg-green-700 transition flex items-center">
								<i class="fas fa-paper-plane mr-2"></i> Submit Grievance
							</button>
						</div>
					</div>
				</form>
			</div>

			<!-- Help Section -->
			<div class="bg-white rounded-2xl shadow-lifted overflow-hidden">
				<div class="px-6 py-4 border-b border-gray-200">
					<h2 class="font-heading text-xl font-bold text-primary-blue">Need
						Help?</h2>
				</div>
				<div class="p-6">
					<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
						<a href="how-to-submit.html"><div class="text-center">
								<div
									class="h-12 w-12 bg-blue-100 rounded-lg flex items-center justify-center mx-auto mb-4">
									<i class="fas fa-question-circle text-primary-blue text-xl"></i>
								</div>
								<h3 class="font-medium text-gray-900 mb-2">How to Submit</h3>
								<p class="text-sm text-gray-500">Learn how to effectively
									submit a grievance with proper details.</p>
							</div></a> <a href="guidelines.html"><div class="text-center">
								<div
									class="h-12 w-12 bg-blue-100 rounded-lg flex items-center justify-center mx-auto mb-4">
									<i class="fas fa-file-alt text-primary-blue text-xl"></i>
								</div>
								<h3 class="font-medium text-gray-900 mb-2">Grievance
									Guidelines</h3>
								<p class="text-sm text-gray-500">Understand what types of
									grievances can be submitted.</p>
							</div></a> <a href=""><div class="text-center">
								<div
									class="h-12 w-12 bg-blue-100 rounded-lg flex items-center justify-center mx-auto mb-4">
									<i class="fas fa-phone-alt text-primary-blue text-xl"></i>
								</div>
								<h3 class="font-medium text-gray-900 mb-2">Contact Support</h3>
								<p class="text-sm text-gray-500">Get help from our support
									team if you face any issues.</p>
							</div></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Enhanced Footer -->
	<footer class="bg-primary-blue text-white">
		<div class="container mx-auto px-6 pt-12 pb-8">
			<!-- Main Footer Content -->
			<div
				class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8 mb-10">
				<!-- Brand & Description -->
				<div class="lg:col-span-1">
					<div class="flex items-start gap-4 mb-6">
						<img
							src="https://res.cloudinary.com/dn6hkqmrt/image/upload/v1763748052/SETU_LOGO-removebg_kxwnmb.png"
							alt="setu logo" class="h-16 invert">
						<div>
							<h3 class="font-heading font-bold text-xl mb-2">Setu
								Grievance Redressal Portal</h3>
							<p class="text-blue-200 text-sm">A platform that connects
								citizen and government</p>
						</div>
					</div>
					<p class="text-blue-200 text-sm mb-4">A single window platform
						for citizens to register their grievances and track their
						resolution status.</p>
					<div class="flex space-x-4">
						<a href="https://www.facebook.com/"
							class="text-blue-200 hover:text-white transition"
							aria-label="Facebook"> <i class="fab fa-facebook-f"></i>
						</a> <a href="https://x.com/"
							class="text-blue-200 hover:text-white transition"
							aria-label="Twitter"> <i class="fab fa-twitter"></i>
						</a> <a href="https://www.youtube.com/youtube"
							class="text-blue-200 hover:text-white transition"
							aria-label="YouTube"> <i class="fab fa-youtube"></i>
						</a> <a href="https://www.instagram.com/accounts/login/"
							class="text-blue-200 hover:text-white transition"
							aria-label="Instagram"> <i class="fab fa-instagram"></i>
						</a>
					</div>
				</div>

				<!-- Quick Links -->
				<div>
					<h4
						class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Quick
						Links</h4>
					<ul class="space-y-3">
						<li><a href="dashboard.jsp"
							class="text-blue-200 hover:text-white transition text-sm">Dashboard</a></li>
						<li><a href="submit.jsp"
							class="text-blue-200 hover:text-white transition text-sm">Submit
								Grievance</a></li>
						<li><a href="track-status.jsp"
							class="text-blue-200 hover:text-white transition text-sm">Track
								Status</a></li>
						<li><a href="civic-points.jsp"
							class="text-blue-200 hover:text-white transition text-sm">Civic
								Points</a></li>
						<li><a href="profile.jsp"
							class="text-blue-200 hover:text-white transition text-sm">Profile
								& Settings</a></li>
						<li><a href="feedback.jsp"
							class="text-blue-200 hover:text-white transition text-sm">Feedback</a></li>
					</ul>
				</div>

				<!-- Contact & Help -->
				<div>
					<h4
						class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Contact
						& Help</h4>
					<ul class="space-y-3">
						<li class="flex items-start"><i
							class="fas fa-phone-alt text-blue-300 mt-1 mr-3 text-sm"></i>
							<div>
								<p class="text-blue-200 text-sm font-medium">Helpline</p>
								<p class="text-white text-sm">1800-11-1234 (Toll Free)</p>
							</div></li>
						<li class="flex items-start"><i
							class="fas fa-envelope text-blue-300 mt-1 mr-3 text-sm"></i>
							<div>
								<p class="text-blue-200 text-sm font-medium">Email</p>
								<p class="text-white text-sm">support@setu.gov.in</p>
							</div></li>
						<li class="flex items-start"><i
							class="fas fa-clock text-blue-300 mt-1 mr-3 text-sm"></i>
							<div>
								<p class="text-blue-200 text-sm font-medium">Working Hours</p>
								<p class="text-white text-sm">Mon-Sat: 9:00 AM - 6:00 PM</p>
							</div></li>
					</ul>
				</div>

				<!-- Government Initiatives -->
				<div>
					<h4
						class="font-heading font-bold text-lg mb-4 border-b border-blue-700 pb-2">Government
						Initiatives</h4>
					<div class="flex flex-col space-y-4">
						<a href="https://www.digitalindia.gov.in/"
							class="flex items-center p-2 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
							<img
							src="https://indiadesignsystem.bombaydc.com/assets/india-designs/display/Digital-India/white.svg"
							alt="Digital India Logo" class="h-8 mr-3"> <span
							class="text-sm">Digital India</span>
						</a> <a href="https://www.mygov.in/"
							class="flex items-center p-2 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
							<img
							src="https://cdn.brandfetch.io/idMNzAn3uw/theme/dark/logo.svg?c=1dxbfHSJFAPEGdCLU4o5B"
							alt="MyGov Logo" class="h-6 mr-3"> <span class="text-sm">MyGov</span>
						</a> <a href="https://www.india.gov.in/"
							class="flex items-center p-2 bg-blue-800 rounded-lg hover:bg-blue-700 transition">
							<i class="fas fa-university text-white mr-3"></i> <span
							class="text-sm">National Portal of India</span>
						</a>
					</div>
				</div>
			</div>

			<!-- Important Links Section -->
			<div class="border-t border-blue-700 pt-8 mb-8">
				<h4 class="font-heading font-bold text-lg mb-4 text-center">Important
					Links</h4>
				<div class="grid grid-cols-2 md:grid-cols-4 gap-4 text-center">
					<a href="privacy-policy.html"
						class="text-blue-200 hover:text-white transition text-sm">Privacy
						Policy</a> <a href="term.html"
						class="text-blue-200 hover:text-white transition text-sm">Terms
						of Service</a> <a href="copy-right.html"
						class="text-blue-200 hover:text-white transition text-sm">Copyright
						Policy</a> <a href="help-support.html"
						class="text-blue-200 hover:text-white transition text-sm">Help
						& Support</a> <a href="feedback.jsp"
						class="text-blue-200 hover:text-white transition text-sm">Feedback</a>
					<a href="how-to-submit.html"
						class="text-blue-200 hover:text-white transition text-sm">How
						to submit grievance</a> <a href="guidelines.html"
						class="text-blue-200 hover:text-white transition text-sm">Guidelines</a>
				</div>
			</div>

			<!-- Copyright & Info Section -->
			<div class="border-t border-blue-700 pt-6">
				<div class="flex justify-center items-center">
					<p class="text-blue-300 text-sm text-center">
						Designed, Developed and Hosted by <span class="font-semibold">Team
							SETU</span>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<script src="${pageContext.request.contextPath}/js/submit.js"></script>

	<!-- Script to handle form submission and success modal -->
	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							const form = document
									.getElementById('grievance-form');
							const successModal = document
									.getElementById('success-modal');
							const submitAnotherBtn = document
									.getElementById('submit-another');

							// Handle form submission
							form.addEventListener('submit', function(e) {
								// Client-side validation is already handled by the multi-step form
								// The form will be submitted to the servlet via normal POST request
								// After submission, the servlet should redirect back with success message or handle accordingly
							});

							// Handle "Submit Another" button
							submitAnotherBtn
									.addEventListener(
											'click',
											function() {
												successModal.classList
														.add('hidden');
												// Reset the form and go back to step 1
												form.reset();
												currentStep = 1;
												showStep(currentStep);
												// Clear image preview
												document
														.getElementById('image-preview').innerHTML = '';
												fileGeolocations.clear();
												cameraImages.clear();
												updateAttachmentsCount();
												validateAttachments();
											});

							// Check if there's a success parameter in URL (set by servlet after redirect)
							const urlParams = new URLSearchParams(
									window.location.search);
							if (urlParams.has('success')
									&& urlParams.get('success') === 'true') {
								const grievanceId = urlParams
										.get('grievanceId')
										|| 'SETU-'
										+ new Date().getFullYear()
										+ '-'
										+ Math
												.floor(10000 + Math.random() * 90000);
								document.getElementById('success-grievance-id').textContent = grievanceId;
								successModal.classList.remove('hidden');
							}
						});
	</script>
</body>
</html>