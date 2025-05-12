// Validate form date and time in requestLesson.jsp
function validateForm() {
    const dateInput = document.getElementById('date');
    const timeInput = document.getElementById('time');
    const selectedDate = new Date(dateInput.value);
    const selectedTime = timeInput.value;

    const [hours, minutes] = selectedTime.split(':').map(Number);
    selectedDate.setHours(hours, minutes, 0, 0);

    const today = new Date();
    const now = new Date();
    today.setHours(0, 0, 0, 0);

    if (selectedDate < today) {
        alert('Please select a date starting from today or later.');
        return false;
    }

    if (selectedDate.getTime() === today.getTime() && selectedDate < now) {
        alert('Please select a time in the future for today\'s date.');
        return false;
    }

    return true;
}

// Validate update form date and time in lessonQueue.jsp
function validateUpdateForm(lessonId) {
    const dateInput = document.getElementById(`date-${lessonId}`);
    const timeInput = document.getElementById(`time-${lessonId}`);
    const selectedDate = new Date(dateInput.value);
    const selectedTime = timeInput.value;

    const [hours, minutes] = selectedTime.split(':').map(Number);
    selectedDate.setHours(hours, minutes, 0, 0);

    const today = new Date();
    const now = new Date();
    today.setHours(0, 0, 0, 0);

    if (selectedDate < today) {
        alert('Please select a date starting from today or later.');
        return false;
    }

    if (selectedDate.getTime() === today.getTime() && selectedDate < now) {
        alert('Please select a time in the future for today\'s date.');
        return false;
    }

    return true;
}