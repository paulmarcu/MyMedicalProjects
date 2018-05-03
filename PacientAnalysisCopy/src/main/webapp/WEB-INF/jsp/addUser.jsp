<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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

<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
            $(this).toggleClass('open');       
        }
    );
});

</script>

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

<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:8080/PacientAnalysis/rest/getTypes"
		}).then(function(data){
			for(var i = 0; i < data.length; i++){
				$('.select_gender').append('<option value="' + data[i].type + '">'+ data[i].type +'</option>');
			}
			
		});
	});

</script>

<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:8080/PacientAnalysis/rest/getRoles"
		}).then(function(data){
			for(var i = 0; i < data.length; i++){
				$('.select_role').append('<option value="' + data[i].id + '">' + data[i].name + '</option>')
			}
		});
	});
	
</script>

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
       	<li><a href="user/myInfo.html">Account Info</a></li>
       	<security:authorize ifAnyGranted="ROLE_USER">
    		<li><a href="analysis/myAnalysis.html">My Analysis</a></li>
    	</security:authorize>
      	<security:authorize ifAnyGranted="ROLE_ADMIN">
      	<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Analyzes<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a  href="${pageContext.request.contextPath}/analysis/allAnalysises.html">All Analyzes</a></li>
      		<li><a
					href="${pageContext.request.contextPath}/analysis/addAnalysis.html">Add
						Analysis</a></li>
          </ul>
        </li>
        	<li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Users<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a  href="${pageContext.request.contextPath}/user/allUsers.html">All Users</a></li>
      		<li><a
					href="${pageContext.request.contextPath}/user/addUser.html">Add
						User</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Laboratories<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a  href="${pageContext.request.contextPath}/laboratory/allLaboratories.html">All Laboratories</a></li>
      		<li><a href="${pageContext.request.contextPath}/laboratory/addLaboratory.html">Add
						Laboratory</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Cabinets<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a  href="${pageContext.request.contextPath}/cabinet/allCabinets.html">All Cabinets</a></li>
      		<li><a
					href="${pageContext.request.contextPath}/cabinet/addCabinet.html">Add
						Cabinet</a></li>
          </ul>
        </li>
        </security:authorize>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.html"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
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
		</div>
		<div class="col-md-6">
			<label>Username</label>
			<form:input type="text" class="form-control" placeholder="Username" path="username" />
		</div>
		<div class="col-md-6">
			<label>Password</label>
			<form:input type="password" class="form-control" placeholder="Password" path="password"/>
		</div>
		<div class="col-md-6">
			<label>First Name</label>
			<form:input type="text" class="form-control" placeholder="First Name" path="firstName"/>
			<!--<form:errors path="firstName" cssClass="error"/> -->
		</div> 
		<div class="col-md-6">
			<label>Last Name</label>
			<form:input type="text" class="form-control" placeholder="Last Name" path="lastName"/>
			<form:errors path="lastName" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>City</label>
			<form:select class="select_city form-control" placeholder="City"  path="city">
				<option value="">--Please select city--</option>
			</form:select>
		</div>
		<div class="col-md-3">
			<label>Home Address</label>
			<form:input type="text" class="form-control" placeholder="Home Address" path="address"/>
		</div>
		<div class="col-md-3">
			<label>Country</label>
			<form:select class="select_country form-control" placeholder="Country" path="country">
				<option value="">--Please select country--</option>
			</form:select>
		</div>
		<div class="col-md-3">
			<label>Role</label>
			<form:select path="role.id" class="select_role form-control">
				<option value="0">--Please select role--</option>
			</form:select>
		</div>
		<div class="col-md-3">
			<label>Phone</label>
			<form:input type="text" class="form-control" placeholder="Phone" path="phone"/>
		</div>
		<div class="col-md-3">
			<label>Email</label>
			<form:input type="text" class="form-control" placeholder="Email" path="email"/>
		</div>
		<div class="col-md-3">
			<label>Age</label>
			<form:input type="text" class="form-control" placeholder="Age" path="age"/>
			<form:errors path="age" cssClass="error"/>
		</div>
		<div class="col-md-3">
			<label>Gender</label>
			<form:select path="gender" class="select_gender form-control">
				<option value="">--Please select gender--</option>
			</form:select>
		</div>
	</div>
	<br>
	<input class="btn btn-primary" type="submit" value="Submit">
</form:form>
</div>

</body>
</html>