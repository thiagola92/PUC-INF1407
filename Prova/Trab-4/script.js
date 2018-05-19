/**
 * Nome: Thiago Lages de Alencar
 * Matricula: 1721629
 */

console.log("Starting script");

onload = start;

function start() {
	console.log("start()");
	
	var botaoEntrar = document.getElementById("entrar");
	botaoEntrar.addEventListener("click", entrar);
}

function entrar() {
	console.log("entrar()");
	
	var username = document.getElementById("username");
	username = username.value;
	
	var password = document.getElementById("password");
	password = password.value;
	
	temperatura(username, password);
	velocidade(username, password);
}

function temperatura(username, password) {
	console.log("temperatura()");
	
	var parametros = "?user="+username+"&pass="+password;
	
	reqGet = createRequest();
	reqGet.open("GET", "servlet/Temperatura" + parametros, true);
	
	reqGet.onreadystatechange = function() {
		console.log("readyState = " + reqGet.readyState);
		console.log("status = " + reqGet.status);
		
		if(reqGet.readyState == 4 && reqGet.status == 200) {
			console.log("###received###");
			
			var resposta = reqGet.responseXML.documentElement;
			var xml = resposta.getElementsByTagName('valor')[0];
			
			var div = document.getElementById("info");
			var p = document.createElement('p');
			var t = document.createTextNode("Temperatura ambiente: " + xml);
			
			p.appendChild(t);
			div.appendChild(p);
			
		}
	}
	
	reqGet.send(null);
	
}

function velocidade(username, password) {
	console.log("velocidade()");
	
	var parametros = "user="+username+"&pass="+password;
	
	reqPost = createRequest();
	reqPost.open("POST", "servlet/Velocidade", true);
	reqPost.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	reqPost.onreadystatechange = function() {
		console.log("readyState = " + reqPost.readyState);
		console.log("status = " + reqPost.status);
		
		if(reqPost.readyState == 4 && reqPost.status == 200) {
			console.log("###received###");
			
			var resposta = reqPost.responseText;
			var json = JSON.parse(resposta);
			
			var div = document.getElementById("info");
			var p = document.createElement('p');
			var t = document.createTextNode("Velocidade do vento: " + json.velocidade);
			
			p.appendChild(t);
			div.appendChild(p);
			
			time();
		}
	}
	
	reqPost.send(parametros);
	
}

function time() {
	var today = new Date();
	
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var dateTime = date+' '+time;

	var div = document.getElementById("info");
	var p = document.createElement('p');
	var t = document.createTextNode("Horario local: " + dateTime);
	
	p.appendChild(t);
	div.appendChild(p);
	
	setTimeout(entrar, 10000);
	
}