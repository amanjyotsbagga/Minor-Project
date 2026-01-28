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

// Back to top functionality
const backToTopButton = document.getElementById('back-to-top');

window.addEventListener('scroll', function() {
	if (window.pageYOffset > 300) {
		backToTopButton.classList.remove('hidden');
	} else {
		backToTopButton.classList.add('hidden');
	}
});

backToTopButton.addEventListener('click', function() {
	window.scrollTo({
		top: 0,
		behavior: 'smooth'
	});
});

// Table of contents highlighting
const sections = document.querySelectorAll('.content-section h2');
const navLinks = document.querySelectorAll('.toc-link');

window.addEventListener('scroll', function() {
	let current = '';

	sections.forEach(section => {
		const sectionTop = section.offsetTop - 100;
		const sectionHeight = section.clientHeight;
		if (window.pageYOffset >= sectionTop) {
			current = section.getAttribute('id');
		}
	});

	navLinks.forEach(link => {
		link.classList.remove('active');
		if (link.getAttribute('href') === `#${current}`) {
			link.classList.add('active');
		}
	});
});
// Go back function
function goBack() {
	if (document.referrer && document.referrer !== window.location.href) {
		window.history.back();
	} else {
		window.location.href = "../index.html"; // Fallback homepage
	}
}