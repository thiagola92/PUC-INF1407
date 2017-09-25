package br.com.meslin.pessoa;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
		description = "Cria uma pessoa", 
		urlPatterns = { 
				"/ServletPessoa", 
				"/2017-09-20/ServletPessoa"
		})
public class ServletPessoa extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Pessoa pessoa = new Pessoa();
		pessoa.setNome("Maria");
		
		Endereco endereco = new Endereco();
		endereco.setLogradouro("Rua que sobe e desce");
		endereco.setNumero(8752);
		endereco.setBairro("Muito Longe");
		pessoa.setEndereco(endereco);
		
		request.setAttribute("pessoa", pessoa);
		request.getRequestDispatcher("mostraPessoa.jsp").forward(request, response);
	}
}
