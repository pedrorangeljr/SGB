package dao;

/*Classe responsavel pelas operações no banco de dados*/
import java.sql.Connection;

import conexao.SingleConnection;

public class DaoAluno {
	
	private static Connection connection;
	
	public DaoAluno() {
		
		connection = SingleConnection.getConnection();
	}

	/*Metodo para salvar alunos*/
	
	
}
