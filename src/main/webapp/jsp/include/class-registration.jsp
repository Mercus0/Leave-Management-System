<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover custom-table-blue">
	<thead>
		<tr>
			<th>Registration Date</th>
			<th>Student</th>
			<th>Phone</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${dto.registrations }" var="item">
		<tr>
			<td>${item.registrationDate }</td>
			<td>${item.student }</td>
			<td>${item.studentPhone }</td>
			<td>
				<c:url var="details" value="/classes/registration/${item.classId }/${item.studentId }">
				</c:url> 
					<a href="${details}">
					<i class="bi bi-cursor bg-blue"></i>
				</a>
			</td>
		</tr>
	</c:forEach>	
	</tbody>
</table>