document.addEventListener("DOMContentLoaded", function() {
    // Get the current page name from the URL (e.g., index.jsp, requestLesson.jsp)
    const currentPath = window.location.pathname.split('/').pop() || 'index.jsp'; // Default to index.jsp if path is empty

    // Map page names to their corresponding navbar link elements
    const navLinks = {
        'index.jsp': document.getElementById('homeLink'),
        'requestLesson.jsp': document.getElementById('requestLessonLink'),
        'lessonQueue.jsp': document.getElementById('lessonQueueLink'),
        'login.jsp': document.getElementById('loginLink')
    };

    // Remove 'active' class from all links
    Object.values(navLinks).forEach(link => {
        if (link) {
            link.classList.remove('active');
        }
    });

    // Add 'active' class to the current page's link
    const activeLink = navLinks[currentPath];
    if (activeLink) {
        activeLink.classList.add('active');
        // Ensure the button style is maintained when active
        if (currentPath === 'login.jsp') {
            activeLink.classList.add('btn-primary');
        }
    } else {
        console.warn('No matching navbar link found for path:', currentPath);
    }
});