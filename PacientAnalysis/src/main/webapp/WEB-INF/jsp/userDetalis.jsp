<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detalis about user</title>
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
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad{
margin-top:20px;
}
.container{
	margin-top: -20px;
	margin-left: -280px;
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
	<div class="container">
      <div class="row">
      <div class="col-md-5 toppad pull-right col-md-offset-3 ">
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title"><c:out value="${user.firstName}"></c:out> <c:out value="${user.lastName}"></c:out></h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Cnp</td>
                        <td><c:out value="${user.cnp }"></c:out></td>
                      </tr>
                      <tr>
                        <td>Age</td>
                        <td><c:out value="${user.age}"></c:out></td>
                      </tr>
                   		<tr>
                   			<td>Role</td>
                   			<td><c:out value="${user.role.name}"></c:out></td>
                   		</tr>
                         <tr>
                             <tr>
                        <td>Gender</td>
                        <td><c:out value="${user.gender}"></c:out></td>
                      </tr>
                        <tr>
                        <td>Home Address</td>
                        <td><c:out value="${user.address}"></c:out>, <c:out value="${user.city }"></c:out></td>
                      </tr>
                      <tr>
                        <td>Email</td>
                        <td><c:out value="${user.email}"></c:out></td>
                      </tr>
                      <tr>
                        <td>Phone Number</td>
                        <td><c:out value="${user.phone}"></c:out></td>
                      </tr>  
                    </tbody>
                  </table>
                  
                  
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a href="${pageContext.request.contextPath}/user/editUser/${user.id}.htmll" data-original-title="Edit user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                        <span class="pull-right">
                            <a href="${pageContext.request.contextPath}/user/userDelete/${user.id}.html" data-original-title="Remove user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
            
          </div>
        </div>
      </div>
    </div>
    <script>
    $(document).ready(function() {
        var panels = $('.user-infos');
        var panelsButton = $('.dropdown-user');
        panels.hide();

        //Click dropdown
        panelsButton.click(function() {
            //get data-for attribute
            var dataFor = $(this).attr('data-for');
            var idFor = $(dataFor);

            //current button
            var currentButton = $(this);
            idFor.slideToggle(400, function() {
                //Completed slidetoggle
                if(idFor.is(':visible'))
                {
                    currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
                }
                else
                {
                    currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
                }
            })
        });


        $('[data-toggle="tooltip"]').tooltip();

        $('button').click(function(e) {
            e.preventDefault();
            alert("This is a demo.\n :-)");
        });
    });
    
    </script>
</body>
</html>