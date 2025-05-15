function validateForm() {
    let isValid = true;

    // Admin ID
    const id = document.getElementById('id');
    const idError = document.getElementById('idError');
    const idPattern = /^[a-zA-Z0-9]+$/;
    if (!id.value.trim() || !idPattern.test(id.value)) {
        id.classList.add('error');
        idError.style.display = 'block';
        isValid = false;
    } else {
        id.classList.remove('error');
        idError.style.display = 'none';
    }

    // Full Name
    const name = document.getElementById('name');
    const nameError = document.getElementById('nameError');
    if (!name.value.trim()) {
        name.classList.add('error');
        nameError.style.display = 'block';
        isValid = false;
    } else {
        name.classList.remove('error');
        nameError.style.display = 'none';
    }

    // Email
    const email = document.getElementById('email');
    const emailError = document.getElementById('emailError');
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email.value.trim() || !emailPattern.test(email.value)) {
        email.classList.add('error');
        emailError.style.display = 'block';
        isValid = false;
    } else {
        email.classList.remove('error');
        emailError.style.display = 'none';
    }

    // Password
    const password = document.getElementById('password');
    const passwordError = document.getElementById('passwordError');
    const passwordPattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
    if (!password.value.trim() || !passwordPattern.test(password.value)) {
        password.classList.add('error');
        passwordError.style.display = 'block';
        isValid = false;
    } else {
        password.classList.remove('error');
        passwordError.style.display = 'none';
    }

    return isValid;
}