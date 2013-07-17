package lifejavabean;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;



public class activity_javabean {
	Connection conn;  
	PreparedStatement st;
	
	private  PreparedStatement insertAct;
	private  PreparedStatement getActivityName;
	private  PreparedStatement getActivityContent;
	private  PreparedStatement getActivityAddress;
	private  PreparedStatement getActivityClick;
	private  PreparedStatement getActivityType;
	private  PreparedStatement getActivityNumber;
	
	private  PreparedStatement updateActivityName;
	private  PreparedStatement updateActivityContent;
	private  PreparedStatement updateActivityAddress;
	private  PreparedStatement updateActivityType;
	private  PreparedStatement updateActivityStartdate;
	private  PreparedStatement updateContactWay;
	
	private  PreparedStatement updateActivityClick;
	private  PreparedStatement updateActivityNumber;
    private  PreparedStatement deleteActivity;
    private  PreparedStatement activityinfo;
    private  PreparedStatement deleteattend;
    private PreparedStatement getActivityInfo;
    private PreparedStatement attendActivity;
    private  PreparedStatement getAttendByUserid;
	private  PreparedStatement getMaxId;
	
	private  PreparedStatement decreaseActivityNumber;
	private  PreparedStatement isAttended;
	private  PreparedStatement getActivityIdByUserId;
	
	private  PreparedStatement getAttendByActivityId;
	private  PreparedStatement getRecommanded;
	private  PreparedStatement finishActivity;
	
	
	private  ResultSet rs;
	
	
	
		
		public activity_javabean() throws ClassNotFoundException, SQLException
		{
			//Connect to the mysql
		    Class.forName("com.mysql.jdbc.Driver");
	           String dbURL = "jdbc:mysql://localhost:3306/life?useUnicode=true&characterEncoding=UTF-8"; 
	          
		    conn = DriverManager.getConnection(dbURL, "root", "332600");
		    insertAct = conn.prepareStatement(SQL.INSERTACT_SQL);
		    //赋值
		    getActivityName=conn.prepareStatement(SQL.GETACTIVITY_NAME_SQL);
		    getActivityContent=conn.prepareStatement(SQL.GETACTIVITY_CONTENT_SQL);
		    getActivityAddress=conn.prepareStatement(SQL.GETACTIVITY_ADDRESS_SQL);
		    getActivityType=conn.prepareStatement(SQL.GETACTIVITY_TYPE_SQL);
		    getActivityNumber=conn.prepareStatement(SQL.GETACTIVITY_NUMBER_SQL);
		    updateActivityName= conn.prepareStatement(SQL.UPDATEACTIVITYNAME_SQL);
		    updateActivityClick = conn.prepareStatement(SQL.UPDATEACTIVITY_CLICK_SQL);
		    getActivityType = conn.prepareStatement(SQL.GETACTIVITY_TYPE_SQL);
		    getActivityNumber = conn.prepareStatement(SQL.GETACTIVITY_NUMBER_SQL);
		    getAttendByUserid = conn.prepareStatement(SQL.GETATTENDBYUSERID_SQL);
		    deleteattend = conn.prepareStatement(SQL.DELETEATTEND_SQL);
		    attendActivity = conn.prepareStatement(SQL.ATTENDACTIVITY_SQL);
		    
            activityinfo=conn.prepareStatement(SQL.GETACTIVITYINFO_SQL);
		    deleteActivity = conn.prepareStatement(SQL.DELETEACTIVITY_SQL);    

		    getActivityInfo = conn.prepareStatement(SQL.GETACTIVITY_SQL);
		    getMaxId = conn.prepareStatement("SELECT MAX(activityid) FROM activity");
		    
		    updateActivityNumber = conn.prepareStatement(SQL.UPDATEACTIVITYNUMBER_SQL);
		    updateActivityName = conn.prepareStatement(SQL.UPDATEACTIVITYNAME_SQL);
		    updateActivityStartdate = conn.prepareStatement(SQL.UPDATEACTIVITYSTARTDATE_SQL);
		    updateActivityType = conn.prepareStatement(SQL.UPDATEACTIVITYTYPE_SQL);
		    updateActivityAddress = conn.prepareStatement(SQL.UPDATEACTIVITYADDRESS_SQL);
		    updateActivityContent = conn.prepareStatement(SQL.UPDATEACTIVITYCONTENT_SQL);
		    updateContactWay = conn.prepareStatement(SQL.UPDATECONTACTWAY_SQL);
		    
		    isAttended  = conn.prepareStatement(SQL.ISATTENDED_SQL);
		    getActivityIdByUserId = conn.prepareStatement(SQL.GETACTIVITYIDBYUSERID_SQL);
		    getAttendByActivityId = conn.prepareStatement(SQL.GETATTENDBYACTIVITYID_SQL);
		    decreaseActivityNumber = conn.prepareStatement(SQL.DECREASENUMBER_SQL);
		    
		    getRecommanded = conn.prepareStatement(SQL.GETRECOMMANDED_SQL);
		    finishActivity = conn.prepareStatement(SQL.FINISHACTIVITY_SQL);
		}
		public int getMaxActivityId() throws SQLException
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
		
		public boolean finishActivity(int activityId)
		{
			try{
				finishActivity.setInt(1, activityId);
				finishActivity.executeUpdate();
				return true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return false;
			}
		}
		
		//insert activity api
		public  boolean  insertActivity(int activityid, String activityname,  String actcontent, String username,String startdate,String address,int number,int click ,String activitytype, String contactway) throws SQLException, UnsupportedEncodingException
		{			
				insertAct.setInt(1, activityid);
				insertAct.setString(2, activityname);
				insertAct.setString(3, actcontent);
				insertAct.setString(4, username);
				insertAct.setString(5, startdate);
				insertAct.setString(6, address);
				insertAct.setInt(7, number);
				insertAct.setInt(8, click);
				insertAct.setString(9, activitytype);
				insertAct.setString(10, contactway);
				insertAct.setString(11, "0");
				insertAct.executeUpdate();
				return true;		
		}
		
		@SuppressWarnings("rawtypes")
		public  boolean deleteActivity(String activityname) throws SQLException
		{
			getActivityName.setString(1, activityname);
			rs = getActivityName.executeQuery();
			if(rs.next())
			{
				deleteActivity.setString(1, activityname);
				deleteActivity.executeUpdate();
				return true;
			}
			else
			{
				return false;
			}
		}
		
		/* 首页需要的方法得到活动信息 */
		public  Vector<String> getActivityInfo() throws SQLException, ClassNotFoundException
		{
			Vector<String> ActivityInformation = new Vector<String>();
			try
			{
				rs = getActivityInfo.executeQuery();				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			while(rs.next())
			{
				user_javabean userbean = new user_javabean();
				String userId = String.valueOf(userbean.getUserId(rs.getString("username")));
			
				ActivityInformation.add(rs.getString("startdate"));
				ActivityInformation.add(rs.getString("contactway"));
				ActivityInformation.add(String.valueOf(rs.getInt("clicknumber")));
				ActivityInformation.add(String.valueOf(rs.getInt("number")));
				ActivityInformation.add(rs.getString("activitytype"));
				ActivityInformation.add(rs.getString("address"));				
				ActivityInformation.add(rs.getString("activityname"));				
				ActivityInformation.add(rs.getString("activityid"));
				ActivityInformation.add(rs.getString("username"));
				ActivityInformation.add(userId);
				ActivityInformation.add(rs.getString("isfinished"));
								
			
			}	
			return ActivityInformation;
		}
		
		/* 推荐活动页面用到方法：得到活动信息 */
		public  Vector<String> getActivityInfoRecommanded(int activityid) throws SQLException
		{
			Vector<String> ActivityInformation = new Vector();
			try
			{
				 activityinfo.setInt(1, activityid);
					rs = activityinfo.executeQuery();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			while(rs.next())
			{
				ActivityInformation.add(rs.getString("isfinished"));
				ActivityInformation.add(rs.getString("username"));
				ActivityInformation.add(rs.getString("activityid"));
				ActivityInformation.add(rs.getString("activityname"));
				ActivityInformation.add(rs.getString("address"));				
				ActivityInformation.add(rs.getString("activitytype"));
				ActivityInformation.add(String.valueOf(rs.getInt("number")));
				ActivityInformation.add(String.valueOf(rs.getInt("clicknumber")));
				ActivityInformation.add(rs.getString("contactway"));
				ActivityInformation.add(rs.getString("startdate"));
								
			
			}	
			return ActivityInformation;
		}
		
		
		/* ActivityInformation.jsp */
		public  Vector<String> getActivityInfoById(int activityid) throws SQLException
		{
			Vector<String> ActivityInformation = new Vector<String>();
			   activityinfo.setInt(1, activityid);
			rs = activityinfo.executeQuery();
			while(rs.next())
			{				
				ActivityInformation.add(rs.getString("activityname"));
				ActivityInformation.add(rs.getString("username"));				
				ActivityInformation.add(rs.getString("actcontent"));				
				ActivityInformation.add(rs.getString("address"));
				ActivityInformation.add(rs.getString("activitytype"));
				ActivityInformation.add(String.valueOf(rs.getInt("number")));
				ActivityInformation.add(String.valueOf(rs.getInt("clicknumber")));
				ActivityInformation.add(rs.getString("startdate"));
				ActivityInformation.add(rs.getString("contactway"));
				ActivityInformation.add(rs.getString("activityid"));
			}
			return ActivityInformation;
		}
		
		public  Vector<String> getActivityInfoByIdEditActivity(int activityid) throws SQLException
		{
			Vector<String> ActivityInformation = new Vector<String>();
			   activityinfo.setInt(1, activityid);
			rs = activityinfo.executeQuery();
			while(rs.next())
			{				
				ActivityInformation.add(rs.getString("activityname"));
				ActivityInformation.add(rs.getString("activitytype"));
				ActivityInformation.add(rs.getString("address"));	
				ActivityInformation.add(rs.getString("contactway"));
				ActivityInformation.add(rs.getString("startdate"));
				ActivityInformation.add(rs.getString("actcontent"));				
			}
			return ActivityInformation;
		}
		
		public  Vector<String> getActivityInfoByIdPersonalPage(int activityid) throws SQLException
		{
			Vector<String> ActivityInformation = new Vector<String>();
			   activityinfo.setInt(1, activityid);
			rs = activityinfo.executeQuery();
			while(rs.next())
			{		
				ActivityInformation.add(rs.getString("username"));	
				ActivityInformation.add(rs.getString("activityid"));
				ActivityInformation.add(rs.getString("activityname"));				
				ActivityInformation.add(rs.getString("address"));
				ActivityInformation.add(rs.getString("activitytype"));				
				ActivityInformation.add(String.valueOf(rs.getInt("number")));
				ActivityInformation.add(String.valueOf(rs.getInt("clicknumber")));
				ActivityInformation.add(rs.getString("contactway"));
				ActivityInformation.add(rs.getString("startdate"));
			}
			return ActivityInformation;
		}
		
		public  Vector<String> getActivityInfoByIdMyActivities(int activityid) throws SQLException
		{
			Vector<String> ActivityInformation = new Vector<String>();
			   activityinfo.setInt(1, activityid);
			rs = activityinfo.executeQuery();
			while(rs.next())
			{						
				ActivityInformation.add(rs.getString("username"));	
				ActivityInformation.add(rs.getString("activityid"));
				ActivityInformation.add(rs.getString("activityname"));				
				ActivityInformation.add(rs.getString("address"));
				ActivityInformation.add(rs.getString("isfinished"));
				ActivityInformation.add(rs.getString("activitytype"));				
				ActivityInformation.add(String.valueOf(rs.getInt("number")));
				ActivityInformation.add(String.valueOf(rs.getInt("clicknumber")));
				ActivityInformation.add(rs.getString("contactway"));
				ActivityInformation.add(rs.getString("startdate"));
			}
			return ActivityInformation;
		}
				
		public Vector<Integer> getActivityIdByUsername(String username) throws SQLException
		{
			getActivityIdByUserId.setString(1, username);
			rs = getActivityIdByUserId.executeQuery();
			Vector<Integer> activityId = new Vector<Integer>();
			while(rs.next())
			{
				activityId.add(rs.getInt("activityId"));
			}
			return activityId;
			
		}
		
		public Vector<Integer> getRecommandedActivities() throws SQLException
		{
			rs = getRecommanded.executeQuery();
			Vector<Integer> activityId = new Vector<Integer>();
			while(rs.next())
			{
				activityId.add(rs.getInt("activityId"));
			}
			return activityId;
			
		}
		/*public  boolean updateActivityInfo(int activityid, String activityname,  String actcontent, String username,String startdate,String enddate,String address,int number,int click,String activitytype) throws SQLException
		{
			getActivityName.setString(1,activityname);
			rs = getActivityName.executeQuery();
			String actname = null;
	
			if(rs.next())
			{
				actname = rs.getString("activityname");
				if(actname == null)
				{
					return false;
				}
				else 
				{
					try{
						//update user's password
						updateActivityContent.setString(1, actcontent);
						updateActivityContent.setString(2, activityname);
						//count += updateUserPwd.executeUpdate();
						
						//update user's address
						updateActivityAddress.setString(1, address);
						updateActivityAddress.setString(2, activityname);
						//count += updateUserAddress.executeUpdate();
						
						//update user's phone
						updateUserPhone.setString(1, phone);
						updateUserPhone.setString(2, username);
		//				count += updateUserPhone.executeUpdate();
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
		*/
		
		public void updateActivityClicknumber(int activityId)
		{
			try
			{
				updateActivityClick.setInt(1, activityId);
				updateActivityClick.executeUpdate();
			}
			catch(Exception e)
			{
				
			}
		}
		
		public boolean updateactcontent( String actcontent, int activityId)throws SQLException
		{ 
			
			updateActivityContent.setString(1,actcontent);
			updateActivityContent.setInt(2,activityId);
			int count = updateActivityContent.executeUpdate();
			if(count>0)return true;
			else return false;
			
			}
		
		public boolean updateactaddress( String address, int activityId)throws SQLException
		{ 
			
			updateActivityAddress.setString(1,address);
			updateActivityAddress.setInt(2,activityId);
			int count = updateActivityAddress.executeUpdate();
			if(count>0)return true;
			else return false;
			
			}
		
		public boolean updatetype( String activitytype, int activityId)throws SQLException
		{ 
			
			updateActivityType.setString(1,activitytype);
			updateActivityType.setInt(2,activityId);
			int count = updateActivityType.executeUpdate();
			if(count>0)return true;
			else return false;
		}
		
		public boolean updateStartdate( String activityStartdate, int activityId)throws SQLException
		{ 
			
			updateActivityStartdate.setString(1,activityStartdate);
			updateActivityStartdate.setInt(2,activityId);
			int count = updateActivityStartdate.executeUpdate();
			if(count>0)return true;
			else return false;
		}
		
		public boolean updateContactWay( String contactWay, int activityId)throws SQLException
		{ 
			
			updateContactWay.setString(1,contactWay);
			updateContactWay.setInt(2,activityId);
			int count = updateContactWay.executeUpdate();
			if(count>0)return true;
			else return false;
		}
		
		public boolean updateName( String activityName, int activityId)throws SQLException
		{ 
			
			updateActivityName.setString(1,activityName);
			updateActivityName.setInt(2,activityId);
			int count = updateActivityName.executeUpdate();
			if(count>0)return true;
			else return false;
		}
		
		//是否参加过这个活动
		public boolean isAttended(int userId, int activityId)
		{
			try{
				isAttended.setInt(1, userId);
				isAttended.setInt(2, activityId);
				rs = isAttended.executeQuery();
				if(rs.next())return true;							//参加过
				else return false;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return false;
			}
		}
		
		public boolean attendActivity(int userId, int activityId)
		{
			try{
				attendActivity.setInt(1, userId);
				attendActivity.setInt(2, activityId);
				attendActivity.executeUpdate();
				updateActivityNumber.setInt(1, activityId);			//同时增加该活动的参加人数，删除同理
				updateActivityNumber.executeUpdate();
				return true;
			}
			catch(Exception e)
			{
				e.printStackTrace();
				return false;
			}
		}
		
		public boolean deleteattend(int userid,int activityid)throws SQLException{
			
			isAttended.setInt(1,userid);
			isAttended.setInt(2,activityid);
			rs=isAttended.executeQuery();
			if(rs.next()){
				deleteattend.setInt(1,userid);
				deleteattend.setInt(2,activityid);
				decreaseActivityNumber.setInt(1, activityid);
				deleteattend.executeUpdate();
				return true;
			}
			else return false;
			
		}
						
		public  Vector<Integer> getattend(int userid) throws SQLException
		{
			Vector<Integer> ActivityInformation = new Vector<Integer>();
			getAttendByUserid.setInt(1, userid);
			rs = getAttendByUserid.executeQuery();
			while(rs.next())
			{
				ActivityInformation.add(rs.getInt("activityid"));
				
			}
			return ActivityInformation;
		}
		
		public Vector<Integer> getAttendUserId(int activityId) throws SQLException
		{
			Vector<Integer> v = new Vector<Integer>();
			getAttendByActivityId.setInt(1, activityId);
			rs = getAttendByActivityId.executeQuery();
			while(rs.next())
			{
				v.add(rs.getInt("userid"));
			}			
			return v;
		}
		
		
	}
	
	
	


