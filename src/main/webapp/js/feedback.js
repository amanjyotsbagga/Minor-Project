 
 // Mobile menu functionality
        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const sidebar = document.querySelector('.sidebar');
        
            
          

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

        // Feedback Form Functionality
        document.addEventListener('DOMContentLoaded', function() {
            const ratingStars = document.querySelectorAll('.rating-stars input');
            const ratingText = document.getElementById('rating-text');
            const emoji = document.getElementById('emoji');
            const feedbackForm = document.getElementById('feedback-form');
            const successMessage = document.getElementById('success-message');
            const newFeedbackBtn = document.getElementById('new-feedback-btn');
            
            // Rating stars functionality
            ratingStars.forEach(star => {
                star.addEventListener('change', function() {
                    const ratingValue = this.value;
                    updateRatingDisplay(ratingValue);
                });
            });
            
            function updateRatingDisplay(rating) {
                const ratingLabels = {
                    1: { text: "Poor", emoji: "😞" },
                    2: { text: "Fair", emoji: "😐" },
                    3: { text: "Good", emoji: "😊" },
                    4: { text: "Very Good", emoji: "😃" },
                    5: { text: "Excellent", emoji: "🤩" }
                };
                
                ratingText.textContent = ratingLabels[rating].text;
                emoji.textContent = ratingLabels[rating].emoji;
            }
            
            // Form submission
            feedbackForm.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // In a real application, you would send the form data to a server here
                // For this example, we'll just show the success message
                
                // Hide the form
                feedbackForm.style.display = 'none';
                
                // Show success message
                successMessage.style.display = 'block';
                
                // Scroll to success message
                successMessage.scrollIntoView({ behavior: 'smooth' });
            });
            
            // New feedback button
            newFeedbackBtn.addEventListener('click', function() {
                // Reset form
                feedbackForm.reset();
                feedbackForm.style.display = 'block';
                successMessage.style.display = 'none';
                
                // Reset rating display
                ratingText.textContent = "Select a rating";
                emoji.textContent = "😊";
                
                // Scroll to top of form
                feedbackForm.scrollIntoView({ behavior: 'smooth' });
            });
        });