<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Appointment Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.navbar {
	margin-top: 0px;
	margin-bottom: 10px;
}

.jumbotron {
	margin-bottom: 2px;
}

.btn-group .form-horizontal .btn[type="submit"] {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.form-horizontal .form-group {
	margin-left: 10px;
	width: 300px;
}

.form-group .form-control:last-child {
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".dropdown").hover(
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideDown("400");
							$(this).toggleClass('open');
						},
						function() {
							$('.dropdown-menu', this).not('.in .dropdown-menu')
									.stop(true, true).slideUp("400");
							$(this).toggleClass('open');
						});
			});
</script>
</head>
<body>
	<div class="jumbotron text-center">
		<h1>Welcome to Medical Application!</h1>
		<p>This application help people and medics to access more
			efficient the analysis resource</p>
	</div>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand">Medicals</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}">Home</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/myInfo.html">Account
						Info</a></li>
				<security:authorize ifAnyGranted="ROLE_USER">
					<li><a
						href="${pageContext.request.contextPath}/analysis/myAnalysis.html">My
							Analysis</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Appointment<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/appointment/makeAppointmentCabinet.html">To
									Cabinet</a></li>
							<li><a
								href="${pageContext.request.contextPath}/appointment/makeAppointmentToLaboratory.html">To
									Laboratory</a></li>
						</ul></li>
				</security:authorize>
				<security:authorize ifAnyGranted="ROLE_ADMIN">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Analyzes<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/analysis/allAnalysises.html">All
									Analyzes</a></li>
							<li><a
								href="${pageContext.request.contextPath}/analysis/addAnalysis.html">Add
									Analysis</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Users<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/user/allUsers.html">All
									Users</a></li>
							<li><a
								href="${pageContext.request.contextPath}/user/addUser.html">Add
									User</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Laboratories<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/laboratory/allLaboratories.html">All
									Laboratories</a></li>
							<li><a
								href="${pageContext.request.contextPath}/laboratory/addLaboratory.html">Add
									Laboratory</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Cabinets<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="${pageContext.request.contextPath}/cabinet/allCabinets.html">All
									Cabinets</a></li>
							<li><a
								href="${pageContext.request.contextPath}/cabinet/addCabinet.html">Add
									Cabinet</a></li>
						</ul></li>
				</security:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.html"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<h4>Find appointment:</h4>
			<form:form commandName="appointment" class="form-horizontal" role="form">
				<div class="form-group">
					<label for="contain">Date</label> 
					<form:input path="date" class="form-control" type="date" />
				</div>
				<div class="form-group">
					<label for="filter">Country</label>
					<form:select path="cabinet.country" class="form-control">
						<option value="0">--Please select country--</option>
					</form:select>
				</div>
				<div class="form-group">
					<label for="contain">City</label>
					<form:select path="cabinet.city" class="form-control" type="text">
						<option value="">--Please select city--</option>
					</form:select>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>