<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeLeaf.org">
<head>
<meta charset="UTF-8">
<title>Teacher | Home</title>
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
	<c:import url="/jsp/include/navbar.jsp"></c:import>
	<div class="container">
	<c:set var="listCount" value="${fn:length(list)}" />
		<h3 class="my-4">Teacher Home <span class="badge text-bg-danger">${listCount}</span></h3>
		
		<form class="row mb-4">	
			
			<div class="col-auto">
				<input type="date" name="targetDate" class="form-control"
					value="${targetDate}" />
			</div>
			
			<div class="col-auto">
				<button class="btn btn-outline-success" type="submit">
					<i class="bi bi-search"></i> Search
				</button>
			</div>
		</form>
		<div class="row g-3">
		<c:choose>
			<c:when test="${empty list}">
				<div class="alert alert-info">There is no data.</div>
			</c:when>
			<c:otherwise>
				<c:forEach items = "${ list }" var="item">
			<div class="col-4">
				<div class="card">
					<div class="card-body">
						<h4>${ item.teacher }</h4>
						<div class="text-secondary">${item.details }</div>
						<span class="text-secondary">${ item.startDate }</span>
						
						<div class="row mt-4">
							<div class="col-4">
								<h5><i class="bi bi-people"></i> ${ item.students }</h5>
								<span class="text-secondary">Students</span>
							</div>
							
							<div class="col">
								<h5><i class="bi bi-people-fill"></i> ${ item.leaves }</h5>
								<span class="text-secondary">Leaves</span>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col">
							<c:url var="details" value="/classes/${item.classId }">
								<c:param name="targetDate" value="${targetDate}"></c:param>
							</c:url>
								<a href="${details}" class="btn btn-outline-success"><i class="bi bi-send"></i> Show Details</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</body>
</html>