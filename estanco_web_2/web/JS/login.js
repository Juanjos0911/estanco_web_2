/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const urlParams = new URLSearchParams(window.location.search);
const isSignUp = urlParams.get('signup');
if (isSignUp) {
    document.getElementById('login-form').classList.remove('active');
    document.getElementById('signup-form').classList.add('active');
}
// Mostrar el formulario de login
function showLogin() {
    document.getElementById('login-form').classList.add('active');
    document.getElementById('signup-form').classList.remove('active');
}

// Mostrar el formulario de sign up
function showSignUp() {
    document.getElementById('signup-form').classList.add('active');
    document.getElementById('login-form').classList.remove('active');
}



// Validación de contraseñas en el formulario de registro
document.getElementById('signup-form').addEventListener('submit', function (event) {
    const password = document.getElementById('contrasena').value;
    const repeatPassword = document.getElementById('contrasena_repetir').value;
    if (password !== repeatPassword) {
        event.preventDefault();
        document.getElementById('formulario_mensaje').innerHTML = '<p><i class="bi bi-exclamation-triangle"></i><b> Error:</b> Las contraseñas no coinciden.</p>';
    }
});
document.getElementById('signup-form').addEventListener('submit', function (event) {

    const fechaNacimiento = new Date(document.getElementById('fechanaci').value);
    const fechaActual = new Date();
    const edad = fechaActual.getFullYear() - fechaNacimiento.getFullYear();
    const mes = fechaActual.getMonth() - fechaNacimiento.getMonth();
    if (mes < 0 || (mes === 0 && fechaActual.getDate() < fechaNacimiento.getDate())) {
        edad--;
    }

    if (edad < 18) {
        event.preventDefault();
        alert('Debes tener al menos 18 años para registrarte.');
    }
});