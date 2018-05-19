package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Noticia")
public class Noticia extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.err.println("numero = " + request.getParameter("numero"));
		
		String noticia1 = "Governo revê de R$ 969 para R$ 965 previsão para o salário mínimo de 2018";
		String noticia2 = "Temer assina MPs para cumprir meta fiscal e deve prorrogar Refis";
		String noticia3 = "Tiroteio perto de escola na Baixada Fluminense leva pânico a alunos e funcionários";
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		if(request.getParameter("numero").equals("1"))
			out.println(noticia1);
		else
			out.println(noticia2);
		
		out.println(noticia1);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.err.println("numero = " + request.getParameter("numero"));
		
		String noticia3 = "Tiroteio perto de escola na Baixada Fluminense leva pânico a alunos e funcionários";
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		
		out.println(noticia3);
	}

}
