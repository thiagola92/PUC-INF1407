# Aula 9
Aula falando sobre servlet.

## JavaBeans
São os elementos que vão transitar entre HTML/JSP e o código Java.  
A idéia é separar código de java de código para layout.  

## Servlet
É justamente a parte Java onde vamos escrever o código, vamos começar a escrever no servlet o código em vez de escrever no arquivo JSP.  

```Java
@WebServlet("/Exemplo")
public class Exemplo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  public Exemplo() {
    //construtor
  }
}
```

Como você pode ver servelet é nada mais que uma classe java simples. A primeira linha `@WebServlet("/Exemplo")` diz qual o endereço virtual, ou seja, qual link o server/client devem acessar para serem redirecionados para esse servlet.  

Vamos supor que temos um formulário em uma página  
```JSP
<form action="Exemplo" method="get">
<input type="text" name="information">
<input type="submit">
</form>
```
Como o nosso servlet está no link /Exemplo, o formulário será mandado para o servlet quando clicar no botão.  

Quando você clica no botão, você diz que quer ir para a página /Exemplo e que ela trate o "get". O problema é que o método que trata "get" não existe no nosso formulário. O formulário que trata "get" se chama  
```Java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
}
```

Como você pode ver ele recebe request e response, com essas informações ele interage como iriam normalmente.  
Lembra quando você escrevia dentro de um JSP `request.getParameter("information")`? É como se você estivesse fazendo essa chamada justamente dentro desse método.  

Nosso código está assim  
```Java
@WebServlet("/Exemplo")
public class Exemplo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  public Exemplo() {
    //construtor
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
```

Mas note que esse método trata apenas o "get", se quiser tratar o "post" você precisa do método que trata o post (funciona igual ao do get só que outro nome).  
```Java
@WebServlet("/Exemplo")
public class Exemplo extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  public Exemplo() {
    //construtor
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
```

## Obtendo objetos (session, cookies, application)
Obtendo pageContext:  
`PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);`

Objeto application:  
`ServletContext Application = pageContext.getServletContext();`

Objeto session:  
`HttpSessioin session = request.getSession();`

Objeto request:  
Já é passado como parâmetro 

Objeto response:  
Já é passado como parâmetro

Objeto dispatcher:  
`request.getRequestDispatcher("").forward(request, response);`

Objeto out:  
`PrintWriter out = response.getWriter();`

Objeto page:
`page = this;`
