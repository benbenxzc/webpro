package lifejavabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class friend_javabean {
	
	
	Connection conn;  
	PreparedStatement  st;
	private  PreparedStatement getfriend;
	private  PreparedStatement insertfriend;
	private  PreparedStatement deletefriend;

	private  PreparedStatement getMaxId;
	private  ResultSet rs;
	
	public friend_javabean() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/life?useUnicode=true&characterEncoding=UTF-8"; 
       
	    conn = DriverManager.getConnection(dbURL, "root", "332600");
	    insertfriend=conn.prepareStatement(SQL.INSERTFRIEND_SQL);
	    getfriend=conn.prepareStatement(SQL.GETFRIEND_SQL);
		deletefriend=conn.prepareStatement(SQL.DELETEFRIEND_SQL);
		}
	
	public boolean deletefriend(int userid1,int userid2)throws SQLException{
		getfriend.setInt(1,userid1);
		rs=getfriend.executeQuery();
		if(rs.next()){
			
			deletefriend.setInt(1,userid1);
			deletefriend.setInt(2,userid2);
			deletefriend.executeUpdate();
			return true;
			
		}
		return false;
		
	}
	
	
	
	public boolean addfriend (int userid1,int userid2  )throws SQLException {
		
		getfriend.setInt(1,userid1);
		rs=getfriend.executeQuery();
		if(!rs.next())
		{
			insertfriend.setInt(1,userid1);
			insertfriend.setInt(2,userid2);
			return true;
		}
		else return false;
		
	}
	
	
	public Vector getfriendinfo(int userid1) throws SQLException{
		Vector<Comparable> FriendInformation = new Vector();
		getfriend.setInt(1,userid1);
		rs=getfriend.executeQuery();
		while(rs.next()){
			FriendInformation.add(rs.getInt("userid2"));
			
			
		}
		return FriendInformation;
		
		}
	
	
	
	
}
