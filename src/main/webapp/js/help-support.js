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

       // FAQ Accordion functionality
       document.querySelectorAll('.faq-question').forEach(question => {
           question.addEventListener('click', () => {
               const answer = question.nextElementSibling;
               const icon = question.querySelector('svg');
               
               // Toggle the open class
               answer.classList.toggle('open');
               
               // Rotate the icon
               icon.classList.toggle('rotate-180');
               
               // Close other open FAQs
               document.querySelectorAll('.faq-question').forEach(otherQuestion => {
                   if (otherQuestion !== question) {
                       const otherAnswer = otherQuestion.nextElementSibling;
                       const otherIcon = otherQuestion.querySelector('svg');
                       otherAnswer.classList.remove('open');
                       otherIcon.classList.remove('rotate-180');
                   }
               });
           });
       });

       // Form submission handling
       document.querySelector('form').addEventListener('submit', function(e) {
           e.preventDefault();
           
           // Get form data
           const formData = new FormData(this);
           const name = formData.get('name');
           const email = formData.get('email');
           const subject = formData.get('subject');
           
           // In a real application, you would send this data to your backend
           // For demonstration, we'll show a success message
           alert(`Thank you, ${name}! Your message has been received. We'll respond to ${email} regarding your ${subject} inquiry within 24 hours.`);
           
           // Reset the form
           this.reset();
       });
       // Go back function
function goBack() {
    if (document.referrer && document.referrer !== window.location.href) {
        window.history.back();
    } else {
        window.location.href = "../index.html"; // Fallback homepage
    }
}