// Mobile menu functionality
const mobileMenuButton = document.getElementById('mobile-menu-button');
const sidebar = document.querySelector('.sidebar');

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

// Logout button
document.getElementById('logout-btn').addEventListener('click', function() {
    if(confirm('Are you sure you want to logout?')) {
        window.location.href = 'login.html';
    }
});

// Set current date as default for date-observed field
document.addEventListener('DOMContentLoaded', function() {
    const today = new Date();
    const formattedDate = today.toISOString().split('T')[0];
    document.getElementById('date-observed').value = formattedDate;
});

// Department categories mapping
const departmentCategories = {
    'municipal-corporation': [
        'Garbage Collection',
        'Street Cleaning',
        'Public Toilets',
        'sewage problem'
    ],
    'water-department': [
        'Water Supply',
        'Water Quality',
        'Leakage Issues',
        'Billing Problems',
        'New Connection',
        'Water Pressure'
    ],
    'electricity-department': [
        'Street Light Issues',
        'Electrical hazards on the road',
        'Problem in electric pole',
        'Electrical Safety'
    ],
    'public-works': [
        'Road Construction',
        'Bridge Maintenance',
        'Public Building Issues',
        'Infrastructure Projects'
    ],
    'transport': [
        'Traffic Signals',
        'Road Signs',
        'Parking Issues'
   ],
    'health': [
        'Hospital Services',
        'Clinic Issues',
        'Public Health Programs',
        'Sanitation Issues'
    ],
    'education': [
        'School Infrastructure',
        'Teacher Issues',
        'Admission Problems',
        'Educational Programs'
    ],
    'police': [
        'Law Enforcement',
        'Traffic Management',
        'Safety Concerns',
        'Police Assistance'
    ],
    'dont-know': [
        'Don\'t Know'
    ]
};

// Update categories based on department selection
document.getElementById('department').addEventListener('change', function() {
    const selectedDepartment = this.value;
    const categorySelect = document.getElementById('category');
    
    // Clear existing options
    categorySelect.innerHTML = '<option value="">Select Category</option>';
    
    // Add new options based on selected department
    if (selectedDepartment && departmentCategories[selectedDepartment]) {
        departmentCategories[selectedDepartment].forEach(category => {
            const option = document.createElement('option');
            option.value = category;
            option.textContent = category;
            categorySelect.appendChild(option);
        });
    }
});

// Store geolocation data for each file
const fileGeolocations = new Map();
let currentGeolocation = null;
// Update the getCurrentLocation function to set hidden fields
function getCurrentLocation() {
    return new Promise((resolve, reject) => {
        if (!navigator.geolocation) {
            reject(new Error('Geolocation is not supported by this browser.'));
            return;
        }

        navigator.geolocation.getCurrentPosition(
            (position) => {
                const { latitude, longitude } = position.coords;
                currentGeolocation = { latitude, longitude };
                
                // Set hidden form fields
                document.getElementById('latitude').value = latitude;
                document.getElementById('longitude').value = longitude;
                
                resolve(currentGeolocation);
            },
            (error) => {
                console.error('Error getting location:', error);
                currentGeolocation = { latitude: null, longitude: null, approximate: true };
                resolve(currentGeolocation);
            },
            {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 60000
            }
        );
    });
}
// Format location for display
function formatLocation(location) {
    if (!location || (location.latitude === null && location.longitude === null)) {
        return 'Location data not available';
    }
    
    if (location.approximate) {
        return 'Approximate location (based on network)';
    }
    
    return `Lat: ${location.latitude.toFixed(6)}, Lng: ${location.longitude.toFixed(6)}`;
}

// Camera functionality
const cameraBtn = document.getElementById('camera-btn');
const cameraPreview = document.getElementById('camera-preview');
const captureBtn = document.getElementById('capture-btn');
const canvas = document.getElementById('canvas');
const imagePreview = document.getElementById('image-preview');
let stream = null;

cameraBtn.addEventListener('click', async function() {
    try {
        // Get location before capturing
        await getCurrentLocation();

        // Request back (environment) camera
        stream = await navigator.mediaDevices.getUserMedia({
            video: { facingMode: { exact: 'environment' } } 
        });

        cameraPreview.srcObject = stream;
        cameraPreview.style.display = 'block';
        captureBtn.style.display = 'block';
        cameraBtn.style.display = 'none';
    } catch (err) {
        // If back camera is not available, fall back to default
        console.error(err);
        try {
            stream = await navigator.mediaDevices.getUserMedia({
                video: true
            });
            cameraPreview.srcObject = stream;
            cameraPreview.style.display = 'block';
            captureBtn.style.display = 'block';
            cameraBtn.style.display = 'none';
        } catch (e) {
            alert('Unable to access camera: ' + e.message);
        }
    }
});

captureBtn.addEventListener('click', async function() {
    const context = canvas.getContext('2d');
    canvas.width = cameraPreview.videoWidth;
    canvas.height = cameraPreview.videoHeight;
    context.drawImage(cameraPreview, 0, 0, canvas.width, canvas.height);
    
    // Convert canvas to data URL and create image element
    const dataURL = canvas.toDataURL('image/png');
    const fileId = 'camera_' + Date.now();
    
    // Store geolocation with file
    fileGeolocations.set(fileId, currentGeolocation);
    
    // Create preview item with remove button
    const previewItem = document.createElement('div');
    previewItem.className = 'preview-item';
    previewItem.dataset.fileId = fileId;
    
    const imgElement = document.createElement('img');
    imgElement.src = dataURL;
    imgElement.className = 'preview-image';
    
    const locationTag = document.createElement('div');
    locationTag.className = 'location-tag';
    locationTag.textContent = formatLocation(currentGeolocation);
    
    const removeBtn = document.createElement('button');
    removeBtn.className = 'remove-btn';
    removeBtn.innerHTML = '×';
    removeBtn.onclick = function() {
        fileGeolocations.delete(fileId);
        previewItem.remove();
        updateAttachmentsCount();
        validateAttachments();
    };
    
    previewItem.appendChild(imgElement);
    previewItem.appendChild(locationTag);
    previewItem.appendChild(removeBtn);
    imagePreview.appendChild(previewItem);
    
    // Stop camera
    if (stream) {
        stream.getTracks().forEach(track => track.stop());
    }
    
    // Reset UI
    cameraPreview.style.display = 'none';
    captureBtn.style.display = 'none';
    cameraBtn.style.display = 'block';
    
    updateAttachmentsCount();
    validateAttachments();
});

// Handle file uploads
document.getElementById('file-upload').addEventListener('change', async function(e) {
    const files = e.target.files;
    
    // Get location for all uploaded files
    await getCurrentLocation();
    
    for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const fileId = 'file_' + Date.now() + '_' + i;
        
        // Store geolocation with file
        fileGeolocations.set(fileId, currentGeolocation);
        
        if (file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function(e) {
                // Create preview item with remove button
                const previewItem = document.createElement('div');
                previewItem.className = 'preview-item';
                previewItem.dataset.fileId = fileId;
                
                const imgElement = document.createElement('img');
                imgElement.src = e.target.result;
                imgElement.className = 'preview-image';
                
                const locationTag = document.createElement('div');
                locationTag.className = 'location-tag';
                locationTag.textContent = formatLocation(currentGeolocation);
                
                const removeBtn = document.createElement('button');
                removeBtn.className = 'remove-btn';
                removeBtn.innerHTML = '×';
                removeBtn.onclick = function() {
                    fileGeolocations.delete(fileId);
                    previewItem.remove();
                    updateAttachmentsCount();
                    validateAttachments();
                };
                
                previewItem.appendChild(imgElement);
                previewItem.appendChild(locationTag);
                previewItem.appendChild(removeBtn);
                imagePreview.appendChild(previewItem);
                
                updateAttachmentsCount();
                validateAttachments();
            };
            reader.readAsDataURL(file);
        } else {
            // For non-image files (like PDF), show a file icon
            const previewItem = document.createElement('div');
            previewItem.className = 'preview-item';
            previewItem.dataset.fileId = fileId;
            
            const fileElement = document.createElement('div');
            fileElement.className = 'file-preview-container';
            fileElement.innerHTML = `
                <i class="fas fa-file-pdf text-red-500 text-2xl mb-2"></i>
                <p class="text-xs truncate">${file.name}</p>
            `;
            
            const locationTag = document.createElement('div');
            locationTag.className = 'location-tag';
            locationTag.textContent = formatLocation(currentGeolocation);
            
            const removeBtn = document.createElement('button');
            removeBtn.className = 'remove-btn';
            removeBtn.innerHTML = '×';
            removeBtn.onclick = function() {
                fileGeolocations.delete(fileId);
                previewItem.remove();
                updateAttachmentsCount();
                validateAttachments();
            };
            
            previewItem.appendChild(fileElement);
            previewItem.appendChild(locationTag);
            previewItem.appendChild(removeBtn);
            imagePreview.appendChild(previewItem);
            
            updateAttachmentsCount();
            validateAttachments();
        }
    }
});

// Function to update attachments count
function updateAttachmentsCount() {
    const imageCount = document.getElementById('image-preview').children.length;
    if (currentStep === 3) {
        document.getElementById('review-attachments').textContent = imageCount > 0 ? `${imageCount} file(s) attached `: 'None';
        
        // Update geotags in review
        const geotagsContainer = document.getElementById('review-geotags');
        geotagsContainer.innerHTML = '';
        
        if (imageCount > 0) {
            fileGeolocations.forEach((location, fileId) => {
                const geotagElement = document.createElement('div');
                geotagElement.className = 'text-xs text-gray-600';
                geotagElement.textContent = `📍 ${formatLocation(location)}`;
                geotagsContainer.appendChild(geotagElement);
            });
        }
    }
}

// Validate attachments
function validateAttachments() {
    const imageCount = document.getElementById('image-preview').children.length;
    const errorElement = document.getElementById('attachment-error');
    
    if (imageCount === 0) {
        errorElement.classList.remove('hidden');
        return false;
    } else {
        errorElement.classList.add('hidden');
        return true;
    }
}

// Multi-step form functionality
let currentStep = 1;
const totalSteps = 3;

function showStep(step) {
    // Hide all steps
    document.querySelectorAll('.form-step').forEach(el => {
        el.classList.remove('active');
    });
    
    // Show current step
    document.getElementById(`step-${step}`).classList.add('active');
    
    // Update step indicators
    document.querySelectorAll('.step').forEach((el, index) => {
        const stepNumber = index + 1;
        if (stepNumber < step) {
            el.classList.add('completed');
            el.classList.remove('active');
        } else if (stepNumber === step) {
            el.classList.add('active');
            el.classList.remove('completed');
        } else {
            el.classList.remove('active', 'completed');
        }
    });
}

// Next step buttons
document.querySelectorAll('.next-step').forEach(button => {
    button.addEventListener('click', function() {
        if (validateStep(currentStep)) {
            if (currentStep === 2) {
                updateReviewSection();
            }
            currentStep++;
            showStep(currentStep);
        }
    });
});

// Previous step buttons
document.querySelectorAll('.prev-step').forEach(button => {
    button.addEventListener('click', function() {
        currentStep--;
        showStep(currentStep);
    });
});

// Form validation for each step
function validateStep(step) {
    let isValid = true;
    
    if (step === 1) {
        const department = document.getElementById('department');
        const category = document.getElementById('category');
        const subject = document.getElementById('subject');
        
        if (!department.value) {
            isValid = false;
            highlightError(department);
        } else {
            removeError(department);
        }
        
        if (!category.value) {
            isValid = false;
            highlightError(category);
        } else {
            removeError(category);
        }
        
        if (!subject.value.trim()) {
            isValid = false;
            highlightError(subject);
        } else {
            removeError(subject);
        }
    } else if (step === 2) {
        const description = document.getElementById('description');
        const location = document.getElementById('location');
        const pincode = document.getElementById('pincode');
        
        if (!description.value.trim()) {
            isValid = false;
            highlightError(description);
        } else {
            removeError(description);
        }
        
        if (!location.value.trim()) {
            isValid = false;
            highlightError(location);
        } else {
            removeError(location);
        }
        
        if (!pincode.value.trim() || !/^\d{6}$/.test(pincode.value)) {
            isValid = false;
            highlightError(pincode);
        } else {
            removeError(pincode);
        }
        
        // Validate attachments
        if (!validateAttachments()) {
            isValid = false;
        }
    }
    
    return isValid;
}

function highlightError(element) {
    element.classList.add('border-red-500');
    element.classList.remove('border-gray-300');
}

function removeError(element) {
    element.classList.remove('border-red-500');
    element.classList.add('border-gray-300');
}

// Format date to DD-MM-YYYY
function formatDate(dateString) {
    if (!dateString) return 'Not specified';
    
    const date = new Date(dateString);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const year = date.getFullYear();
    
    return `${day}-${month}-${year}`;
}

// Update review section with form data
function updateReviewSection() {
    document.getElementById('review-department').textContent = document.getElementById('department').options[document.getElementById('department').selectedIndex].text;
    document.getElementById('review-category').textContent = document.getElementById('category').options[document.getElementById('category').selectedIndex].text;
    document.getElementById('review-subject').textContent = document.getElementById('subject').value;
    document.getElementById('review-location').textContent = document.getElementById('location').value;
    document.getElementById('review-pincode').textContent = document.getElementById('pincode').value;
    document.getElementById('review-date').textContent = formatDate(document.getElementById('date-observed').value);
    
    const contact = document.getElementById('contact-preference');
    document.getElementById('review-contact').textContent = contact.options[contact.selectedIndex].text;
    document.getElementById('review-description').textContent = document.getElementById('description').value;
    
    // Update attachments count
    const imageCount = document.getElementById('image-preview').children.length;
    document.getElementById('review-attachments').textContent = imageCount > 0 ? `${imageCount} file(s) attached` : 'None';
    
    // Update geotags in review
    const geotagsContainer = document.getElementById('review-geotags');
    geotagsContainer.innerHTML = '';
    
    if (imageCount > 0) {
        fileGeolocations.forEach((location, fileId) => {
            const geotagElement = document.createElement('div');
            geotagElement.className = 'text-xs text-gray-600';
            geotagElement.textContent = `📍 ${formatLocation(location)}`;
            geotagsContainer.appendChild(geotagElement);
        });
    }
}

// Form submission - COMPLETELY SIMPLIFIED
document.getElementById('grievance-form').addEventListener('submit', function(e) {
    // Only validate consent, don't prevent default submission
    if (!document.getElementById('consent').checked) {
        e.preventDefault();
        alert('Please confirm that the information provided is accurate before submitting.');
        return;
    }
    
    // The form will now submit normally to the servlet
    console.log('Form submitted to servlet');
});

// Initialize the form
showStep(currentStep);

// Get initial location
getCurrentLocation().catch(err => {
    console.log('Could not get initial location:', err.message);
});

// Location Permission Modal
document.addEventListener('DOMContentLoaded', function() {
    const locationModal = document.getElementById('location-modal');
    const locationAllow = document.getElementById('location-allow');
    const locationDeny = document.getElementById('location-deny');

    // Show modal after short delay (optional)
    setTimeout(() => {
        locationModal?.classList.remove('hidden');
    }, 1000);

    // Handle Allow button
    locationAllow?.addEventListener('click', async function() {
        locationModal.classList.add('hidden');

        try {
            const location = await getCurrentLocation();
            console.log('✅ Location access granted:', location);
        } catch (err) {
            console.warn('⚠️ Location access failed:', err);
            alert('Unable to access your location. Please enable GPS or give permission.');
        }
    });

    // Handle Deny button
    locationDeny?.addEventListener('click', function() {
        locationModal.classList.add('hidden');
        window.currentGeolocation = { latitude: null, longitude: null, denied: true };
        console.log('🚫 Location access denied by user');
        alert('Unable to access your location. Please enable GPS or give permission.');
    });
});