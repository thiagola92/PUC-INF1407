/**
 * 
 */

onload = inicia;

function inicia() {
	document.getElementById("idBotao1").addEventListener("click", pedeNoticia1);
	document.getElementById("idBotao2").addEventListener("click", pedeNoticia2);
}

function pedeNoticia1() {
	httpReq1 = createRequest();
	httpReq1.onreadystatechange = poeNoticia1;
	httpReq1.open("GET", "noticia1.txt", true);
	httpReq1.send(null);
}

function poeNoticia1() {
	if(httpReq1.readyState == 4) {
		if(httpReq1.status == 200) {
			var texto = httpReq1.responseText;
			console.log(httpReq1.readyState);
			
			document.getElementById("idNoticia1").appendChild(document.createTextNode(texto));
		} else {
			document.getElementById("idNoticia1").appendChild(document.createTextNode("Erro" + httpReq1.status));
		}
	}
}

function pedeNoticia2(){
	httpReq2 = createRequest();
	httpReq2.open("GET", "noticia2.txt", true);
	httpReq2.onreadystatechange = function () {
		if(httpReq2.readyState == 4) {
			if(httpReq2.status == 200) {
				var texto = httpReq2.responseText;
				console.log(httpReq2.readyState);
				
				document.getElementById("idNoticia2").appendChild(document.createTextNode(texto));
			} else {
				document.getElementById("idNoticia2").appendChild(document.createTextNode("Erro" + httpReq2.status));
			}
		}
	};
	httpReq2.send(null);
}