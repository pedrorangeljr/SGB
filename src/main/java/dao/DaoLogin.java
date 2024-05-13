package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.SingleConnection;
import model.ModelLogin;

public class DaoLogin {

	private static Connection connection;
	
	public DaoLogin() {
		
		connection = SingleConnection.getConnection();
	}
	
	/*Metodo para vericar se existe usuario no banco*/
	public boolean validarLogin(ModelLogin login) throws Exception {
		
		String sql = "select * from login where upper(email) = upper(?) and upper(senha) = upper(?)";
		PreparedStatement select = connection.prepareStatement(sql);
		select.setString(1, login.getEmail());
		select.setString(2, login.getSenha());
		
		ResultSet resultado = select.executeQuery();
		
		if(resultado.next()) {
			
			return true;
		}
		else {
			
			return false;
		}
	}
}
