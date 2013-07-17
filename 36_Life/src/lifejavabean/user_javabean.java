package lifejavabean;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.naming.*;

public class user_javabean {
	Connection conn;  
	PreparedStatement  st;

	private  PreparedStatement validateUsername;
	private  PreparedStatement userRegisters;
	private  PreparedStatement userLogin;
	private  PreparedStatement userInfo;
	private  PreparedStatement getUserPwd;
	private  PreparedStatement updateUserPwd;
	private  PreparedStatement getMaxId;
	private  PreparedStatement updateSchool;
    private  PreparedStatement updateGender;
    private  PreparedStatement insertattend;
    private  PreparedStatement getUsername;


	private  ResultSet rs;
	
	public user_javabean() throws ClassNotFoundException, SQLException
	{
		//Connect to the mysql
	    Class.forName("com.mysql.jdbc.Driver");
           String dbURL = "jdbc:mysql://localhost:3306/life?useUnicode=true&characterEncoding=UTF-8"; 
          
	    conn = DriverManager.getConnection(dbURL, "root",  "332600");
	    userRegisters = conn.prepareStatement(SQL.USERREGISTER_SQL);
	    //赋值
	    validateUsername = conn.prepareStatement(SQL.VALIDATEUSERNAME_SQL);
	    getUsername = conn.prepareStatement(SQL.GETUSERNAME_SQL);
	    
	    userLogin = conn.prepareStatement(SQL.USERLOGIN_SQL);
	    userInfo = conn.prepareStatement(SQL.GETUSERINFO_SQL);
	    getUserPwd = conn.prepareStatement(SQL.GETPASSWORD_SQL);
	    updateUserPwd = conn.prepareStatement(SQL.UPDATEPWD_SQL);
	    updateSchool= conn.prepareStatement(SQL.UPDATESCHOOL_SQL);
	    updateGender = conn.prepareStatement(SQL.UPDATEGENDER_SQL);
	    getMaxId = conn.prepareStatement("SELECT MAX(userid) FROM user");
	    insertattend=conn.prepareStatement("SQL.INSERTATTEND_SQL");
	}
	
	public int getMaxUserId() throws SQLException
	{
		try{
			rs = getMaxId.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			else return 0;
		}
		catch(Exception e)
		{
			return 0;
		}
	}
	
	//user register api
	public  boolean userRegister(int userid, String username, String gender, String password, String school, String birthday, String homeland) throws SQLException
	{ 
		//System.out.print(username);
		userLogin.setString(1, username);
		rs = userLogin.executeQuery();
		if(rs.next())return false;
		else 
		{
			userRegisters.setInt(1, userid);
			userRegisters.setString(2, username);
			userRegisters.setString(3, gender);
			userRegisters.setString(4, password);
			userRegisters.setString(5, school);
			userRegisters.setString(6, birthday);
			userRegisters.setString(7, homeland);
			
			userRegisters.executeUpdate();
			return true;
		
	}
	}
	
	//is username duplicate
	public boolean isValidateUsername(String username)
	{
		try{
			validateUsername.setString(1, username);
			rs = validateUsername.executeQuery();
			if(!rs.next())return false; 
		}
		catch(Exception e)
		{
			return false;				//not duplicate
		}
		return true;
	}
	
	//user login api
	public  boolean userLogin(String username, String password) throws SQLException
	{
		userLogin.setString(1, username);
		rs = userLogin.executeQuery();
		String pwd = null;
		if(rs.next())
		{
			pwd = rs.getString("password").trim();
			if(password.equals(pwd))return true;
			else return false;
		}
		else return false;
	}
	
	public int getUserId(String username)throws SQLException
	{
		validateUsername.setString(1, username);
		rs = validateUsername.executeQuery();
		rs.next();
		int userId = rs.getInt("userid");
		return userId;
	}
	
	public String getUsername(int userId)throws SQLException
	{
		getUsername.setInt(1, userId);
		rs = getUsername.executeQuery();
		rs.next();
		return rs.getString(1);
	}
	
	//get users' information api
	public  Vector<String> getUserInfo(int userid) throws SQLException
	{
		Vector<String> userInformation = new Vector<String>();
		userInfo.setInt(1, userid);
		rs = userInfo.executeQuery();
		while(rs.next())
		{
			userInformation.add(rs.getString("username"));
			userInformation.add(rs.getString("gender"));
			userInformation.add(rs.getString("password"));
			userInformation.add(rs.getString("school"));
			userInformation.add(rs.getString("birthday"));
			userInformation.add(rs.getString("homeland"));
		}
		return userInformation;
	}
	
	//update users' information api
	public  boolean updateUserInfo(String username, String gender, String password, String school, String birthday, String homeland) throws SQLException
	{
		getUserPwd.setString(1, username);
		rs = getUserPwd.executeQuery();
		String pwd = null;
		int count = 0;
		if(rs.next())
		{
			pwd = rs.getString(1);
			if(pwd == null)
			{
				return false;
			}
			else 
			{
				try{
					//update user's password
					updateUserPwd.setString(1, password);
					updateUserPwd.setString(2, username);
					count += updateUserPwd.executeUpdate();
					
					//update user's address
					updateSchool.setString(1, school);
					updateSchool.setString(2, username);
					count += updateSchool.executeUpdate();
					
					//update user's gender
					updateGender.setString(1, gender);
					updateGender.setString(2, username);
					count += updateGender.executeUpdate();
				}
				catch(Exception e)
				{
					e.printStackTrace();
					return false;
				}
				return true;
			}
		}
		else 
		{
			return false;
		}
	
   }
	
	public boolean addattend(int userid,int activityid) throws SQLException{
		insertattend.setInt(1,userid);
		insertattend.setInt(2,activityid);
		insertattend.executeUpdate();
		return true;
		
		
	}

	
	
}
