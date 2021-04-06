package main;

import java.sql.*;

public class Conector {

	String driveName = "org.gjt.mm.mysql.Driver";
	String serverName = "localhost";
	String database = "AULAS_NOITE_2019";
	String url = "jdbc:mysql://localhost/AULAS_NOITE_2019?useTimezone=true&serverTimezone=UTC";
	String user = "root";
	String pass = "*******";
	
	Connection connection;
	Statement statement;
	ResultSet resultSet;

//deveria ser vendas ao invés de times, mas essa tabela não existe no backup ou na base atual (24)
//deveria ser quantidade ao invés de publico (30)
	public void conectar() {
		try {
			connection = DriverManager.getConnection(url, user, pass);
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM times");
			
			resultSet.beforeFirst();
			System.out.println("Nome - Público");
			while(resultSet.next()) {
				String nome = resultSet.getString("nome");
				int publico = resultSet.getInt("publico");
				System.out.println(nome + " - " + publico);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Erro na conexão");
		}
	}
	
	public static void main(String[] args) {
		Conector conector = new Conector();
		conector.conectar();
	}

}
