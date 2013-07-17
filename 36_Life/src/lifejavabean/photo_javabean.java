package lifejavabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class photo_javabean {
	Connection conn;  
	PreparedStatement  st;

	private  PreparedStatement insertphoto;
	private  PreparedStatement getphoto;
	private  PreparedStatement getphotobylocation;

    private  PreparedStatement deletephoto;
    private  PreparedStatement getMaxId;

    private  ResultSet rs;
    
    
    public photo_javabean() throws ClassNotFoundException, SQLException{
    	Class.forName("com.mysql.jdbc.Driver");
        String dbURL = "jdbc:mysql://localhost:3306/life"; 
       
	    conn = DriverManager.getConnection(dbURL, "root",  "332600");
	    insertphoto = conn.prepareStatement(SQL.INSERTPHOTO_SQL);
	    getphoto = conn.prepareStatement(SQL.GETPHOTO_SQL);
	    deletephoto = conn.prepareStatement(SQL.DELETEPHOTO_SQL);
	    getMaxId = conn.prepareStatement("SELECT MAX(photoid) FROM photo");
	    getphotobylocation=conn.prepareStatement("SQL.GETPHOTOBYLOCATION_SQL");
    	
    	 }
    
    
    public int getMaxUserId() throws SQLException
	{
		rs = getMaxId.executeQuery();
		if(rs.next())	return rs.getInt(1);
		else return 1;
	}
    
    
    public boolean insertphoto(int photoid,int userid,String description,String uploadtime,String location)throws SQLException{
    	
    	insertphoto.setInt(1,photoid);
    	insertphoto.setInt(2,userid);
    	insertphoto.setString(3,description);
    	insertphoto.setString(4,uploadtime);
    	insertphoto.setString(5,location);
    	insertphoto.executeUpdate();
    	return true;
    	
    	}
	public  Vector<String> getPhotoInfo(int userid) throws SQLException
	{
		Vector<String> photoinfo = new Vector<String>();
		getphoto.setInt(1,userid);
		try {	
			rs = getphoto.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		while(rs.next())
		{
			
			photoinfo.add(rs.getString("description"));
			photoinfo.add(rs.getString("uploadtime"));
			photoinfo.add(rs.getString("location"));
		}
		return photoinfo;
		}
    
	
	public boolean deletephoto(String location)throws SQLException{
		
		getphotobylocation.setString(1,location);
		rs=getphotobylocation.executeQuery();
		if(rs.next()){
			deletephoto.setString(1,location);
		
			deletephoto.executeUpdate();
			return true;
		}
		else return false;
		
	}
	
	
	
	
	

}
