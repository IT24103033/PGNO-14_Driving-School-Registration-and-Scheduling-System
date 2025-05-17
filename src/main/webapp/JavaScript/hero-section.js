<!-- JavaScript for Image Slider -->

    document.addEventListener('DOMContentLoaded', function() {
    // Get all slides, dots and navigation arrows
    const slides = document.querySelectorAll('.slide');
    const dots = document.querySelectorAll('.slider-dot');
    const prevArrow = document.querySelector('.slider-arrow.prev');
    const nextArrow = document.querySelector('.slider-arrow.next');
    let currentSlide = 0;
    let slideInterval;

    // Function to change slide
    function showSlide(index) {
    // Reset the index if it's out of bounds
    if (index >= slides.length) {
    index = 0;
} else if (index < 0) {
    index = slides.length - 1;
}

    // Hide all slides
    slides.forEach(slide => slide.classList.remove('active'));
    dots.forEach(dot => dot.classList.remove('active'));

    // Show the selected slide
    slides[index].classList.add('active');
    dots[index].classList.add('active');
    currentSlide = index;
}

    // Function to move to the next slide
    function nextSlide() {
    showSlide(currentSlide + 1);
}

    // Function to move to the previous slide
    function prevSlide() {
    showSlide(currentSlide - 1);
}

    // Add click events to dots
    dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
    showSlide(index);
    resetInterval(); // Reset the auto-rotation when manually changing
});
});

    // Add click events to arrows
    if (nextArrow) {
    nextArrow.addEventListener('click', () => {
    nextSlide();
    resetInterval(); // Reset the auto-rotation when manually changing
});
}

    if (prevArrow) {
    prevArrow.addEventListener('click', () => {
    prevSlide();
    resetInterval(); // Reset the auto-rotation when manually changing
});
}

    // Function to reset the interval timer
    function resetInterval() {
    clearInterval(slideInterval);
    startInterval();
}

    // Function to start auto-rotation
    function startInterval() {
    slideInterval = setInterval(nextSlide, 5000); // Change slide every 5 seconds
}

    // Initialize the auto-rotation
    startInterval();

    // Add keyboard navigation
    document.addEventListener('keydown', function(e) {
    if (e.key === 'ArrowLeft') {
    prevSlide();
    resetInterval();
} else if (e.key === 'ArrowRight') {
    nextSlide();
    resetInterval();
}
});

    // Pause slider on hover
    const heroSection = document.querySelector('.hero-section');
    if (heroSection) {
    heroSection.addEventListener('mouseenter', () => {
    clearInterval(slideInterval);
});

    heroSection.addEventListener('mouseleave', () => {
    startInterval();
});
}
});