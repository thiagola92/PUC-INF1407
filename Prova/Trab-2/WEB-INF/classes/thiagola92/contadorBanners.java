package thiagola92;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

@WebServlet("/contadorBanners")
public class contadorBanners extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public contadorBanners() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numberString = request.getParameter("number");
		Integer number = Integer.parseInt(numberString);
		
		PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 8192, true);
		ServletContext application = pageContext.getServletContext();
		Banners banners = (Banners)application.getAttribute("banner");
		
		banners.incrementar(number);
		
		String bannerUrl = banners.getLink(number);
		response.sendRedirect(bannerUrl);
	}

}
