<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<c:url var="adminHome" value="/resources/admin-home.css"></c:url>
<link rel="stylesheet" href="${adminHome}" type="text/css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap">
</head>
<body>
	<c:import url="/jsp/include/navbar.jsp">
		<c:param name="view" value="classes"></c:param>
	</c:import>
		<div class="container">
		<h3 class="mt-4"><i class="bi bi-bar-chart"></i> Dashboard</h3>
			<div class="row">
				<div class="col-3">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title text-center">Classrooms</h4>
							<canvas id="categoryChart"></canvas>
						</div>
					</div>
					<ul id="topLeaveStudents" class="list-group mt-4">
						<li class="list-group-item bg-blue">Top Leaves Students</li>
					</ul>
				</div>
				<div class="col-9">
				<!-- Post Summary -->
				<div class="card">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<h4 class="card-title">Leaves</h4>
							<div class="row gx-2">
								<div class="col-auto">
									<select id="searchType" class="form-select">
										<option value="month">Monthly</option>
										<option value="year">Yearly</option>
									</select>
								</div>
								<div class="col-auto">
									<select id="searchYear" class="form-select">
										<c:forEach var="year" items = "${ years }">
											<option value="${ year }" ${ year == currentYear ? 'selected' : '' }>${ year }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-auto">
									<select id="searchMonth" class="form-select">
										<c:forEach var="month" items="${ months }">
											<option value="${ month }" ${ month == currentMonth ? 'selected' : '' }>${ month }</option>	
										</c:forEach>
									</select>
								</div>
							</div>
						</div>	
						<!-- Bar Chart -->
						<canvas id="postChart"></canvas>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
			<c:url var="adminHome" value="/resources/admin-home.js"></c:url>
		<script src="${adminHome}"></script>
</body>
</html>