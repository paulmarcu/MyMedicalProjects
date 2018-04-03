<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Analysis</title>
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
	margin-bottom: 0px;
}

.jumbotron{
	margin-bottom: 2px;
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
      <li><a href="${pageContext.request.contextPath}/user/myInfo.html">Account Info</a></li>
      <security:authorize ifAnyGranted="ROLE_ADMIN">
      	<li><a href="${pageContext.request.contextPath}/user/allUsers.html">All Users</a></li>
      	<li><a href="${pageContext.request.contextPath}/analysis/allAnalysises.html">All Analyzes</a></li>
      	<li><a href="${pageContext.request.contextPath}/analysis/addAnalysis.html">Add Analysis</a></li>
      </security:authorize>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="${pageContext.request.contextPath}/logout.html"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			<li><a
				href="${pageContext.request.contextPath}/analysis/allAnalysises.html"><span
					class="glyphicon glyphicon-arrow-left"></span> Back</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
<div class="col-md-5">
    <div class="form-area">  
        <form:form commandName="analysis" role="form">
        <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">Add Analysis</h3>
                    
                    <div class="form-group">
                    	<label for='fname'>Name</label>
						<form:input path="name" type="text" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label for='fname'>Category</label>
						<form:input path="category" type="text" class="form-control"/>
					</div>
					
    				<div class="form-group">
    					<label for='fname'>Minimum Value</label>
						<form:input path="minValue" type="text" class="form-control"/>
					</div>
					
					<div class="form-group">
						<label for='fname'>Maxim Value</label>
						<form:input path="maxValue" type="text" class="form-control" />
					</div>
					
					<div class="form-group">
						<label for='fname'>Result</label>
						<form:input path="result" type="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for='fname'>User Id</label>
						<form:input path="user.id" type="text" class="form-control"></form:input>
					</div>
        <input class="btn btn-primary" type="submit" value="Submit">
        </form:form>
    </div>
</div>
</div>



</body>
</html>
