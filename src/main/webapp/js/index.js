document.addEventListener('DOMContentLoaded', function() {
            // Mobile Menu Toggle
            const mobileMenuButton = document.getElementById('mobile-menu-button');
            const mobileMenu = document.getElementById('mobile-menu');
            mobileMenuButton.addEventListener('click', () => {
                mobileMenu.classList.toggle('hidden');
            });

            // Hero parallax effect from prototype 1
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

            // Card glow effect from prototype 1
            const cards = document.querySelectorAll('.card-glow');
            cards.forEach(card => {
                card.addEventListener('mousemove', e => {
                    const rect = card.getBoundingClientRect();
                    card.style.setProperty('--x', e.clientX - rect.left + 'px');
                    card.style.setProperty('--y', e.clientY - rect.top + 'px');
                });
            });

            // Process line animation from prototype 1 - ADJUSTED FOR LEFT SIDE
            const processLine = document.getElementById('process-line-progress');
            const processSteps = document.querySelectorAll('.process-step');
            if(processLine) {
                const observer = new IntersectionObserver(entries => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const step = entry.target;
                            const stepNumber = parseInt(step.dataset.step);
                            const progress = (stepNumber / processSteps.length) * 100;
                            processLine.style.height = `${progress}%`;
                            
                            processSteps.forEach(s => {
                                if(parseInt(s.dataset.step) <= stepNumber) {
                                    s.classList.add('active');
                                } else {
                                    s.classList.remove('active');
                                }
                            });
                        }
                    });
                }, { threshold: 0.8 });

                processSteps.forEach(step => observer.observe(step));
            }

            // Animated Statistics Counter from prototype 2
            const counters = document.querySelectorAll('.statistic-card h3');
            const speed = 200; // The lower the #, the faster the count

            const observer = new IntersectionObserver(entries => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const counter = entry.target;
                        const animate = () => {
                            const target = +counter.getAttribute('data-target');
                            const count = +counter.innerText;
                            const inc = target / speed;

                            if (count < target) {
                                counter.innerText = Math.ceil(count + inc);
                                setTimeout(animate, 20);
                            } else {
                                counter.innerText = target.toLocaleString('en-IN');
                            }
                        };
                        animate();
                        observer.unobserve(counter); // Stop observing once animated
                    }
                });
            }, { threshold: 0.5 });

            counters.forEach(counter => {
                observer.observe(counter);
            });

            // ScrollReveal animations
            const sr = ScrollReveal({
                distance: '50px',
                duration: 1500,
                delay: 200,
                reset: false,
                viewFactor: 0.2,
            });

            sr.reveal('.reveal-up', { origin: 'bottom', interval: 100 });
            sr.reveal('.reveal-right', { origin: 'left' });
            sr.reveal('.reveal-card', { origin: 'bottom', interval: 150 });
            
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
                const formattedDate = formatter.format(now) + ' IST | Indore, Madhya Pradesh';
                document.getElementById('datetime').textContent = formattedDate;
            }
            
            updateDateTime();
            setInterval(updateDateTime, 60000); // Update every minute

            // Initialize Live Map
            function initMap() {
                // Initialize the map centered on India
                const map = L.map('map').setView([20.5937, 78.9629], 5);
                
                // Add OpenStreetMap tiles
                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                }).addTo(map);
                
                // Sample grievance data with coordinates across India
                const grievanceData = [
                    { lat: 28.6139, lng: 77.2090, status: 'new', title: 'Water Supply Issue', description: 'Irregular water supply in Delhi area' },
                    { lat: 19.0760, lng: 72.8777, status: 'under-review', title: 'Road Repair', description: 'Potholes on main road in Mumbai' },
                    { lat: 12.9716, lng: 77.5946, status: 'resolved', title: 'Garbage Collection', description: 'Garbage not collected for 3 days in Bengaluru' },
                    { lat: 22.5726, lng: 88.3639, status: 'closed', title: 'Street Light Repair', description: 'Street light not working in Kolkata' },
                    { lat: 13.0827, lng: 80.2707, status: 'new', title: 'Public Toilet Maintenance', description: 'Public toilet in Chennai needs cleaning' },
                    { lat: 26.9124, lng: 75.7873, status: 'under-review', title: 'Electricity Problem', description: 'Frequent power cuts in Jaipur' },
                    { lat: 17.3850, lng: 78.4867, status: 'resolved', title: 'Drainage Issue', description: 'Blocked drainage in Hyderabad' },
                    { lat: 23.0225, lng: 72.5714, status: 'new', title: 'Public Park Maintenance', description: 'Grass needs cutting in Ahmedabad park' }
                ];
                
                // Define colors for different statuses
                const statusColors = {
                    'new': '#F97316',
                    'under-review': '#1E3A8A',
                    'resolved': '#059669',
                    'closed': '#6B7280'
                };
                
                // Add markers for each grievance
                grievanceData.forEach(grievance => {
                    const marker = L.circleMarker([grievance.lat, grievance.lng], {
                        color: statusColors[grievance.status],
                        fillColor: statusColors[grievance.status],
                        fillOpacity: 0.7,
                        radius: 8
                    }).addTo(map);
                    
                    // Add popup with grievance details
                    marker.bindPopup(`
                        <div class="p-2">
                            <h4 class="font-bold">${grievance.title}</h4>
                            <p class="text-sm">${grievance.description}</p>
                            <div class="mt-2 flex items-center">
                                <div class="w-3 h-3 rounded-full mr-2" style="background-color: ${statusColors[grievance.status]}"></div>
                                <span class="text-xs capitalize">${grievance.status.replace('-', ' ')}</span>
                            </div>
                        </div>
                    `);
                });
            }
            
            // Initialize the map when the page loads
            initMap();
        });