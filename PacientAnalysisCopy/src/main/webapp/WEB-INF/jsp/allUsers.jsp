<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All users page</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

.navbar {
	margin-top: 0px;
	margin-bottom: 20px;
}

.jumbotron{
	margin-bottom: 2px;
}

.panel-table .panel-body{
  padding:0;
}

.panel-table .panel-body .table-bordered{
  border-style: none;
  margin:0;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
    text-align:center;
    width: 100px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
  border-right: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
  border-left: 0px;
}

.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
  border-bottom: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
  border-top: 0px;
}

.panel-table .panel-footer .pagination{
  margin:0; 
}

/*
used to vertically center elements, may need modification if you're not using default sizes.
*/
.panel-table .panel-footer .col{
 line-height: 34px;
 height: 34px;
}

.panel-table .panel-heading .col h3{
 line-height: 30px;
 height: 30px;
}

.panel-table .panel-body .table-bordered > tbody > tr > td{
  line-height: 34px;
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
       <li><a href="${pageContext.request.contextPath}"><span class="glyphicon glyphicon-arrow-left"></span> Back</a></li>
    </ul>
  </div>
  </nav>

<div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Users</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <a href="${pageContext.request.contextPath}/user/addUser.html" type="button" class="btn btn-sm btn-primary btn-create">Create User</a>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th>Action</th>
                        <th class="hidden-xs">ID</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>User Details</th>
                        <th>Analyzes Details</th>
                    </tr> 
                  </thead>
                  <tbody>
                  	<c:forEach items="${users}" var="user">
                          <tr>
                            <td align="center">
                              <a href="${pageContext.request.contextPath}/user/editUser/${user.id}.html" data-original-title="Edit user" data-toggle="tooltip" type="button" class="btn btn-default"><span class="glyphicon glyphicon-wrench"></span></a>
                              <a href="${pageContext.request.contextPath}/user/userDelete/${user.id}.html" data-original-title="Delete user" data-toggle="tooltip" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a>
                            </td>
                            <td class="hidden-xs">${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td><a type="button" class="btn btn-info" href="${pageContext.request.contextPath}/user/userDetails/${user.id}.html">User Detalis</a></td>
                            <td><a type="button" class="btn btn-info" href="${pageContext.request.contextPath}/analysis/analysisReport/${user.id}.html">Analysis Detalis</a></td>
                          </tr>
                   </c:forEach>
                 </tbody>
                </table>
            
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
