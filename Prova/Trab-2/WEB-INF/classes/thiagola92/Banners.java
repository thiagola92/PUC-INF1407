package thiagola92;

import java.util.ArrayList;
import java.util.Random;

public class Banners {
	
	ArrayList<String> url = new ArrayList<String>();
	ArrayList<String> nomeDoBanner = new ArrayList<String>();
	ArrayList<Integer> contagem = new ArrayList<Integer>();
	
	int number = 0;
	
	public Banners() {
		// Definindo qual banner vai aparecer
		Random random = new Random();
		number = Math.abs(random.nextInt() % 4);
		
		// Banners oferecidos
		url.add("http://www.puc-rio.br");
		nomeDoBanner.add("banner-PUC");
		contagem.add(0);
		url.add("http://www.inf.puc-rio.br");
		nomeDoBanner.add("banner-DI");
		contagem.add(0);
		url.add("http://dad.puc-rio.br");
		nomeDoBanner.add("banner-DAD");
		contagem.add(0);
		url.add("http://java.com");
		nomeDoBanner.add("banner-Java");
		contagem.add(0);
	}
	
	public String getUrl() {
		return url.get(number);
	}
	
	public String getLink(int i) {
		return url.get(i);
	}
	
	public String getNomeDoBanner() {
		int bannerAtual = number;
		
		// Definindo qual vai ser o próximo banner
		Random random = new Random();
		number = Math.abs(random.nextInt() % 4);
		
		return nomeDoBanner.get(bannerAtual);
	}

	public int getNumber() {
		return number;
	}
	
	public ArrayList<Integer> getContagem() {
		return contagem;
	}
	
	public void incrementar(int i) {
		int valor = contagem.get(i);
		contagem.set(i, valor+1);
	}

}
