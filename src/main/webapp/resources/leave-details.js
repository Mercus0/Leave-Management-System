document.addEventListener('DOMContentLoaded', () => {
	const imageDisplay = document.getElementById('imageDisplay')
	const imageControls = document.getElementsByClassName('img-control')
	
		if(imageDisplay && imageControls) {
		Array.from(imageControls).forEach(image => image.addEventListener('click', () => {
			imageDisplay.src = image.src
		}))
	}
})