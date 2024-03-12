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
					<th></th>
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
							      	 <!-- modal button -->
							      <a type="button" data-bs-toggle="modal" data-bs-target="#photoModal" onclick="passParam('${ item.applyDate }','${ item.classId }')"> <i class="bi bi-camera"></i></a>					
							    </c:when>
							    <c:when test="${item.approvalStatus == 'Accepted'}">
							      <span class="badge bg-success">${item.approvalStatus }</span>
							    </c:when>
							    <c:when test="${item.approvalStatus == 'Denied'}">
							      <span class="badge bg-danger">${item.approvalStatus }</span>
							    </c:when>
						  </c:choose>
					</td>
					<td>
					<c:choose>
					    <c:when test="${item.approvalStatus == 'Pending'}">
						    <c:url var="deleteLeave" value="/leaves/delete">
						      	<c:param name="classId" value="${ item.classId }"></c:param>
						      	<c:param name="applyDate" value="${ item.applyDate }"></c:param>
						      </c:url>
						      <a href="${ deleteLeave }" class="bi bi-trash text-danger"></a>
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
	
	<!-- modal -->
	<div class="modal fade" id="photoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Photos</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
			      <div class="modal-body">
			      <div id="display">
						<img class="img-fluid" alt="Mail Picture"
							src="<c:url value='/static/image/mail.png'/>" width="500"
							height="500">
					</div>
					
					<form id="photoUploadForm" class="d-none" action="<c:url value='/leave/images/controller' />" enctype="multipart/form-data" method="post">
						<input path="files" multiple="multiple" type="file" name="file" id="photosInput" />
						<button id="saveImageBtn" type="submit"></button>
					</form>
					
			      </div>
		      <div class="modal-footer justify-content-between">
		      	<button id="cancelButton" type="button" class="btn btn-primary me-2">
								<i class="bi-trash"></i> Cancel</button>
				<div>
				<button id="photosUploadBtn" type="button" class="btn btn-outline-success me-2">
								<i class="bi-camera"></i> Photos</button>
		        <button type="button" class="btn btn-danger" id="saveBtn">Save </button>
				</div>
		      </div>
		    </div>
	  </div>
	</div>
	
<script>
    function passParam(applyDate, classId) {
        var form = document.getElementById('photoUploadForm');
        form.action = "<c:url value='/leave/images/controller' />?applyDate=" + encodeURIComponent(applyDate) + "&classId=" + encodeURIComponent(classId);
    }
</script>

	
	<c:url var="buttonControl" value="/resources/leave-button-control.js"></c:url>
	<script src="${buttonControl}"></script>

	<c:url var="leaveEdit" value="/resources/leave-edit.js"></c:url>
	<script src="${leaveEdit}"></script>
</body>
</html>