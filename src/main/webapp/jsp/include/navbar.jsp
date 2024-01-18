<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="home" value="/home"></c:url>
<c:url var="classes" value="/classes"></c:url>
<c:url var="teachers" value="/teachers"></c:url>
<c:url var="students" value="/students"></c:url>
<c:url var="leaves" value="/leaves"></c:url>
<c:url var="signout" value="/signout"></c:url>
<nav class="navbar nav-pills navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="#">British University College</a>
		<button class="navbar-toggler d-lg-none" type="button"
			data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
			aria-controls="collapsibleNavId" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavId">
			<ul class="navbar-nav me-auto mt-2 mt-lg-0">
				<li class="nav-item"><a
					class="nav-link ${param.view eq 'home' ? 'active' : ''}"
					href="${home}">Home</a></li>
					
				<li class="nav-item"><a
					class="nav-link ${param.view eq 'classes' ? 'active' : ''}"
					href="${classes}">
					<i class="bi bi-mortarboard"></i>
					Classes</a></li>
					
				<li class="nav-item"><a
					class="nav-link ${param.view eq 'teachers' ? 'active' : ''}"
					href="${teachers}">
					<i class="bi bi-people"></i>
					Teachers</a></li>

				<li class="nav-item"><a
					class="nav-link ${param.view eq 'students' ? 'active' : ''}"
					href="${students}">
					<i class="bi bi-people-fill"></i>
					Students</a></li>
					
				<li class="nav-item"><a
					class="nav-link ${param.view eq 'leaves' ? 'active' : ''}"
					href="${leaves}">
					<i class="bi bi-inbox"></i>
					Leaves</a></li>
					
				<li class="nav-item"><a class="nav-link" href="${signout}">
				<i class="bi bi-lock"></i>
				Sign Out</a></li>
			</ul>
		</div>
	</div>
</nav>