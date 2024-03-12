<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover text-center">
	<thead>
		<tr>
			<th>Student</th>
			<th>Phone</th>
			<th>Apply Date</th>
			<th>Leave Start</th>
			<th>Leave Days</th>
			<th>Reason</th>
			<th>Status</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${dto.leaves}" var="item">
			<tr>
				<td>${item.student}</td>
				<td>${item.studentPhone}</td>
				<td>${item.applyDate}</td>
				<td>${item.startDate}</td>
				<td>${item.days}</td>
				<td>${item.reason}</td>
				<td>
					<c:choose>
					    <c:when test="${item.status == 'Pending'}">
					      <span class="badge bg-secondary">${item.status }</span>
					    </c:when>
					    <c:when test="${item.status == 'Accepted'}">
					      <span class="badge bg-success">${item.status }</span>
					    </c:when>
					    <c:when test="${item.status == 'Denied'}">
					      <span class="badge bg-danger">${item.status }</span>
					    </c:when>
				  </c:choose>
				</td>
				<td>
				<c:url var="leaveDetails" value="/classes/leaves/details">
					<c:param name="applyDate" value="${ item.applyDate }"></c:param>
					<c:param name="classId" value="${ item.classId }"></c:param>
					<c:param name="studentId" value="${ item.studentId }"></c:param>
				</c:url> 
					<a href="${leaveDetails}">
					<i class="bi bi-cursor"></i>
				</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>