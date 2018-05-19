package br.pucrio.trab4;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

@WebServlet("/servlet/Velocidade")
public class Velocidade extends HttpServlet {
	private int velocidade = 10;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			Thread.sleep((long) (6000 + Math.random() * 2000));
		}
		catch (InterruptedException e)
		{
			System.err.println("[Servlet Velocidade] Erro 8752 em sleep");
			return;
		}
		try
		{
		if(!(request.getParameter("user").equals("eu") && request.getParameter("pass").equals("!@#$%*()_+=")))
			return;
		}
		catch(Exception e)
		{
			return;
		}
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		velocidade += Math.random()<0.5? 1:-1;
		JSONObject velocidadeJSON = new JSONObject();
		velocidadeJSON.put("velocidade", velocidade);
		out.print(velocidadeJSON);
	}
}
