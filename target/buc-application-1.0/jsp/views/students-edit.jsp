<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Classes</title>
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
		<h3 class="my-4">Edit Student</h3>
		<div class="row">
			<c:url value="/students/edit" var="save"></c:url>
			<sf:form method="post" action="${save}" modelAttribute="form"
				cssClass="col-lg-6 col-md-9 col-sm-12">

				<sf:errors path="*" cssClass="alert alert-warning" element="div"></sf:errors>

				<sf:hidden path="id" />
				
				<div class="mb-3">
					<label class="form-label">Id</label>
					<sf:input path="realId" placeholder="Enter Student Id" type="text"
						cssClass="form-control" />
				</div>

				<div class="mb-3">
					<label class="form-label">Name</label>
					<sf:input path="name" placeholder="Enter Student Name" type="text"
						cssClass="form-control" />
				</div>
				
				<div class="mb-3">
					<label class="form-label">Phone</label>
					<sf:input path="phone" type="tel" placeholder="Enter Student Phone"
						cssClass="form-control" />
				</div>

				<div class="mb-3">
					<label class="form-label">Email</label>
					<sf:input path="email" type="email" placeholder="Enter Student email" cssClass="form-control" />
				</div>
				
				<div class="mb-3">
					<label for="" class="form-label">Gender</label> 
					<select
						name="gender" class="form-select">
						<option value="Male">Male</option>
						<option value="Female">Female</option>
					</select>
				</div>
				
				<div class="mb-3">
					<label class="form-label">Address</label>
					<sf:input path="address" type="text"
						placeholder="Enter Student address" cssClass="form-control" />
				</div>

				<div class="mb-3">
					<label class="form-label">Education</label> <select
						name="education" class="form-select">
						<option value="HDIT">HDIT</option>
						<option value="Business">Business</option>
						<option value="Foundation">Foundation</option>
						<option value="EAP">EAP</option>
					</select>
				</div>
				
				<div class="mb-3">
					<label class="form-label">Assign Date</label>
					<sf:input path="assignDate" type="date" cssClass="form-control" />
				</div>
				
				<div>
					<button class="btn btn-outline-danger" type="submit">
						<i class="bi bi-save"></i> Save
					</button>
				</div>
			</sf:form>
		</div>
	</div>
</body>
</html>