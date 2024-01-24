<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class=table table-hover>
	<thead>
		<tr>
			<th>Id</th>
			<th>Registration Date</th>
			<th>Student</th>
			<th>Phone</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td>2022/01/2</td>
			<td>yan naing</td>
			<td>09420220693</td>
			<td>
				<c:url var="edit" value="/classes/registration">
					<c:param name="id" value="0"></c:param>
				</c:url> <a href="${edit}">
				
				<i class="bi bi-pencil me-2"></i>
				</a>
				
				<c:url var="details" value="/classes/registration/1">
				</c:url> <a href="${details}">
				<i class="bi bi-cursor"></i>
				</a>
			</td>
		</tr>
	</tbody>
</table>