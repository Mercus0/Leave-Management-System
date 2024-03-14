<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div class="d-flex justify-content-between mt-3">
			<h3>Leave Details</h3>
			<!-- Button is here -->
			<div>
				<c:forEach items="${ item }" var="list">
					<c:choose>
					
						<c:when test="${list.status eq 'Pending'}">
						<div class="d-flex justify-content-between">
							<!-- Accept form -->
							<form action="/classes/${list.classId}/approval" method="post">
								<input type="hidden" name="action" value="Accepted"> 
								<input type="hidden" name="targetDate" value="${list.applyDate }">
								<input type="hidden" name="studentId" value="${list.studentId}">
								<button class="btn btn-outline-success" type="submit">
									 <i class="bi bi-check"></i> Accept
								</button>
							</form>
							<!-- Deny form -->
							<div class="ms-1">
								<form action="/classes/${list.classId}/approval" method="post">
								<input type="hidden" name="action" value="Denied"> 
								<input type="hidden" name="targetDate" value="${list.applyDate }"> 
								<input type="hidden" name="studentId" value="${list.studentId}">
								<button class="btn btn-outline-danger" type="submit">
									 <i class="bi bi-x"></i> Deny
								</button>
							</form>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div class="d-flex text-center justify-content-between">
								<div class="badge me-1 ${list.status == 'Accepted' ? 'bg-success' : 'bg-danger'}">
									${list.status}
								</div>
								
								<form action="/classes/${list.classId}/approval" method="post">
									<input type="hidden" name="action" value="Pending"> 
									<input type="hidden" name="targetDate" value="${list.applyDate}"> 
									<input type="hidden" name="studentId" value="${list.studentId}">
									<button class="btn btn-outline-danger" type="submit">
									<i class="bi bi-pencil"></i> Edit</button>
								</form>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
				<div class="row">
					<div class="col-6">
					<div class="card">
						<div class="card-header">
							Leave Information
						</div>
					 
						<div class="card-body">
						<c:forEach items="${ item }" var="list">
						<c:forEach items="${ names }" var="name">
						<div class="row">
							<div class="col mb-3">
								<label for="" class="form-label ">Student Name</label>
								<span class="form-control">${ list.student }</span>
							</div>
							<div class="col mb-3">
								<label for="" class="form-label ">Class Name</label>
								<span class="form-control">${ name.className }</span>
							</div>
						</div>
						
							<div class="mb-3">
								<label for="" class="form-label">Teacher Name</label>
								<span class="form-control">${ name.teacherName }</span>
							</div>
							<div class="row">
								<div class="col mb-3">
								<label for="" class="form-label">Apply Date</label>
								<span class="form-control">${ list.applyDate }</span>
							</div>
							<div class="col mb-3">
								<label for="" class="form-label">Leave Date</label>
								<span class="form-control">${ list.startDate }</span>
							</div>
							</div>
							
							<div class="mb-3">
								<label for="" class="form-label">Days</label>
								<span class="form-control">${ list.days }</span>
							</div>
							<div class="mb-3">
								<label for="" class="form-label">Reason</label>
								<span class="form-control">${ list.reason }</span>
							</div>
							</c:forEach>
							</c:forEach>
						</div>
						 
					</div>
				</div>
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							Images
						</div>
						<div class="card-body">
						<!-- Image Display -->
							<c:forEach items="${item}" var="list">
							    <div class="mb-3">
							        <img id="imageDisplay" src="<c:url value='/images/${list.images[0]}' />" class="img-display" alt="Display Image" width="600" height="auto"/>
							    </div>
							    
							    <!-- Image control -->
							   <c:forEach var="image" items="${list.images}" varStatus="imageLoop">
							        <img src="<c:url value='/images/${image}' />" class="img-control" alt="Control Image ${imageLoop.index + 1}" width="100" height="auto"/>
							    </c:forEach>
							</c:forEach>
						</div>
					</div>
				</div>                                                                                                                                
			</div>
	</div>
	
	<c:url var="leaveDetails" value="/resources/leave-details.js"></c:url>
	<script src="${leaveDetails}"></script>
</body>
</html>