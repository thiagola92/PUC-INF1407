/**
 * 
 */


onload = function() {
	document.getElementById('idBotao1').addEventListener('click', pedeNoticia1);
	document.getElementById('idBotao2').addEventListener('click', pedeNoticia2);
}

function pedeNoticia1() {
	var httpReq = createRequest();
	httpReq.open('GET', 'noticia1.xml', true);
	httpReq.onreadystatechange = function() {
		if(httpReq.readyState == 4) {
			if(httpReq.status == 200) {
				// OK
				var resposta = httpReq.responseXML;
				console.log("Resposta = " + resposta);
				
				var titulo = resposta.getElementsByTagName('titulo');
				console.log('Titulo = ' + titulo);
				
				var textoTitulo = titulo.firstChild;
				console.log("Texto = " + textoTitulo);
				
				var lugar = document.getElementById('idNoticia1');
				var h1 = document.createElement('h1');
				h1.appendChild(document.createTextNode(textoTitulo))
				lugar.appendChild(h1);
				
				var conteudo = resposta.getElementsByTagName("texto")[0].firstChild.nodeValue;
				var paragrafo = document.createElement("p");
				paragrafo.appendChild(document.createTextNode(conteudo))
				lugar.appendChild(paragrafo);
			} else {
				// erro
				console.log("Deu erro");
			}
		}
	}
	httpReq.send(null);
}

function pedeNoticia2() {
	var httpReq = createRequest();
	httpReq.open("GET", "noticia2.xml", true);
	httpReq.onreadystatechange = function() {
		if(httpReq.readyState = 4) {
			if(httpReq.status == 200) {
				var resposta = httpReq.responseXML.documentElement;
				var h1 = document.createElement('h1');
				h1.appendChild(resposta.getElementsByTagName('titulo')[0].firstChild.nodeValue);
				
				var lugar = document.getElementById("idNoticia2");
				lugar.appendChild(h1);
				
				var paragrafos = resposta.getElementsByTagName("p");
				for(var i=0; i<paragrafos.length; i++) {
					var paragrafo = document.createElement("p");
					paragrafo.appendChild(document.createTextNode(paragrafos[i].firstChild.nodeValue));
				}
			} else {
				
			}
		}
	}
	httpReq.send(null);
}

function pedeNoticia3() {
	var httpReq = createRequest();
	httpReq.open("GET", "NoticiaXML", true);
	httpReq.onreadystatechange = function() {
		if(httpReq.readyState = 4) {
			if(httpReq.status == 200) {
				var resposta = httpReq.responseXML.documentElement;
				var h1 = document.createElement('h1');
				h1.appendChild(resposta.getElementsByTagName('titulo')[0].firstChild.nodeValue);
				
				var lugar = document.getElementById("idNoticia3");
				lugar.appendChild(h1);
				
				var paragrafos = resposta.getElementsByTagName("p");
				for(var i=0; i<paragrafos.length; i++) {
					var paragrafo = document.createElement("p");
					paragrafo.appendChild(document.createTextNode(paragrafos[i].firstChild.nodeValue));
				}
			} else {
				
			}
		}
	}
	httpReq.send(null);
}