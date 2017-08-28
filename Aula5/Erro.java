package br.com.thiagola92.cadastro;

public class Erro {
	private int numero;
	private String descricao;
	private String acao;
	
	public Erro(int numero, String descricao, String acao) {
		super();
		this.numero = numero;
		this.descricao = descricao;
		this.acao = acao;
	}
	
	public Erro() {
		super();
	}

	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getAcao() {
		return acao;
	}
	public void setAcao(String acao) {
		this.acao = acao;
	}
	
	
}
