document.addEventListener('DOMContentLoaded', () => {
	const home = new URL(document.location)
	const baseUrl = home.origin

	//load categories
	fetch(`${baseUrl}/admin/api/categories`)
		.then(resp => {
			if (resp.ok) {
				return resp.json();
			}
		})
		.then(result => {
			const array = Array.from(result);
			const names = array.map(a => a.name);
			const values = array.map(a => a.count);
			loadCategories(names, values);
		})
})
const loadCategories = (names, values) => {
	const categoryChart = document.getElementById('categoryChart')

	if (categoryChart) {

		new Chart(categoryChart, {
			type: 'pie',
			data: {
				labels: names,
				datasets: [{
					data: values,
					hoverOffset: 4
				}]
			},
			options: {
				plugins: {
					legend: {
						position: 'bottom'
					}
				}
			}
		})
	}
}

