document.addEventListener('DOMContentLoaded', () => {
    // Show the Bootstrap toast
    var options = {
        animation: true,
        autohide: true,
        delay: 5000 
    };

    var myToast = new bootstrap.Toast(document.getElementById('myToast'));
    myToast.show();
})
