<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Teacher</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="/jsp/include/navbar.jsp">
		<c:param name="view" value="teachers"></c:param>
	</c:import>
	<div class="container">
		<h3 class="my-4">Teacher Management</h3>
		<form class="mb-4 row">
			<div class=col-auto>
				<label for="" class="form-label">Name</label> <input
					class="form-control" type="text" placeholder="Search Name"
					name="name">
			</div>
			<div class=col-auto>
				<label for="" class="form-label">Phone</label> <input
					class="form-control" type="tel" placeholder="Search Phone"
					name="name">
			</div>
			<div class=col-auto>
				<label for="" class="form-label">Email</label> <input
					class="form-control" type="email" placeholder="Search Email"
					name="name">
			</div>
			<div class="col mt-4">
				<button class="btn btn-outline-success me-2" type="submit">
				<i class="bi bi-search"></i>
				Search</button>
				<c:url var="addNew" value="/teachers/edit"></c:url>
				<a class="btn btn-outline-success my-2 my-sm-0" href="${addNew}">
					<i class="bi bi-plus-lg"></i>Add
				</a>
			</div>
		</form>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Assign Date</th>
					<th>Classes</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Yan Naing</td>
					<td>09423031913</td>
					<td>yannaingedu@gmail.com</td>
					<td>2022-09-01</td>
					<td>5</td>
					<td><c:url var="edit" value="/teachers/edit">
							<c:param name="id" value="1"></c:param>
						</c:url> <a href="${edit}"><i class="bi bi-pencil"></i></a></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>