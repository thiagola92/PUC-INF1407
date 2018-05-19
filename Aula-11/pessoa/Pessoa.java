package br.com.meslin.pessoa;

public class Pessoa
{
	private String nome;
	private Endereco endereco;
	public String getNome()
	{
		return nome;
	}
	public void setNome(String nome)
	{
		this.nome = nome;
	}
	public Endereco getEndereco()
	{
		return endereco;
	}
	public void setEndereco(Endereco endereco)
	{
		this.endereco = endereco;
	}
}
