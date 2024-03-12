<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register | Edit</title>
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
		<c:param name="view" value="classes"></c:param>
	</c:import>
	<div class="container">
		<h3 class="my-4">Add New Registration</h3>

			<div class="row">
				<!--  Old Student -->
				<sf:form method="post" modelAttribute="registForm" cssClass="col-6">
					<sf:hidden path="studentId" />
					<sf:hidden path="classId" />
					<sf:hidden path="registDate" />
						<sf:errors path="*">
							<div class="alert alert-info">Please Enter Student Id.</div>
						</sf:errors>
					
					<c:if test="${ not empty alreadyExist }">
						<div class="alert alert-danger">${alreadyExist}</div>
					</c:if>
					
					<c:if test="${ not empty notExist }">
						<div class="alert alert-warning">${notExist}</div>
					</c:if>
					<div class="mb-3">
						<label class="form-label">Student Id</label>
						<sf:input path="realId" placeholder="Enter Student Id"
							cssClass="form-control" />
					</div>
					<div>
						<button class="btn btn-outline-danger" type="submit">
							<i class="bi bi-save"> Save</i>
						</button>
					</div>
				</sf:form>
			</div>
		</div>
		<!-- End -->
</body>
</html>