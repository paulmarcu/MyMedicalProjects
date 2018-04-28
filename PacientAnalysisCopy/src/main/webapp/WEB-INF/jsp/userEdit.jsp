<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User page</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.navbar {
	margin-top: 0px;
	margin-bottom: 15px;
}

.jumbotron {
	margin-bottom: 2px;
}

#rightDiv {
	margin-left: 0px;
}
#leftDiv {
	margin-left: 25px;
}
#detailTable{
	width: 500px;
}
#table{
	width: 500px;
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
			<li><a
				href="${pageContext.request.contextPath}/user/allUsers.html"><span
					class="glyphicon glyphicon-arrow-left"></span> Back</a></li>
		</ul>
	</div>
	</nav>
	<div id="rightDiv" class="col-md-6 col-md-offset-1 ">
		<form:form commandName="user">
			<div class="row">
				<div class="col-md-12">
					<label>Cnp</label>
					<form:input type="text" class="form-control" placeholder="Cnp"
						path="cnp" />
				</div>
				<div class="col-md-6">
					<label>Username</label>
					<form:input type="text" class="form-control" placeholder="Username"
						path="username" />
				</div>
				<div class="col-md-6">
					<label>Password</label>
					<form:input type="password" class="form-control"
						placeholder="Password" path="password" />
				</div>
				<div class="col-md-6">
					<label>First Name</label>
					<form:input type="text" class="form-control"
						placeholder="First Name" path="firstName" />
				</div>
				<div class="col-md-6">
					<label>Last Name</label>
					<form:input type="text" class="form-control"
						placeholder="Last Name" path="lastName" />
				</div>
				<div class="col-md-3">
					<label>City</label>
					<form:input type="text" class="form-control" placeholder="City"
						path="city" />
				</div>
				<div class="col-md-3">
					<label>Address</label>
					<form:input type="text" class="form-control" placeholder="Address"
						path="address" />
				</div>
				<div class="col-md-3">
					<label>Activ</label>
					<form:input type="text" class="form-control"
						placeholder="1(Yes)/0(No)" path="enabled" />
				</div>
				<div class="col-md-3">
					<label>Role</label>
					<form:input type="text" class="form-control"
						placeholder="Role:(1)User/(2)Admin" path="role.id" />
				</div>
				<div class="col-md-3">
					<label>Phone</label>
					<form:input type="text" class="form-control" placeholder="Phone"
						path="phone" />
				</div>
				<div class="col-md-3">
					<label>Email</label>
					<form:input type="text" class="form-control" placeholder="Email"
						path="email" />
				</div>
				<div class="col-md-3">
					<label>Age</label>
					<form:input type="text" class="form-control" placeholder="Age"
						path="age" />
				</div>
				<div class="col-md-3">
					<label>Gender</label>
					<form:input type="text" class="form-control" placeholder="Gender"
						path="gender" />
				</div>
			</div>
			<br>
			<input class="btn btn-primary" type="submit" value="Submit">
		</form:form>
	</div>
</body>
</html>