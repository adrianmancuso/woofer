var userInput = document.getElementById('autocomplete');

var options = {
	// types: ['park', 'cafe'],
	componentRestrictions: {country: "AU"}
};

autocomplete = new google.maps.places.Autocomplete(userInput, options)