<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Custom Login Page</title>
<style type="text/css">

.container{
	background-color: 
}

.btn {
	width: auto;
	height: auto;
}

.inner-addon {
	position: relative;
}

/* style icon */
.inner-addon .glyphicon {
	position: absolute;
	padding: 10px;
	pointer-events: none;
}

/* align icon */
.left-addon .glyphicon {
	left: 0px;
}

.right-addon .glyphicon {
	right: 0px;
}

/* add padding  */
.left-addon input {
	padding-left: 30px;
}

.right-addon input {
	padding-right: 30px;
}
</style>
</head>
<body onload='document.f.j_username.focus();'>

	<c:if test="${not empty error}">
		<div class="alert alert-warning">
			Your login was unsuccessful. <br /> Caused:
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }
		</div>
	</c:if>


	<div class="container">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel-heading">
				<h3 class="panel-title">Login</h3>
			</div>

			<form action="j_spring_security_check" name="f" method="post">
				<div class="form-group inner-addon left-addon">
					<i class="glyphicon glyphicon-user"></i> <input
						class="form-control" type="text" placeholder="Username"
						name="j_username" value="">
				</div>
				<div class="form-group inner-addon left-addon">
					<i class="glyphicon glyphicon-lock"></i> <input
						class="form-control" type="password" placeholder="Password"
						name="j_password" value="">
				</div>
				<input class="btn btn-primary " type="submit" name="Submit"
					value="Submit">
			</form>
		</div>
	</div>
</body>
</html>