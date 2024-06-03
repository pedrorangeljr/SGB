package dao;

/*Classe responsavel pelas operações no banco de dados*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.eclipse.jdt.internal.compiler.util.HashtableOfObjectToInt;

import com.mysql.cj.xdevapi.Result;

import conexao.SingleConnection;
import model.ModelAluno;

public class DaoAluno {

	private static Connection connection;

	public DaoAluno() {

		connection = SingleConnection.getConnection();
	}

	/* Metodo para salvar alunos */

	public ModelAluno salvarAluno(ModelAluno aluno) {

		try {
			
			if(aluno.isNovo()) {
				
				String sql = "insert into tbaluno (nome,telefone,cpf,cep,logradouro,numero,bairro,cidade,uf) values"
						+ "(?,?,?,?,?,?,?,?,?)";
				PreparedStatement insert = connection.prepareStatement(sql);

				insert.setString(1, aluno.getNome());
				insert.setLong(2, aluno.getTelefone());
				insert.setString(3, aluno.getCpf());
				insert.setString(4, aluno.getCep());
				insert.setString(5, aluno.getLogradouro());
				insert.setString(6, aluno.getNumero());
				insert.setString(7, aluno.getBairro());
				insert.setString(8, aluno.getCidade());
				insert.setString(9, aluno.getUf());
				insert.execute();

				connection.commit();
				
			}else {
				
				String sql = "update tbaluno set nome = ?, set telefone = ?, set cep = ?, set logradouro = ?, set numero = ?,"
						+ "set bairro = ?, set cidade = ?, set uf = ? where idAluno = "+aluno.getIdAluno()+"";
				PreparedStatement update = connection.prepareStatement(sql);
				
				update.setString(1, aluno.getNome());
				update.setLong(2, aluno.getTelefone());
				update.setString(3, aluno.getCep());
				update.setString(4, aluno.getLogradouro());
				update.setString(5, aluno.getNumero());
				update.setString(6, aluno.getBairro());
				update.setString(7, aluno.getCidade());
				update.setString(8, aluno.getUf());
				
				update.executeUpdate();
				
				connection.commit();
				
			}
			
			return this.consultarAluno(aluno.getNome());

		} catch (Exception e) {

			try {

				connection.rollback();

			} catch (SQLException e1) {

				e1.printStackTrace();
			}

			e.printStackTrace();
		}

		return aluno;
	}

	/* Metodo que consulta Aluno pelo CPF */

	public ModelAluno consultarAluno(String nome) throws Exception {

		ModelAluno aluno = new ModelAluno();

		String sql = "select * from tbaluno where upper(nome) = upper('?')";
		PreparedStatement consultar = connection.prepareStatement(sql);

		ResultSet resultado = consultar.executeQuery();

		while (resultado.next()) {

			aluno.setIdAluno(resultado.getLong("id"));
			aluno.setNome(resultado.getString("nome"));
			aluno.setTelefone(resultado.getInt("telefone"));
			aluno.setCpf(resultado.getString("cpf"));
			aluno.setCep(resultado.getString("cep"));
			aluno.setLogradouro(resultado.getString("logradouro"));
			aluno.setNumero(resultado.getString("numero"));
			aluno.setBairro(resultado.getString("bairro"));
			aluno.setCidade(resultado.getString("cidade"));
			aluno.setUf(resultado.getString("uf"));

		}

		return aluno;
	}

	/* Metodo que não deixa gravar usuario com mesmo cpf */

	public boolean validarCpf(String cpf) throws Exception {

		String sql = "select count(1) > 0 as existe from tbaluno where cpf = '" + cpf + "'";
		PreparedStatement validar = connection.prepareStatement(sql);
		ResultSet resultado = validar.executeQuery();

		resultado.next();

		return resultado.getBoolean("existe");

	}
}
