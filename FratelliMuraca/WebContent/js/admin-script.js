// script.js

// Get the container element and header element
const container = document.getElementById('login-container');
const header = document.getElementById('login-header');

let isDragging = false;
let initialX;
let initialY;

// Function to handle mouse down event on header (start dragging)
header.addEventListener('mousedown', function(e) {
    isDragging = true;
    initialX = e.clientX - container.getBoundingClientRect().left;
    initialY = e.clientY - container.getBoundingClientRect().top;
});

// Function to handle mouse move event (dragging)
document.addEventListener('mousemove', function(e) {
    if (isDragging) {
        const offsetX = e.clientX - initialX;
        const offsetY = e.clientY - initialY;
        container.style.left = offsetX + 'px';
        container.style.top = offsetY + 'px';
    }
});

// Function to handle mouse up event (stop dragging)
document.addEventListener('mouseup', function() {
    isDragging = false;
});
