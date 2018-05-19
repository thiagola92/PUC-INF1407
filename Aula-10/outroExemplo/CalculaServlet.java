package pacote;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalculaServlet")
public class CalculaServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// obter dados
		String s0p1 = request.getParameter("operando1");
		String s0p2 = request.getParameter("operando2");
		String operacao = request.getParameter("operacao");
		
		// processar dados
		double operando1 = Double.parseDouble(s0p1);
		double operando2 = Double.parseDouble(s0p2);
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
		CalculaBean bean = new CalculaBean();
		bean.setOp1(operando1);
		bean.setOp2(operando2);
		bean.setOperador(operacao);
		bean.setResultado(resultado);
		request.setAttribute("conta", bean);
		request.getRequestDispatcher("calculadora/resultado.jsp").forward(request, response);
		
	}

}
