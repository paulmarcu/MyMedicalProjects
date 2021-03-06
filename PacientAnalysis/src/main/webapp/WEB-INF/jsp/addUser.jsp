<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User Page</title>

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

.error {
	color: red;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}

.container{

	margin-left: 0px;
	width: 1000px;
}
.navbar {
	margin-top: 0px;
	margin-bottom: 15px;
}

.jumbotron{
	margin-bottom: 2px;
}

</style>

</head>
<body>
  <div class="jumbotron text-center">
    <h1>Welcome to Medical Application!</h1> 
    <p>This application help people and medics to access more efficient the analysis resource</p> 
  </div>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand">Medicals</a>
    </div>
    <ul class="nav navbar-nav">
    <li><a href="${pageContext.request.contextPath}">Home</a></li>
     <li><a href="${pageContext.request.contextPath}/user/myInfo.html">Account Info</a></li>
     <security:authorize ifAnyGranted="ROLE_ADMIN">
      <li><a href="${pageContext.request.contextPath}/user/allUsers.html">All Users</a></li>
      <li><a href="${pageContext.request.contextPath}/analysis/allAnalysises.html">All Analyzes</a></li>
            <li><a href="${pageContext.request.contextPath}/analysis/addAnalysis.html">Add Analysis</a></li>
      </security:authorize>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="${pageContext.request.contextPath}/logout.html"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
       <li><a href="${pageContext.request.contextPath}/user/allUsers.html"><span class="glyphicon glyphicon-arrow-left"></span>Back</a></li>
    </ul>
  </div>
  </nav>
 <div class="container">
<form:form commandName="user">
	<form:errors path="*" cssClass="errorblock" element="div"></form:errors>
	<div class="row">
		<div class="col-md-12">
			<label>Cnp</label>
 			<form:input type="text" class="form-control" placeholder="Cnp" path="cnp"/>	
 			<form:errors path="cnp" cssClass="error"/>	
		</div>
		<div class="col-md-6">
			<label>Username</label>
			<form:input type="text" class="form-control" placeholder="Username" path="username" />
			<form:errors path="username" cssClass="error"/>
		</div>
		<div class="col-md-6">
			<label>Password</label>
			<form:input type="password" class="form-control" placeholder="Password" path="password"/>
			<form:errors path="password" cssClass="error"/>
		</div>
		<div class="col-md-6">
			<label>First Name</label>
			<form:input type="text" class="form-control" placeholder="First Name" path="firstName"/>
			<form:errors path="firstName" cssClass="error"/>
		</div>
		<div class="col-md-6">
			<label>Last Name</label>
			<form:input type="text" class="form-control" placeholder="Last Name" path="lastName"/>
			<form:errors path="lastName" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>City</label>
			<form:input type="text" class="form-control" placeholder="City"  path="city"/>
			<form:errors path="city" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Address</label>
			<form:input type="text" class="form-control" placeholder="Address" path="address"/>
			<form:errors path="address" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Activ</label>
			<form:input type="text" class="form-control" placeholder="1(Yes)/0(No)" path="enabled"/>
			<form:errors path="enabled" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Role</label>
			<form:input type="text" class="form-control" placeholder="Role:(1)User/(2)Admin" path="role.id"/>
			<form:errors path="role.id" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Phone</label>
			<form:input type="text" class="form-control" placeholder="Phone" path="phone"/>
			<form:errors path="phone" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Email</label>
			<form:input type="text" class="form-control" placeholder="Email" path="email"/>
			<form:errors path="email" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Age</label>
			<form:input type="text" class="form-control" placeholder="Age" path="age"/>
			<form:errors path="age" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Gender</label>
			<form:input type="text" class="form-control" placeholder="Gender" path="gender"/>
			<form:errors path="gender" cssClass="error"/>
		</div>
	</div>
	<br>
	<input class="btn btn-primary" type="submit" value="Submit">
</form:form>
</div>

</body>
</html>