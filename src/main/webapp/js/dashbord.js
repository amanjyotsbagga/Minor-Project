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