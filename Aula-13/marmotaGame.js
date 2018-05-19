
var pontuacao = 0;
var numeroDeBuracos = 3;
var marmota = [];

onload = inicializa;

function inicializa() {
	console.log("Inicializando o jogo...");
	
	var buracos = document.getElementById("buracos");
	
	for(var i = 0; i < numeroDeBuracos; i++) {
		buracos.innerHTML += "<img id='buraco" + i + "' src='imagem/buraco.png' onclick='baterNaMarmota(" + i + ")' />";
		marmota[i] = 0;
		
		console.log("buraco" + i + " criado");
	}
	
	setInterval(acordaMarmota,1000);
}

function baterNaMarmota(idDaMarmota) {
	console.log("Batendo na marmota " + idDaMarmota);
	
	if(marmota[idDaMarmota] == 0)
		return;
	
	document.getElementById("buraco" + idDaMarmota).src = "imagem/buraco.png";
	marmota[idDaMarmota] = 0;
	
	pontuacao += 1;
	document.getElementById("pontuacao").innerHTML = "Pontuacao: " + pontuacao;
}

function acordaMarmota() {
	
	var qualMarmota = (Math.random()*1000) % numeroDeBuracos;
	qualMarmota = parseInt(qualMarmota);
	
	if(marmota[qualMarmota] == 1)
		return;

	console.log("Acordando a marmota " + qualMarmota);
	document.getElementById("buraco" + qualMarmota).src = "imagem/marmota.png";
	marmota[qualMarmota] = 1;
	
	console.log("A marmota acordada foi " + qualMarmota);
}