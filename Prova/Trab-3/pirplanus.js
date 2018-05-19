/**
 * 
 */

var numHerdeiros = 0;
var maiorNumeroDeHerdeiro = 0;

onload = inicia;

function inicia() {
	console.log("Iniciando o codigo");
	
	var botaoFilho = document.getElementById("filho");
	botaoFilho.addEventListener("click", maisFilho);
}

function maisFilho(event) {
	//console.log("Mais um filho");
	
	var botaoApertado = event.target;
	var divDoBotao = botaoApertado.parentNode;
	
	//console.log("class: " + divDoBotao["className"]);
	var numHerdeiro = parseInt(divDoBotao.className);
	
	numHerdeiro++;
	//console.log("numHerdeiro: " + numHerdeiro);
	
	if(numHerdeiro > maiorNumeroDeHerdeiro) {
		maiorNumeroDeHerdeiro = numHerdeiro;
		//console.log("maiorNumeroDeHerdeiro: " + maiorNumeroDeHerdeiro);
	}
	
	var div = document.createElement("div");
	div.setAttribute("class", numHerdeiro);
	divDoBotao.appendChild(div);
	
	for(var i=0; i < numHerdeiro; i++) {
		var espaco = document.createTextNode("-");
		div.appendChild(espaco);
	}
	
	numHerdeiros++;
	console.log("numHerdeiros: " + numHerdeiros);
	
	var input = document.createElement("input");
	input.setAttribute("type", "text");
	input.setAttribute("name", numHerdeiros);
	input.addEventListener("keyup", confereTodos);
	div.appendChild(input);
	
	var button = document.createElement("button");
	button.setAttribute("type", "button");
	button.addEventListener("click", maisFilho);
	div.appendChild(button);
	
	var sinal = document.createTextNode("+");
	button.appendChild(sinal);
	
	confereTodos();
}

function confereNome(input) {
	console.log("Confere nome");
	
	var texto = input.value;
	console.log("nome: " + texto);
	
	// Eles precisam ter sobrenome?
	var nome = /^[AEIOU][aeiou]*[AEIOU]([^aeiouAEIOU]+[AEIOU][aeiou]*[AEIOU])*$/;
	var resultado = nome.test(texto);
	console.log("nome valido: " + resultado);
	
	return resultado;
}

function confereTodos() {
	var allInputs = document.getElementsByTagName("input");
	
	for(var i=0; i < allInputs.length; i++) {
		if(confereNome(allInputs[i]) == false) {
			var enviar = document.getElementById("enviar");
			enviar.type = "button";
			return;
		}
	}

	var enviar = document.getElementById("enviar");
	enviar.type = "submit";
}