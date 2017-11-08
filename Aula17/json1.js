/**
 * 
 */

onload = function() {
	var voo = {
			"aircraft": "A320",
			"pilot": {
			"firstName": "John",
			"lastName": "Adams"
			},
			"passenger": [
			"George Washington",
			"Thomas Jefferson"
			]
	};
	
	console.log("tipo do aviao: " + voo.aircraft);
	console.log("piloto: " + voo.pilot.lastName);
	console.log("passageiro: " + voo.passenger.length);
	
	
}