<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rest exemple</title>
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
		$.ajax({
			url: "http://localhost:8080/PacientAnalysis/rest/hello"
		}).then(function(data) {
			
			for (var i = 0; i < data.length; i++){
			$('.select').append('<option value="' + data[i].id + '">'+ data[i].id +'</option>' + '<option value="' + data[i].content +'">'+ data[i].content +'</option>');
			}
			
		});
	});

</script>
</head>
<body>

<select class="select">
	<option value="">Please select something!</option>
</select>

</body>
</html>