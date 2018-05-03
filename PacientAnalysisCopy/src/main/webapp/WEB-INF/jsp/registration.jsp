<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up</title>
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
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
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
	
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:8080/PacientAnalysis/rest/getTypes"
		}).then(function(data){
			for(var i = 0; i < data.length; i++){
				$('.select_gender').append('<option value="' + data[i].type + '">'+ data[i].type +'</option>');
			}
			
		});
	});
	
	var $alert = $('.alert');
	
	if($alert.length){
		setTimeout(function(){
			$alert.fadeOut('slow');
		} , 3000)
	}
	
	</script>
</head>
<body>
<div class="container">
	<c:if test="${not empty message }">
	<div class="col-xs-12">
	
		<div class="alert aler-success alert dismissible">
			<button type="button" class="close" data-dismiss="alert" >&times;</button>
			${message }
		</div>
		
	</div>
	</c:if>
<br>  
<hr>

<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">Create Account</h4>
	<form:form commandName="user">
	<form:errors path="*" cssClass="errorblock" element="div"></form:errors>
	<div class="form-group input-group">
        <form:input path="cnp" name="" class="form-control" placeholder="Cnp" type="text" />
    </div> 
	<div class="form-group input-group">
        <form:input path="firstName" name="" class="form-control" placeholder="First Name" type="text" />
    </div> 
    <div class="form-group input-group">
        <form:input path="lastName" class="form-control" placeholder="Last Name" type="text"/>
        <form:errors path="lastName" cssClass="error"/>
    </div>
    <div class="form-group input-group">
    	<form:input path="username" class="form-control" placeholder="Username" type="text" />
    </div>
    <div class="form-group input-group">
		<form:input path="password" class="form-control" placeholder="Password" type="password"/>
	</div> 
    <div class="form-group input-group">
        <form:input type="text" class="form-control" placeholder="Email" path="email"/>
        <form:errors path="email" cssClass="error"/>
    </div> 
    <div class="form-group input-group">
        <form:input path="address" class="form-control" placeholder="Address" type="text"/>
    </div>     
     <div class="form-group input-group">
        <form:input path="phone" class="form-control" placeholder="Phone number" type="text"/>
    </div>    
    <div class="form-group input-group">
    <form:select path="city" class="select_city form-control">
    	<option value=""> --Please select city--  </option>
    </form:select>
    </div>
    <div class="form-group input-group">
    <form:select path="country" class="select_country form-control">
    	<option value="">--Please select country--</option>
    </form:select>        
    </div>
    <div class="form-group input-group">         
    <form:select path="gender" class="select_gender form-control">
    	<option value="">--Please select gender--</option>
    </form:select>            
    </div>
     <div class="form-group input-group">
     	 <form:input path="age" class="form-control" placeholder="Age" type="text"/>
     </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Create Account  </button>
    </div>                                                                   
</form:form>
</article>
</div> 

</div> 
</body>
</html>