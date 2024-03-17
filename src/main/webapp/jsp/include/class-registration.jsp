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
				<c:url var="edit" value="/classes/registration">
					<c:param name="classId" value="${item.classId }"></c:param>
					<c:param name="studentId" value="${item.studentId }"></c:param>
					<c:param name="teacherName" value="${item.teacher }"></c:param>
					<c:param name="startDate" value="${item.startDate }"></c:param>
				</c:url> 
				<a href="${edit}">
				<i class="bi bi-pencil bg-blue me-2"></i>
				</a>
				
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