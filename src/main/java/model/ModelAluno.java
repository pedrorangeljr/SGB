package model;

import java.io.Serializable;

public class ModelAluno implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long idAluno;
	private String nome;
	private int telefone;
	private String cpf;
	private String cep;
	private String logradouro;
	private String numero;
	private String bairro;
	private String cidade;
	private String uf;
	
	public boolean isNovo() {
		
		if(this.idAluno == null) {
			
			return true;
			
		}else if(this.idAluno != null && this.idAluno > 0) {
			
			return false;
		}
		
		return idAluno == null;
	}
	
	public Long getIdAluno() {
		return idAluno;
	}
	public void setIdAluno(Long idAluno) {
		this.idAluno = idAluno;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getTelefone() {
		return telefone;
	}
	public void setTelefone(int i) {
		this.telefone = i;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	
}
