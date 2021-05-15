package khoa.code.model;
//de connect duoc toi sql thoi thi cung du met dung la vay do ma vay thi lam cai gi bay gio /??
// dieu nay can xac dinh lai:

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class MyConnect {
	private static Connection connect=null;
	public static Connection getConnection() throws SQLException {
		if(connect==null) {
			try {
				System.out.print("Chuan bi ket noi");
				//System.setProperty("javax.xml.bind.JAXBContextFactory", "org.eclipse.persistence.jaxb.JAXBContextFactory");

				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				connect=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ShoesShop;user=sa;password=khoabaria12345");
				System.out.println("connect successfull");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print("Khong ket noi duoc");
				e.printStackTrace();
			}
		}
		return connect;
	}
}
