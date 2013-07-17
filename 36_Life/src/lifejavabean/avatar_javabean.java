package lifejavabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class avatar_javabean {
	Connection conn;  
	PreparedStatement st;
	private  ResultSet rs;
	
	private  PreparedStatement insertRoute;
	private  PreparedStatement updateRoute;
	private  PreparedStatement getRoute;
	
	public avatar_javabean() throws ClassNotFoundException, SQLException
	{
		//Connect to the mysql
	    Class.forName("com.mysql.jdbc.Driver");
           String dbURL = "jdbc:mysql://localhost:3306/life?useUnicode=true&characterEncoding=UTF-8"; 
          
	    conn = DriverManager.getConnection(dbURL, "root", "332600");
	    
	    insertRoute = conn.prepareStatement(SQL.INSERTROUTE_SQL);
	    updateRoute = conn.prepareStatement(SQL.UPDATEROUTE_SQL);
	    getRoute = conn.prepareStatement(SQL.GETROUTE_SQL);
	}
	
	public boolean insertRoute(int userId, String imageRoute)throws SQLException
	{
		insertRoute.setInt(1, userId);
		insertRoute.setString(2, imageRoute);
		int count = insertRoute.executeUpdate();
		if(count > 0)return true;
		else return false;
	}
	
	public boolean updateRoute(int userId, String imageRoute)throws SQLException
	{
		updateRoute.setString(1, imageRoute);
		updateRoute.setInt(2, userId);
		int count = insertRoute.executeUpdate();
		if(count > 0)return true;
		else return false;
	}
	
	public String getRoute(int userId)throws SQLException
	{
		getRoute.setInt(1, userId);
		rs = getRoute.executeQuery();
		if(rs.next())
		{
			return rs.getString("imageroute");
		}
		else
		{
			return null;
		}
	}
}
