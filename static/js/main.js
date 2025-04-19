// Mobile Menu Functionality
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuButton = document.querySelector('.mobile-menu-button');
    const mainNav = document.querySelector('.main-nav');
    
    if (mobileMenuButton && mainNav) {
        mobileMenuButton.addEventListener('click', function() {
            mobileMenuButton.classList.toggle('active');
            mainNav.classList.toggle('active');
            document.body.classList.toggle('menu-open');
        });
    
        // Close menu when clicking on menu items
        const menuLinks = mainNav.querySelectorAll('a');
        menuLinks.forEach(link => {
            link.addEventListener('click', function() {
                mobileMenuButton.classList.remove('active');
                mainNav.classList.remove('active');
                document.body.classList.remove('menu-open');
            });
        });
    }
    
    // Close menu when clicking outside
    document.addEventListener('click', function(event) {
        if (mainNav.classList.contains('active') && 
            !mainNav.contains(event.target) && 
            !mobileMenuButton.contains(event.target)) {
            mobileMenuButton.classList.remove('active');
            mainNav.classList.remove('active');
            document.body.classList.remove('menu-open');
        }
    });
});

// Add smooth scrolling to anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        const targetId = this.getAttribute('href');
        if (targetId !== '#') {
            e.preventDefault();
            const target = document.querySelector(targetId);
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 70, // Adjust for header height
                    behavior: 'smooth'
                });
            }
        }
    });
});

// Add active class to current menu item based on URL
document.addEventListener('DOMContentLoaded', function() {
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.main-nav a');
    
    navLinks.forEach(link => {
        const linkPath = link.getAttribute('href');
        if (currentPath === linkPath || 
            (currentPath.includes(linkPath) && linkPath !== '/')) {
            link.classList.add('active');
        } else if (currentPath === '/' && linkPath === '/') {
            link.classList.add('active');
        }
    });
}); 