

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

        // PDF Generation
        document.getElementById('download-pdf').addEventListener('click', function() {
            // Show loading state
            const button = this;
            const originalText = button.innerHTML;
            button.innerHTML = '<span>Generating PDF...</span>';
            button.disabled = true;
            
            // Use html2canvas and jsPDF to generate PDF
            const { jsPDF } = window.jspdf;
            
            // Capture the content
            const element = document.getElementById('terms-content');
            
            html2canvas(element, {
                scale: 2,
                useCORS: true,
                logging: false
            }).then(canvas => {
                const imgData = canvas.toDataURL('image/png');
                const pdf = new jsPDF('p', 'mm', 'a4');
                const imgWidth = 190;
                const pageHeight = 295;
                const imgHeight = canvas.height * imgWidth / canvas.width;
                let heightLeft = imgHeight;
                let position = 10;
                
                pdf.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
                
                // Add additional pages if needed
                while (heightLeft >= 0) {
                    position = heightLeft - imgHeight + 10;
                    pdf.addPage();
                    pdf.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
                    heightLeft -= pageHeight;
                }
                
                // Add header with title
                pdf.setFontSize(16);
                pdf.setTextColor(30, 58, 138);
                pdf.text('Setu - Terms of Service', 105, 15, { align: 'center' });
                
                // Add footer
                const pageCount = pdf.internal.getNumberOfPages();
                for (let i = 1; i <= pageCount; i++) {
                    pdf.setPage(i);
                    pdf.setFontSize(10);
                    pdf.setTextColor(100, 100, 100);
                    pdf.text(`Page ${i} of ${pageCount}`, 105, 287, { align: 'center' });
                    pdf.text('Government of India - Setu Grievance Redressal Portal', 105, 292, { align: 'center' });
                }
                
                // Save the PDF
                pdf.save('Setu_Terms_of_Service.pdf');
                
                // Reset button
                button.innerHTML = originalText;
                button.disabled = false;
            }).catch(error => {
                console.error('Error generating PDF:', error);
                alert('Error generating PDF. Please try again.');
                button.innerHTML = originalText;
                button.disabled = false;
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