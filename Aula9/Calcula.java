package br.com.meslin.calculadora;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calcula
 */
@WebServlet(
		description = "Calcula as 4 operações",
		urlPatterns = { "/calculadora/Calcula" })
public class Calcula extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calcula() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// obter dados
		String s0p1 = request.getParameter("operando1");
		String s0p2 = request.getParameter("operando2");
		String operacao = request.getParameter("operacao");
		
		// processar dados
		double operando1 = Double.parseDouble(s0p1);
		double operando2 = Double.parseDouble(s0p1);
		double resultado = 0;
		
		if(operacao.equals("+")) {
			resultado = operando1 + operando2;
		} else if(operacao.equals("-")) {
			resultado = operando1 - operando2;
		} else if(operacao.equals("/")) {
			resultado = operando1 / operando2;
		} else if(operacao.equals("x")) {
			resultado = operando1 * operando2;
		} else {
			// ERRO!!!
			request.setAttribute("tipoErro", "operacao invalida");
			request.getRequestDispatcher("../erros/erro.jsp").forward(request, response);
			return;
		}
		
		// encaminhar resultados para o visual
		request.setAttribute("resultado", new Double(resultado));
		request.getRequestDispatcher("resultado.jsp").forward(request, response);
		
	}

}
