# Aula 8

## Cookies
Antes de falar de cookies, vamos falar de session.  

Session armazena temporariamente as informações no seu navegador mas são perdidas ao fecha-lo. Outro nome que podemos dar para isso é **session cookie**. Ou seja, sessions são cookies.  

**Session cookies**: Apagam as informações ao fechar o navegador.  
**Persistent cookies**: A informações são armazenadas no HD para futuro uso.  

O que vamos referenciar como "cookies" vai ser o "persistent cookies", que ficam armazenados mesmo se fechar o navegador.  
Cookies tem um tempo de validade, ou seja, o servidor não aceita se a validade estiver expirada.  

### Criar cookies
Como cria um cookie? Usando o objeto Cookie  
```Java
Cookie cookie = new Cookie("nome", "valor");
```

Note que você tem que criar o cookie, e ainda vai ter que passar ele para o usuário.  
Objetos cookies não armazenam qualquer objeto que nem session/application/request, cookies armazenam um nome e um valor do tipo String.  

### Enviar cookies
Como passamos esse cookie criado para o usuário?  
```Java
Cookie cookie = new Cookie("nome", "valor");
response.addCookie(cookie);
```

Você talvez queira adicionar mais detalhes ao cookie antes de adicionar.  
```Java
Cookie cookie = new Cookie("nome", "valor");
cookie.setMaxAge(60*60*24*7);
response.addCookie(cookie);
```

Agora esse cookie tem a validade de 7 dias (uma semana).  
Após essa data o servidor não aceita mais esse cookie.  

### Pegar cookies
Ler cookies mandados pelo usuário não é algo tão fácil quanto pegar informações de session ou request.  
O usuário não vai te mandar o cookie que você quer, ele simplesmente manda todos os cookies que ele tem do seu servidor. Resta a você pegar o que você quer.  

Os cookies passados pelo usuário estão dentro de request.  
```Java
Cookie lista_de_cookies[] = request.getCookies();
if(lista_de_cookies != null)
  System.out.println("Tem cookies");
else
  System.out.println("Não tem cookies");
```

Nesse exemplo você pegous os cookies (note que é um vetor) e verificou se realmente existe algo naquela variável ou se trouxe null.  
Após isso você ainda tem que passar por todos os cookies e ver se é o cookie que você procura.  
```Java
Cookie lista_de_cookies[] = request.getCookies();
if(lista_de_cookies != null) {
  for(int i=0; i < lista_de_cookies.length; i++) {
    if(lista_de_cookies[i].getName().equals("exemplo")) {
      // ENCONTROU O COOKIE QUE QUERIA
      break;
    }
  }
}
```

Claro que seria sensato salvar o cookie em uma variável e fazer desse procedimento um método.  
```Java
public Cookie getCookie(String name) {
  Cookie cookie = null;
  Cookie lista_de_cookies[] = request.getCookies();
  if(lista_de_cookies != null) {
    for(int i=0; i < lista_de_cookies.length; i++) {
      if(lista_de_cookies[i].getName().equals(name)) {
        cookie = lista_de_cookies[i];
        break;
      }
    }
  }
  
  return cookie;
}
```
