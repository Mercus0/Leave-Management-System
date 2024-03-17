document.addEventListener('DOMContentLoaded', () => {
	const home = new URL(document.location)
	const baseUrl = home.origin

	//load categories chart
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
		
		//load lop leaves
		fetch(`${baseUrl}/admin/api/top-leaves`).then(resp => {
			if(resp.ok){
				return resp.json()
			}
		}).then(result => loadTopLeaves(result))
		
		loadPostData()	
})

//load top leaves students
const loadTopLeaves = users => {
	const topTenStudents = document.getElementById('topLeaveStudents')
	Array.from(users).forEach(user => {
		let item = document.createElement('li')
		item.classList.add('list-group-item')
		item.innerText = user.name
		topTenStudents.appendChild(item)
	})
}

//load Post Data
const loadPostData = () =>{
	const searchType = document.getElementById('searchType')
	const searchYear = document.getElementById('searchYear')
	const searchMonth = document.getElementById('searchMonth')
	
	function loadChart(){
		const type = searchType.value
		if(type == 'year'){
			loadForYear(searchYear.value)
		}else{
			loadForMonth(searchYear.value,searchMonth.value)
		}
	}
	
	searchType.addEventListener('change',() => {
		const type = searchType.value 
		if(type == 'year'){
			searchMonth.classList.add('d-none')
		}else{
			searchMonth.classList.remove('d-none')
			initMonth(searchMonth)
		}
		loadChart()
	})
	
	searchYear.addEventListener('change',() => {
		//reset Month to jan
		initMonth(searchMonth)
		
		//load data according to search type
		loadChart()
	})
	
	searchMonth.addEventListener('change',() => {
		loadChart()
	})
	
	loadChart()
}

//init month
const initMonth = select => {
	let array = Array.from(select.children)
	array[0].selected = true
}

const loadForMonth = (year,month) => {
	const home = new URL(document.location)
	const baseUrl = home.origin
	
	var queryString = `${encodeURIComponent('year')}=${encodeURIComponent(year)}&${encodeURIComponent('month')}=${encodeURIComponent(month)}`
	
	fetch(`${baseUrl}/admin/api/post/month?${queryString}`).then(resp => {
		if(resp.ok){
			return resp.json()
		}
	}).then(result => {
		const array = Array.from(result)
		const names = array.map(a => a.name)
		const values = array.map(a => a.count)
		loadChartData(names,values)
	})
}

const loadForYear = (year) =>{
	const home = new URL(document.location)
	const baseUrl = home.origin
	
	var queryString = `${encodeURIComponent('year')}=${encodeURIComponent(year)}`
	fetch(`${baseUrl}/admin/api/post/year?${queryString}`).then(resp => {
		if(resp.ok){
			return resp.json()
		}
	}).then(result => {
		const array = Array.from(result)
		const names = array.map(a => a.name)
		const values = array.map(a => a.count)
		loadChartData(names,values)
	})
	
}

//Category Chart
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
						position: 'bottom',
							labels:{
								color: 'white'
							}
					}
				}
			}
		})
	}
}

let barChart = undefined
const loadChartData = (names, values) => {
	
	let chartData = {
		labels: names,
		datasets: [{
			label: "Leave Count",
			data: values,
			hoverOffset: 4,
			backgroundColor: '#e9b563'
		}]			
	}
	
	if(barChart) {
		barChart.data = chartData
		barChart.update()
	} else {
		const postChart = document.getElementById('postChart')
		
		if(postChart) {
			barChart = new Chart(postChart, {
				type: 'bar',
				data: chartData,
				options: {
					plugins: {
						legend: {
							position: 'bottom',
							labels:{
								color: 'white'
							}
						}
					},
					scales:{
						x:{
							ticks:{
								color: 'white'
							}
						},
						y:{
							ticks:{
								color: 'white'
							}
						}
					}
				}
			})	
		}		
	}
	
}



