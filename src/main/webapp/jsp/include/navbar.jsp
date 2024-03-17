<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:url var="chart" value="/admin/home"></c:url>
<c:url var="home" value="/home"></c:url>
<c:url var="classes" value="/classes"></c:url>
<c:url var="teachers" value="/teachers"></c:url>
<c:url var="students" value="/students"></c:url>
<c:url var="leaves" value="/leaves"></c:url>
<c:url var="signout" value="/signout"></c:url>

<c:url var="signoutJs" value="/resources/logout.js"></c:url>

<nav class="navbar nav-pills navbar-expand-lg navbar-light bg-nav sticky-top">
	<div class="container">
		<a class="navbar-brand custom-nav-item" href="${home}">
			<img src="<c:url value='/images/BUC.png' />" width="150px" height="auto">
		</a>
		
		<button class="navbar-toggler d-lg-none" type="button"
			data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav ms-auto">
			
				<sec:authorize access="hasAuthority('Admin')">
					<li class="nav-item custom-nav-item">
						<a class="nav-link" href="${chart}"> <i class="bi bi-bar-chart"></i> Dashboard
						</a>
					</li>
				</sec:authorize>
				
				<sec:authorize access="hasAnyAuthority('Admin','Teacher')">
					<li class="nav-item custom-nav-item">
						<a class="nav-link ${param.view eq 'classes' ? 'active' : ''}"
							href="${classes}"> <i class="bi bi-mortarboard"></i> Classes
						</a>
					</li>
				</sec:authorize>
				
				<sec:authorize access="hasAnyAuthority('Admin','Teacher')">
					<li class="nav-item custom-nav-item">
						<a class="nav-link ${param.view eq 'teachers' ? 'active' : ''}"
							href="${teachers}"> <i class="bi bi-people"></i> Teachers
						</a>
					</li>
				</sec:authorize>
				
				<sec:authorize access="hasAnyAuthority('Admin','Teacher')">
					<li class="nav-item custom-nav-item">
						<a class="nav-link ${param.view eq 'students' ? 'active' : ''}"
							href="${students}"> <i class="bi bi-people-fill"></i> Students
						</a>
					</li>
				</sec:authorize>

				<sec:authorize access="hasAuthority('Student')">
					<li class="nav-item">
						<a class="nav-link ${param.view eq 'leaves' ? 'active' : ''}"
							href="${leaves}"> <i class="bi bi-inbox"></i> Leaves
						</a>
					</li>
				</sec:authorize>

				<li class="nav-item custom-nav-item "><a class="nav-link" id="logoutMenu"> <i
						class="bi bi-lock"></i> Sign Out
				</a></li>
			</ul>
		</div>
		</div>
</nav>
<c:url var="nav" value="/resources/nav.css"></c:url>
<link rel="stylesheet" href="${nav}" type="text/css">


<sf:form action="${signout}" id="logoutForm" method="post"
	cssClass="d-none"></sf:form>
<script src="${signoutJs}"></script>