# Javascript
Não vou passar pelo básico de programação pois custaria muito tempo. Nem de html ou css.  

## Usando javascript
Um código html normalmente é assim  

pagina.html
```HTML
<html>
  <head>
  
  </head>
  <body>
  
  </body>
</html>
```

Você apenas começa a usar javascript se for dentro da tag `<script>`  

pagina.html
```HTML
<html>
  <head>
  <script>
    var a = 10;
    var b = 20;
    var c = a + b;
    alert(c);
  </script>
  </head>
  <body>
  
  </body>
</html>
```

Como não fica nada elegante e pode deixar desorganizado, tentamos sempre separar o código html do código javascript, para isso declaramos na tag `<script>` onde está o código javascript que vamos ler.  

pagina.html  
```HTML
<html>
  <head>
  <script src="codigo.js">
  </script>
  </head>
  <body>
  
  </body>
</html>
```

codigo.js
```javascript
var a = 10;
var b = 20;
var c = a + b;
alert(c);
```

(src é abreviação para source)  
(o formato de código javascript é **.js**)  
Agora no inicio da página html ele copia tudo no arquivo **codigo.js** para dentro da tag `<script>`.  

## Eventos
Quando um determinado evento ocorre, ele chama uma função relacionado a esse evento.  
Para ver a lista completa de eventos: [Eventos](https://www.w3schools.com/jsref/dom_obj_event.asp)  

Sempre que quisermos que algo aconteça após um evento, relacionamos uma função a esse evento.  

pagina.html  
```html
<p onclick="nomeDoMetodo">Texto qualquer</p>
```

codigo.js
```javascript
function nomeDoMetodo() {
  // codigo
}
```

Como não queremos deixar coisas relacionadas a javascript na página html, o professor quer que não use `onclick="nomeDoMetodo"` já que chama uma função do javascript. Ele quer que seja mais discreto.  

Para isso vamos usar o evento onload que faz algo acontecer assim que a página termina de carregar. Vamos criar uma função inicia e chamar ela quando terminar de carregar.  

codigo.js
```javascript
onload = inicia;

function inicia() {
  // codigo
}
```

Agora como iremos fazer um certo elemento html ter um evento? Teremos que referênciar esse elemento de alguma maneira, usaremos o atributos id.  

pagina.html
```html
<p id="asdf">Texto qualquer</p>
```

codigo.js
```javascript
onload = inicia;

function inicia() {
  var objeto = document.getElementById("asdf");
}
```

