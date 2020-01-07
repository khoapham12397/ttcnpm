package khoa.code.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnect {
	private static Connection connect=null;
	public static Connection getConnection() throws SQLException {
		if(connect==null) {
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				connect=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ShoesShop;user=sa;password=khoabaria12345");
				System.out.println("connect successfull");
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return connect;
	}
}
