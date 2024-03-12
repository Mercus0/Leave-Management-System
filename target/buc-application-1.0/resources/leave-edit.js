document.addEventListener("DOMContentLoaded", () => {
	
	const photosUploadBtn = document.getElementById('photosUploadBtn')
	const photosInput = document.getElementById('photosInput')
	const display = document.getElementById('display')
	const photosUploadForm = document.getElementById('photoUploadForm')
	const cancelButton = document.getElementById('cancelButton');
	
	const readFile = (file, imgClass) => {
		
		let column = document.createElement('div')
		column.classList.add('col')
		
		let imageTag = document.createElement('img')
		imageTag.classList.add(imgClass)
		
		column.append(imageTag)
		
		let reader = new FileReader()
		
		reader.onload = event => {
			imageTag.src = event.target.result
			imageTag.style.maxWidth='300px'
		}
		
		reader.readAsDataURL(file)
		
		return column
	}
	
	if(photosUploadBtn && photosInput && display) {
		
		photosUploadBtn.addEventListener('click', () => photosInput.click())
		photosInput.addEventListener('change', event => {

			display.classList = []
			display.innerHTML = ''
			
			display.classList.add('row')
			
			const files = event.target.files
			
			let imgClass = 'img-single'
			
			if(files.length <= 1) {
				display.classList.add('row-cols-1')
			} else if(files.length > 1 && files.length <= 4){
				display.classList.add('row-cols-2')
				display.classList.add('g-3')
				imgClass = 'img-grid'
			} else {
				display.classList.add('row-cols-3')
				display.classList.add('g-3')
				imgClass = 'img-grid'
			}
			
			for(let i = 0; i < files.length; i ++) {
				let image = readFile(files[i], imgClass)
				display.appendChild(image)
			}
		})
	}
	cancelButton.addEventListener('click', () => {
            display.innerHTML = '';
            addDefaultImage();
        });
        
        const addDefaultImage = () => {
        const defaultImage = document.createElement('img');
        defaultImage.classList.add('img-fluid');
        defaultImage.alt = 'Mail Picture';
        defaultImage.src = '/static/image/mail.png';
        defaultImage.width = 500;
        defaultImage.height = 500;

        display.innerHTML = '';
        display.appendChild(defaultImage);
    };
})