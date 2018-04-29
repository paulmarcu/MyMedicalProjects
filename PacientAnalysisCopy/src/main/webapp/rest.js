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
	
	