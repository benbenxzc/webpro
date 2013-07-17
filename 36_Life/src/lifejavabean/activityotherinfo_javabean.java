package lifejavabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class activityotherinfo_javabean {
	Connection conn;  
	PreparedStatement  st;
	private  ResultSet rs;
	
	public activityotherinfo_javabean()throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/life";
        conn = DriverManager.getConnection(dbURL, "root",  "332600");
	}

}
