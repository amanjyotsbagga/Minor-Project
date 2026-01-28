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

        // Grievance selection functionality
        const grievanceItems = document.querySelectorAll('.grievance-item');
        const noSelectionDiv = document.getElementById('no-selection');
        const grievanceDetailsDiv = document.getElementById('grievance-details');
        
        // Sample grievance data
        const grievanceData = {
            'SETU-2025-01542': {
                title: 'Water Supply Issue in Sector 15',
                status: 'In Progress',
                id: 'SETU-2025-01542',
                date: '15 Oct 2025',
                department: 'Water Department',
                location: 'Sector 15, Chandigarh',
                priority: 'High',
                resolution: '25 Oct 2025',
                description: 'Irregular water supply in Sector 15 for the past 5 days. Water pressure is very low during morning and evening hours, affecting daily activities.',
                contactDept: 'Water Department, Chandigarh',
                contactPerson: 'Assigned Officer: Mr. Rajesh Kumar',
                contactPhone: '+91 98765 43210'
            },
            'SETU-2025-01489': {
                title: 'Garbage Collection Not Regular',
                status: 'Resolved',
                id: 'SETU-2025-01489',
                date: '10 Oct 2025',
                department: 'Municipal Corporation',
                location: 'Sector 22, Chandigarh',
                priority: 'Medium',
                resolution: '18 Oct 2025',
                description: 'Garbage collection has become irregular in our area. The garbage truck comes only 2-3 times a week instead of daily, causing accumulation of waste.',
                contactDept: 'Municipal Corporation, Chandigarh',
                contactPerson: 'Assigned Officer: Ms. Sunita Sharma',
                contactPhone: '+91 98765 43211'
            },
            'SETU-2025-01376': {
                title: 'Street Light Not Working',
                status: 'Pending',
                id: 'SETU-2025-01376',
                date: '5 Oct 2025',
                department: 'Electricity Department',
                location: 'Sector 34, Chandigarh',
                priority: 'Medium',
                resolution: '30 Oct 2025',
                description: 'Street light number 45 in Sector 34 has not been working for the past 2 weeks, creating safety concerns during night hours.',
                contactDept: 'Electricity Department, Chandigarh',
                contactPerson: 'Assigned Officer: Mr. Vikram Singh',
                contactPhone: '+91 98765 43212'
            }
        };

        grievanceItems.forEach(item => {
            item.addEventListener('click', function() {
                // Remove active class from all items
                grievanceItems.forEach(i => i.classList.remove('active'));
                // Add active class to clicked item
                this.classList.add('active');
                
                // Get grievance ID
                const grievanceId = this.getAttribute('data-grievance');
                
                // Show grievance details
                noSelectionDiv.classList.add('hidden');
                grievanceDetailsDiv.classList.remove('hidden');
                
                // Update details with grievance data
                if (grievanceData[grievanceId]) {
                    const data = grievanceData[grievanceId];
                    document.getElementById('detail-title').textContent = data.title;
                    document.getElementById('detail-status').textContent = data.status;
                    document.getElementById('detail-status').className = `status-badge status-${data.status.toLowerCase().replace(' ', '')}`;
                    document.getElementById('detail-id').textContent = data.id;
                    document.getElementById('detail-date').textContent = data.date;
                    document.getElementById('detail-department').textContent = data.department;
                    document.getElementById('detail-location').textContent = data.location;
                    document.getElementById('detail-priority').textContent = data.priority;
                    document.getElementById('detail-resolution').textContent = data.resolution;
                    document.getElementById('detail-description').textContent = data.description;
                    document.getElementById('detail-contact-dept').textContent = data.contactDept;
                    document.getElementById('detail-contact-person').textContent = data.contactPerson;
                    document.getElementById('detail-contact-phone').textContent = data.contactPhone;
                }
            });
        });

        // Search functionality
        const searchInput = document.querySelector('input[type="text"]');
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            grievanceItems.forEach(item => {
                const grievanceId = item.getAttribute('data-grievance').toLowerCase();
                const title = item.querySelector('h3').textContent.toLowerCase();
                
                if (grievanceId.includes(searchTerm) || title.includes(searchTerm)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });