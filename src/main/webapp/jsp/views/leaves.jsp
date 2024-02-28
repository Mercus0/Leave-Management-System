<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Leaves</title>
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
		<c:param name="view" value="leaves"></c:param>
	</c:import>
	
	<div class="container">
		<h3 class="my-4">Leaves Details</h3>
		
		<form class="row mb-4">
			<div class="col-auto">
				<label class="form-label">Class Name</label>
				<input type="text" placeholde="search" class="form-control" name="className" />
			</div>
			
			<div class="col-auto">
				<label class="form-label">Teacher Name</label>
				<input type="text" placeholde="search" class="form-control" name="teacherName" />
			</div>
			
			<div class="col-auto">
				<label class="form-label">Apply Date</label>
				<input type="date" name="applyDate" class="form-control" />
			</div>
			
			<div class="col-auto">
				<label class="form-label">Start Date</label>
				<input type="date" class="form-control" name="startDate"/>
			</div>
			
			
			
			<div class="col mt-4">
				<button class="btn btn-outline-success me-2"><i class="bi bi-search"></i>Search</button>
			</div>
		</form>
		
		<c:choose>
			<c:when test="${ empty list }">
				<div class="alert alert-info">There is no leaves for you.</div>
			</c:when>
			<c:otherwise>
				<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>Class Name</th>
					<th>Teacher Name</th>
					<th>Apply Date</th>
					<th>Leave Date</th>
					<th>Days</th>
					<th>Reason</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="item" varStatus="status">
			<c:set var="counter" value="${status.index + 1}"/>
				<tr>
					<td><c:out value="${counter}"/></td>
					<td>${item.details }</td>
					<td>${item.teacher }</td>
					<td>${item.applyDate }</td>
					<td>${item.startDate }</td>
					<td><span class="badge bg-danger">${item.days}</span></td>
					<td>${item.reason }</td>
					<td>
						  <c:choose>
							    <c:when test="${item.approvalStatus == 'Pending'}">
							      <span class="badge bg-secondary">${item.approvalStatus }</span>
							    </c:when>
							    <c:when test="${item.approvalStatus == 'Accepted'}">
							      <span class="badge bg-success">${item.approvalStatus }</span>
							    </c:when>
							    <c:when test="${item.approvalStatus == 'Denied'}">
							      <span class="badge bg-danger">${item.approvalStatus }</span>
							    </c:when>
						  </c:choose>
					</td>
				</tr>
			</c:forEach>
				
			</tbody>
		</table>
			</c:otherwise>
		</c:choose>
		
		
	</div>
</body>
</html>