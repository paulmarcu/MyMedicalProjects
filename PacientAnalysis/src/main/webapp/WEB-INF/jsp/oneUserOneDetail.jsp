<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Info</title>

<!-- Latest compiled and minified CSS -->
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

input.hidden {
	position: absolute;
	left: -9999px;
}

#profile-image1 {
	cursor: pointer;
	width: 100px;
	height: 100px;
	border: 2px solid #03b1ce;
}

.tital {
	font-size: 16px;
	font-weight: 500;
}

.bot-border {
	border-bottom: 1px #f8f8f8 solid;
	margin: 5px 0 5px 0
}
</style>

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
				</security:authorize>
				<security:authorize ifAnyGranted="ROLE_ADMIN">
					<li><a
						href="${pageContext.request.contextPath}/user/allUsers.html">All
							Users</a></li>
					<li><a
						href="${pageContext.request.contextPath}/analysis/allAnalysises.html">All Analyzes</a></li>
					<li><a
						href="${pageContext.request.contextPath}/analysis/addAnalysis.html">Add
							Analysis</a></li>
				</security:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/logout.html"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				<li><a href="${pageContext.request.contextPath}"><span
						class="glyphicon glyphicon-arrow-left"></span> Back</a></li>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-7 ">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>User Profile</h4>
					</div>
					<div class="panel-body">
						<div class="box box-info">
							<div class="box-body">
								<div class="col-sm-6">
									<div align="center"></div>
								</div>
								<div class="col-sm-6"></div>
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">
								<div class="col-sm-5 col-xs-6 tital ">First Name:</div>
								<div class="col-sm-7 col-xs-6 ">
									<c:out value="${user.firstName }"></c:out>
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital ">Last Name:</div>
								<div class="col-sm-7">
									<c:out value="${user.lastName }"></c:out>
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital ">Username:</div>
								<div class="col-sm-7">
									<c:out value="${user.username }"></c:out>
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital ">Password:</div>
								<div class="col-sm-7">
									<c:out value="${user.password }"></c:out>
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital ">Email:</div>
								<div class="col-sm-7">
									<c:out value="${user.email }"></c:out>
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital ">Address:</div>
								<div class="col-sm-7">
									<c:out value="${user.address }"></c:out>
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital ">City:</div>
								<div class="col-sm-7">
									<c:out value="${user.city }"></c:out>
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital ">Phone:</div>
								<div class="col-sm-7">
									<c:out value="${user.phone }"></c:out>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>