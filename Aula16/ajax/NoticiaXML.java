package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticiaXML
 */
@WebServlet("/NoticiaXML")
public class NoticiaXML extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/xml");
		
		out.println("<?xml version='1.0' encoding='UTF-8'?><noticia>    <titulo>Salário Mínimo</titulo>    <texto>        Governo revê de R$ 969 para R$ 969 previsão para o salário minimo de 2018    </texto></noticia>");
	}

}
