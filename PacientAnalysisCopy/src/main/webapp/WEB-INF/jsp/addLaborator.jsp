<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add new Laboratory</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:8080/PacientAnalysis/rest/allCities"
		}).then(function(data){
			for(var i = 0; i < data.length; i++){
				$('.select_city').append('<option value="' + data[i].name + '">'+ data[i].name +'</option>');
			}
			
		});
	});
	
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:8080/PacientAnalysis/rest/allCountries"
		}).then(function(data){
			for(var i = 0; i < data.length; i++){
				$('.select_country').append('<option value="' + data[i].name + '">'+ data[i].name +'</option>');
			}
			
		});
	});
	
	</script>

<style type="text/css">

.navbar {
	margin-top: 0px;
	margin-bottom: 0px;
}

.jumbotron {
	margin-bottom: 2px;
}
.container {
	margin-left: 0px;
	width: 1000px;
}
.text-left{
	margin-left: 18px;
}

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

</style>

</head>
<body>
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
			<security:authorize ifAnyGranted="ROLE_ADMIN">
				<li><a
					href="${pageContext.request.contextPath}/user/allUsers.html">All
						Users</a></li>
				<li><a
					href="${pageContext.request.contextPath}/analysis/allAnalysises.html">All
						Analyzes</a></li>
				<li><a
					href="${pageContext.request.contextPath}/analysis/addAnalysis.html">Add
						Analysis</a></li>
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
		<form:form commandName="laboratory">
		<form:errors path="*" cssClass="errorblock" element="div"></form:errors>
		<div class="row">
			<h2 class="text-left">Add new laboratory</h2>
		</div>
			<div class="row">
				<div class="col-md-12">
					<label>Name</label>
 					<form:input type="text" class="form-control" placeholder="Laboratory Name" path="name"/>	
				</div>
				<div class="col-md-3">
					<label>Home Address</label>
 					<form:input type="text" class="form-control" placeholder="Home Adress" path="address"/>
				</div>
				<div class="col-md-3">
					<label>City</label>
 					<form:select class="select_city form-control" placeholder="City" path="city">
 						<option value="">--Please select city--</option>
 					</form:select>
 					
				</div>
				<div class="col-md-3">
					<label>Country</label>
 					<form:select  class="select_country form-control" placeholder="Country" path="country">
 						<option value="">--Please select country--</option>
 					</form:select>
				</div>
				<div class="col-md-3">
					<label>Phone</label>
 					<form:input type="text" class="form-control" placeholder="Phone" path="phone"/>
				</div>
			</div>
			<br>
	<input class="btn btn-primary" type="submit" value="Submit">
			</form:form>
	</div>

</body>
</html>