package br.com.thiagola92;

public class Info {
	
	private String nick;
	private String texto;
	private String ip;
	
	public Info() {
		super();
	}

	public Info(String nick, String texto, String ip) {
		super();
		this.nick = nick;
		this.texto = texto;
		this.ip = ip;
	}
	
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	

}
