document.addEventListener('DOMContentLoaded', () => {
			const saveBtn = document.getElementById('saveBtn')
			const saveImageBtn = document.getElementById('saveImageBtn')
			
			if(saveBtn && saveImageBtn) {
				saveBtn.addEventListener('click', () => saveImageBtn.click())
		
			}
		})