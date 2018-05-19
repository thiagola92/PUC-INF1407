package br.pucrio.trab4;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/Temperatura")
public class Temperatura extends HttpServlet {
	private int temperatura = 21;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			Thread.sleep((long) (6000 + Math.random() * 2000));
		}
		catch (InterruptedException e)
		{
			System.err.println("[Servlet Temperatura] Erro 8752 em sleep");
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
		temperatura += Math.random()<0.5? 1:-1;
		out.print("<?xml version=\"1.0\"?>");
		out.print("<temperatura><valor>" + temperatura + "</valor></temperatura>");
	}
}
