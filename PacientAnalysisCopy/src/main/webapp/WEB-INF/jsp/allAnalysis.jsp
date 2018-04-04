<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Analysises page</title>
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
	margin-bottom: 10px;
}

.jumbotron {
	margin-bottom: 2px;
}

.pagination>li {
	display: inline;
	padding: 0px !important;
	margin: 0px !important;
	border: none !important;
}

.modal-backdrop {
	z-index: -1 !important;
}
/*
Fix to show in full screen demo
*/
iframe {
	height: 700px !important;
}

.btn {
	display: inline-block;
	padding: 6px 12px !important;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px;
}

.btn-primary {
	color: #fff !important;
	background: #428bca !important;
	border-color: #357ebd !important;
	box-shadow: none !important;
}

.btn-danger {
	color: #fff !important;
	background: #d9534f !important;
	border-color: #d9534f !important;
	box-shadow: none !important;
}
.text-left{
	margin-left: 18px;
}
.container{
	margin-left: 0px;
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
			<li><a href="${pageContext.request.contextPath}"><span
					class="glyphicon glyphicon-arrow-left"></span> Back</a></li>
		</ul>
	</div>
	</nav>
	
	<div class="container">
		<div class="row">
			<h2 class="text-left">Analyzes</h2>
		</div>

		<div class="row">

			<div class="col-md-12">


				<table id="datatable" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Category</th>
							<th>Minimum Value</th>
							<th>Maxim Value</th>
							<th>Result</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${analysises}" var="analysis">
							<tr>
								<td>${analysis.id }</td>
								<td>${analysis.name }</td>
								<td>${analysis.category }</td>
								<td>${analysis.minValue }</td>
								<td>${analysis.maxValue }</td>
								<td>${analysis.result }</td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<a type="button" class="btn btn-primary"
											href="${pageContext.request.contextPath}/analysis/editAnalysis/${analysis.id}.html">
											<span class="glyphicon glyphicon-pencil"></span>
										</a>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<a type="button" class="btn btn-danger"
											href="${pageContext.request.contextPath}/analysis/analysisDelete/${analysis.id}.html">
											<span class="glyphicon glyphicon-trash"></span>
										</a>
									</p></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>