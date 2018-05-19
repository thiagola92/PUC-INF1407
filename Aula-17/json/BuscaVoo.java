package json;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

@WebServlet("/BuscaVoo")
public class BuscaVoo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject voo = new JSONObject();
		voo.put("aircraft", "A320");
		voo.put("maxPax", 200);
		
		JSONObject piloto = new JSONObject();
		piloto.put("firstName", "John");
		piloto.put("lastName", "Doe");
		voo.put("pilot", piloto);
		
		voo.accumulate("passenger", "George");
		voo.accumulate("passenger", "Thomas");
		
		// enviar os dados no formato JSON
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		out.println(voo.toString(2));
	}

}
