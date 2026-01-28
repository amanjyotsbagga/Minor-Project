// Update datetime
function updateDateTime() {
    const now = new Date();
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const dateString = now.toLocaleDateString('en-IN', options);
    const timeString = now.toLocaleTimeString('en-IN', { hour: '2-digit', minute: '2-digit', hour12: true });
    
    // Add a check to make sure the element exists before trying to update it
    const datetimeElement = document.getElementById('datetime');
    if (datetimeElement) {
        datetimeElement.textContent = `${dateString} | ${timeString} IST`;
    }
}

// Run the function immediately
updateDateTime();
// And then run it every minute
setInterval(updateDateTime, 60000);

// Go back function
function goBack() {
    if (document.referrer && document.referrer !== window.location.href) {
        window.history.back();
    } else {
        window.location.href = "../index.html"; // Fallback homepage
    }
}