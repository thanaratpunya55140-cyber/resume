document.addEventListener('DOMContentLoaded', () => {

    // Smooth Scrolling for Nav Links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));

            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Intersection Observer for Fade-in Animations
    const observerOptions = {
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Observe all elements with fade-in-up class
    const fadeElements = document.querySelectorAll('.fade-in-up, .info-step, .info-card, .nuclear-intro-card, .energy-card, .plant-card, .pro-card, .con-card, .barrier-card, .waste-step, .history-card, .impact-card, .lab-section-block, .prop-card, .recommendation-card');
    fadeElements.forEach(el => {
        // Set initial state
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.8s ease-out, transform 0.8s ease-out';

        // Observe
        observer.observe(el);
    });

    // Paradise Cloud Parallax (Optional - subtle mouse movement)
    document.addEventListener('mousemove', (e) => {
        const x = e.clientX / window.innerWidth;
        const y = e.clientY / window.innerHeight;

        document.querySelectorAll('.cloud').forEach((cloud, index) => {
            const speed = (index + 1) * 20;
            const xOffset = (window.innerWidth / 2 - e.clientX) / speed;
            const yOffset = (window.innerHeight / 2 - e.clientY) / speed;

            // Apply translation on top of the float animation
            // Using margin instead of transform to avoid conflict with keyframes
            cloud.style.marginLeft = `${xOffset}px`;
            cloud.style.marginTop = `${yOffset}px`;
        });
    });

});
