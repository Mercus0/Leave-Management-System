<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Classes</title>
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
</head>
<body>
	<c:import url="/jsp/include/navbar.jsp">
		<c:param name="view" value="classes"></c:param>
	</c:import>

	<div class="container">
		<h3 class="my-4">Class Management</h3>

		<form class="row mb-4">
			<div class="col-auto">
				<label class="form-label">Name</label>
				<input type="text" value="${ param.teacher }" placeholde="search" class="form-control" name="teacher" />
			</div>
			
			<div class="col-auto">
				<label class="form-label">From</label>
				<input type="date" name="from" value="${ param.from } placeholde="search" class="form-control" />
			</div>
			<div class="col-auto">
				<label class="form-label">To</label>
				<input type="date" placeholde="search" class="form-control" name="to" value="${ param.to }"/>
			</div>
			
			<div class="col">
				<button class="btn btn-outline-success me-2"><i class="bi bi-search"></i>Search</button>
				<c:url var="addNew" value="/classes/edit"></c:url>
				<a href="${addNew}" class="btn btn-outline-danger"><i class="bi bi-plus-lg"></i>Add New</a>
			</div>
		</form>
		<c:choose>
			<c:when test="${ empty list }">
				<div class="alert alert-info">There is no data.</div>
			</c:when>
			<c:otherwise>
				<table class="table table-hover">
			<thead>
				<tr>
					<td>Id</td>
					<td>Teacher Name</td>
					<td>Teacher Phone</td>
					<td>Start Date</td>
					<td>Months</td>
					<td>Description</td>
					<td>Student count</td>
					<td>Actions</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="item">
			
			
			</c:forEach>
				<tr>
					<td>${ item.id }</td>
					<td>${ item.teacherName}</td>
					<td>${ item.teacherPhone}</td>
					<td>${ item.startDate}</td>
					<td>${ item.month}</td>
					<td>${ item.description}</td>
					<td>${ item.studentCount }</td>
					<td>
						<c:url var="edit" value="/classes/edit">
							<c:param name="id" value="${ item.id }"></c:param>
						</c:url>
						<a href="${edit}"><i class="bi bi-pencil me-3"></i></a>
						
						<c:url var="details" value="/classes/${item.id}">
						</c:url>
							<a href="${details}"><i class="bi bi-cursor"></i></a>
					</td>
				</tr>
			</tbody>
		</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>