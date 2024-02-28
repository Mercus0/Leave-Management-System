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
				<c:choose>
					<c:when test="${item.status eq 'Pending'}">
						<td class="col-2">
							<div class="row">
								<div class="col">
									<form action="/classes/${dto.classInfo.id}/approval"
										method="post">
										<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <input type="hidden" name="action"
											value="Accepted"> <input type="hidden"
											name="targetDate" value="${item.applyDate }"> <input
											type="hidden" name="studentId" value="${item.studentId}">
										<button class="btn btn-outline-success" type="submit">
											 Accept
										</button>
									</form>
								</div>

								<div class="col">
									<form action="/classes/${dto.classInfo.id}/approval" method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<input type="hidden" name="action" value="Denied"> 
										<input type="hidden" name="targetDate"
											value="${item.applyDate }"> <input type="hidden"
											name="studentId" value="${item.studentId}">
										<button class="btn btn-outline-danger" type="submit">
											 Deny
										</button>
									</form>
								</div>
							</div>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<div
								class="badge ${item.status == 'Accepted' ? 'bg-success' : 'bg-danger'}">
								${item.status}
							</div>
						</td>
						<td>
							<form action="/classes/${dto.classInfo.id}/approval" method="post">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
										<input type="hidden" name="action" value="Pending"> 
										<input type="hidden" name="targetDate" value="${item.applyDate}"> 
										<input type="hidden" name="studentId" value="${item.studentId}">
										<button class="btn btn-outline-warning" type="submit">Edit</button>
							</form>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</tbody>
</table>