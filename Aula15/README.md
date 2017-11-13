# Ajax
(**A**synchronous **J**avascript **A**nd **X**ML)  
Ajax permite você fazer pedido para o servidor, você não precisa mais pedir uma página pronta, você pode apenas fazer um pedido por uma certa informação (XML).  

Usamos o protocolo HTTP para passar informação do server para o cliente, no nosso caso estaremos passando um arquivo XML.  

## XMLHttpRequest
O objeto que faz toda a transição de informação e trata a informação recebida é o **XMLHttpRequest**, incluido em todos os browsers modernos.  
```Javascript
var xmlhttp;
xmlhttp = XMLHttpRequest();
```

O que pode ocorrer é o navegador não ser compatível, por isso precisamos usar try e catch.  
```Javascript
var xmlhttp;

try {
  xmlhttp = XMLHttpRequest();
} catch(exception) {
  // Já que não tem o objeto XMLHttpRequest, você deve estar usando um navegador antigo, antes do Internet Explorer 7.  
  xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
  try {
    // Se chegou aqui você deve estar usando algo ancestral 
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  } catch(exception) {
    // Navegador não compatível
    xmlhttp = null;
  }
}
```
