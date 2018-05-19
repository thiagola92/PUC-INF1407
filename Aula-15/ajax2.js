/**
 * 
 */

onload = inicia;

function inicia() {
	document.getElementById("idBotao1").addEventListener("click", pedeNoticia);
	document.getElementById("idBotao2").addEventListener("click", pedeNoticia);
	document.getElementById("idBotao3").addEventListener("click", pedeNoticiaPost);
}

function pedeNoticia(evento){
	
	var numero = evento.target.getAttribute("data-numero");
	console.log("Numero = " + numero);
	
	var httpReq = createRequest();
	httpReq.open("GET", "Noticia?numero=" + numero, true);
	httpReq.onreadystatechange = function () {
		if(httpReq.readyState == 4) {
			if(httpReq.status == 200) {
				var texto = httpReq.responseText;
				console.log(httpReq.readyState);
				
				document.getElementById("idNoticia" + numero).appendChild(document.createTextNode(texto));
			} else {
				document.getElementById("idNoticia" + numero).appendChild(document.createTextNode("Erro" + httpReq.status));
			}
		}
	};
	httpReq.send(null);
}

function pedeNoticiaPost(evento){
	
	var numero = evento.target.getAttribute("data-numero");
	console.log("Numero = " + numero);
	
	var httpReq = createRequest();
	var qs = "numero=" + numero;
	httpReq.open("POST", "Noticia", true);
	httpReq.setRequestHeader("Content-Type", "application/x-www-formurlencoded");
	httpReq.onreadystatechange = function () {
		if(httpReq.readyState == 4) {
			if(httpReq.status == 200) {
				var texto = httpReq.responseText;
				console.log(httpReq.readyState);
				
				document.getElementById("idNoticia" + numero).appendChild(document.createTextNode(texto));
			} else {
				document.getElementById("idNoticia" + numero).appendChild(document.createTextNode("Erro" + httpReq.status));
			}
		}
	};
	httpReq.send(qs);
}
