document.addEventListener('DOMContentLoaded', () => {
	
    document.getElementById('logoutMenu').addEventListener('click', (event) => {
        event.preventDefault();
        document.getElementById('logoutForm').submit();
    });
});



