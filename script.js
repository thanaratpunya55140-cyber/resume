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

    // Select elements to animate
    const animateElements = document.querySelectorAll('.glass-card, .section-title, .hero-content, .info-step, .obj-mini-card, .formula-card, .e-step, .tag');

    animateElements.forEach(el => {
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
    // Modal Logic
    const openModalBtn = document.getElementById('open-research-modal');
    const closeModalBtn = document.querySelector('.modal-close');
    const modal = document.getElementById('research-modal');

    if (openModalBtn && modal) {
        openModalBtn.addEventListener('click', () => {
            modal.classList.add('active');
            document.body.classList.add('modal-open');
        });

        const closeModal = () => {
            modal.classList.remove('active');
            document.body.classList.remove('modal-open');
        };

        closeModalBtn.addEventListener('click', closeModal);

        // Close on clicking outside
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                closeModal();
            }
        });

        // Close on ESC key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && modal.classList.contains('active')) {
                closeModal();
            }
        });
    }
});
