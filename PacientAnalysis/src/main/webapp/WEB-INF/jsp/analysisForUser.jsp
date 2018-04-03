<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Analysis</title>
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
.table {
	margin-left: 0px;
	margin-top: 5px;
	width: 600px;
}

.navbar {
	margin-top: 0px;
	margin-bottom: 10px;
}

.jumbotron {
	margin-bottom: 2px;
}

.row {
	margin-left: 12px;
}

#leftDiv {
	margin-left: 0px;
}

#rightDiv {
	margin-right: 0px;
	margin-left: 0px;
}

#searchForm {
	margin-top: 5px;
}
#text{
	margin-left: 20px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".btn")
								.click(
										function() {
											$("p").hide();
											window.location.href = "${pageContext.request.contextPath}/analysis/myAnalysis.html";
										});
						//$(".btn2").click(function(){
						//  $("p").show();
						//});
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
			<li><a
				href="${pageContext.request.contextPath}/analysis/myAnalysis.html">My
					Analysis</a></li>

			<security:authorize ifAnyGranted="ROLE_ADMIN">
				<li><a
					href="${pageContext.request.contextPath}/user/allUsers.html">All
						Users</a></li>
				<li><a
					href="${pageContext.request.contextPath}/analysis/allAnalysises.html">All
						Analysises</a></li>
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

	<div id="leftDiv" class="col-md-6 col-md-offset-1">
	<h3 id="text" class="card-title">My Analysises</h3>
		<div class="table">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Category</th>
						<th>Minim Value</th>
						<th>Maxim Value</th>
						<th>Result</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${analysises}" var="analysis">
						<tr>
							<td>${analysis.name}</td>
							<td>${analysis.category}</td>
							<td>${analysis.minValue}</td>
							<td>${analysis.maxValue}</td>
							<td>${analysis.result}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<div id="rightDiv" class="col-md-3 col-md-offset-2">
	<h3 id="text" class="card-title">My Bad Analysises</h3>
	<div id="tabelSearch" class="table">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Name</th>
						<th>Category</th>
						<th>Minim Value</th>
						<th>Maxim Value</th>
						<th>Result</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${badAnalysis}" var="bad">
					<tr>
						<td><c:out value="${bad.name}"></c:out></td>
						<td><c:out value="${bad.category}"></c:out></td>
						<td><c:out value="${bad.minValue}"></c:out></td>
						<td><c:out value="${bad.minValue}"></c:out></td>
						<td><c:out value="${bad.result}"></c:out></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
</div>
</body>
</html>