/**
 * 
 */

onload = function() {
	var httpReq = createRequest();
	httpReq.open("GET", "BuscaVoo", true);
	httpReq.onreadystatechange = function() {
		if(httpReq.readyState == 4) {
			if(httpReq.status == 200) {
				var resposta = httpReq.responseText;
				console.log("Resposta: " + resposta);
				
				var voo = parse.JSON(resposta);
				console.log(voo);
				
				console.log("tipo do aviao: " + voo.aircraft);
				console.log("piloto: " + voo.pilot.lastName);
				console.log("passageiro: " + voo.passenger.length);
			}
		}
	}
	httpReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	httpReq.send(null);
}