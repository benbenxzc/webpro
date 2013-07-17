package lifejavabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class comment_javabean {

	Connection conn;  
	PreparedStatement  st;
	private  PreparedStatement insertcomment;
	private  PreparedStatement getcomment;	
	private  PreparedStatement getcommentinfo;

	private  PreparedStatement updatecomment;

	private  PreparedStatement getMaxId;
	private  ResultSet rs;

	public comment_javabean() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/life?useUnicode=true&characterEncoding=UTF-8"; 
       
	    conn = DriverManager.getConnection(dbURL, "root", "332600");
	    insertcomment=conn.prepareStatement(SQL.INSERTCOMMENT_SQL);
	    getcomment=conn.prepareStatement(SQL.GETCOMMENT_SQL);
	    updatecomment=conn.prepareStatement(SQL.UPDATECOMMENT_SQL);
	    getcommentinfo=conn.prepareStatement(SQL.GETCOMMENTINFO_SQL);
	   /* getfriend=conn.prepareStatement(SQL.GETFRIEND_SQL);
		deletefriend=conn.prepareStatement(SQL.DELETEFRIEND_SQL);*/
		
	}
	
	public boolean insertcomment(int userid,String activityname, String cuploadtime, String comcontent)throws SQLException
	{

		getcomment.setInt(1, userid);
		getcomment.setString(2, activityname);

		rs = getcomment.executeQuery();
		if(rs.next()) return false;
		else{
			
			
			insertcomment.setInt(1,userid);
			insertcomment.setString(2,activityname);
			insertcomment.setString(3,cuploadtime);
			insertcomment.setString(4,comcontent);
			return true;
		}
		
		}
	
	
	public boolean updatecomment(String comcontent, int userid, String activityname)throws SQLException{
		
		updatecomment.setString(1,comcontent);
		updatecomment.setInt(2,userid);
		updatecomment.setString(3,activityname);
		int count=updatecomment.executeUpdate();
		if(count>0)return true ;
		else return false;
		
		
	}
	public  Vector getcommentinfo(String activityname) throws SQLException
	{
		Vector<Comparable> commentinfo = new Vector();
		   getcommentinfo.setString(1, activityname);
		rs = getcommentinfo.executeQuery();
		if(rs.next()){
			
			commentinfo.add(rs.getInt("userid"));
			commentinfo.add(rs.getString("comcontent"));
			commentinfo.add(rs.getString("cuploadtime"));
		
		}
		return commentinfo;	
		}
	
}