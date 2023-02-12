package context;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBContext1 {
	public static DataSource getDatasource() {
		try {
			InitialContext initContext = new InitialContext();
			
			Context env = (Context) initContext.lookup("java:comp/env");
			
			return (DataSource)env.lookup("jdbc/shoppingdb");
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Connection getConnection() {
		try {
			return getDatasource().getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
	}
}
