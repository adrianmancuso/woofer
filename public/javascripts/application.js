var userInput = document.getElementById('autocomplete');
var signUpButton = document.getElementById('signup');

var options = {
	// types: ['parks'],
	componentRestrictions: {country: "AU"}
};

autocomplete = new google.maps.places.Autocomplete(userInput, options)
