package dao;

/*Classe responsavel pelas operações no banco de dados*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.Result;

import conexao.SingleConnection;
import model.ModelAluno;

public class DaoAluno {
	
	private static Connection connection;
	
	public DaoAluno() {
		
		connection = SingleConnection.getConnection();
	}

	/*Metodo para salvar alunos*/
	
	public void salvarAluno(ModelAluno aluno) {
		
		try {
			
			String sql = "insert into tbaluno (nome,telefone,cpf,cep,logradouro,numero,bairro,cidade,uf) values"
					+ "(?,?,?,?,?,?,?,?,?)";
			PreparedStatement insert = connection.prepareStatement(sql);
			
			insert.setString(1, aluno.getNome());
			insert.setLong(2, aluno.getTelefone());
			insert.setString(3, aluno.getCpf());
			insert.setString(4, aluno.getCep());
			insert.setString(5, aluno.getLogradouro());
			insert.setString(6,aluno.getNome());
			insert.setString(7, aluno.getBairro());
			insert.setString(8, aluno.getCidade());
			insert.setString(9, aluno.getUf());
			insert.execute();
			
			connection.commit();
			
		} catch (Exception e) {
			
			try {
				
				connection.rollback();
				
			} catch (SQLException e1) {
				
				e1.printStackTrace();
			}
			
			e.printStackTrace();
		}
	}

	public boolean validarCpf(String cpf) throws Exception {
		
		String sql = "select count(1) as quantidade from tbaluno where cpf = '"+cpf+"'";
		PreparedStatement validar = connection.prepareStatement(sql);
		ResultSet resultado = validar.executeQuery();
		
		if(resultado.next()) {
			
			return resultado.getInt("quantidade") <= 0;
		}
		
		return false;
	}
}