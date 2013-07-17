package lifejavabean;

public class SQL {
	//user
	public static final String VALIDATEUSERNAME_SQL = "SELECT * FROM user WHERE username=?";
	public static final String  USERREGISTER_SQL="INSERT INTO user(userid,username,gender,password,school,birthday,homeland) VALUES(?,?,?,?,?,?,?)";
	public static final String USERLOGIN_SQL = "SELECT * FROM user WHERE username=?";
	public static final String GETUSERINFO_SQL = "SELECT * FROM user WHERE userid=?";
	public static final String GETUSERNAME_SQL = "SELECT username FROM user WHERE userid=?";
	public static final String GETPASSWORD_SQL = "SELECT password FROM user where username=?";
	public static final String UPDATEPWD_SQL = "UPDATE user SET password=? where username=?";
	public static final String UPDATESCHOOL_SQL = "UPDATE user SET school=? where username=?";
	public static final String UPDATEGENDER_SQL = "UPDATE user SET gender=? where username=?";
	

	
	//Activity
	public static final String INSERTACT_SQL = "INSERT INTO activity(activityId, activityName, activityContent,  activityInitiator, launchTime, activityAddress,numberOfParticipants,clickNumber,activityType, contactWay, isFinished)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	public static final String GETACTIVITY_NAME_SQL = "SELECT * FROM activity WHERE activityName=?";
	public static final String GETACTIVITY_CONTENT_SQL = "SELECT * FROM activity WHERE activityContent=?";
	public static final String GETACTIVITYINFO_SQL ="SELECT * FROM activity WHERE activityId=?";
	public static final String GETACTIVITY_ADDRESS_SQL = "SELECT * FROM activity WHERE activityAddress=?";
	public static final String GETACTIVITY_NUMBER_SQL = "SELECT * FROM activity WHERE numberOfParticipants=?";	
	public static final String GETACTIVITY_TYPE_SQL = "SELECT * FROM activity WHERE activityType=?";
	public static final String UPDATEACTIVITY_CLICK_SQL = "UPDATE activity SET clickNumber=clickNumber+1 WHERE activityId=?";
	
	public static final String UPDATEACTIVITYNAME_SQL = "UPDATE activity set activityName=? where activityId=?";
	public static final String UPDATEACTIVITYCONTENT_SQL = "UPDATE activity set activityContent=? where activityId=?";
	public static final String UPDATEACTIVITYADDRESS_SQL = "UPDATE activity set activityAddress=? where activityId=?";
	public static final String UPDATEACTIVITYTYPE_SQL = "UPDATE activity set activityType=? where activityId=?";
	public static final String UPDATEACTIVITYSTARTDATE_SQL = "UPDATE activity set launchTime=? where activityId=?";
	public static final String UPDATECONTACTWAY_SQL = "UPDATE activity set contactWay=? where activityId=?";
	
	public static final String UPDATEACTIVITYNUMBER_SQL = "UPDATE activity set numberOfParticipants=numberOfParticipants+1 where activityId=?";	
	public static final String DELETEACTIVITY_SQL = "DELETE FROM activity WHERE activityId=?";
	public static final String GETACTIVITY_SQL = "SELECT * FROM activity";
	public static final String GETACTIVITYIDBYUSERID_SQL = "SELECT activityId FROM activity WHERE activityInitiator=?";
	public static final String DECREASENUMBER_SQL = "UPDATE activity set numberOfParticipants=numberOfParticipants-1 where activityId=?";
	public static final String GETRECOMMANDED_SQL = "SELECT activityId FROM activity WHERE clickNumber>100";
	
	public static final String FINISHACTIVITY_SQL = "UPDATE activity SET isFinished=1 WHERE activityId=?";
	
	//attend 
	public static final String ATTENDACTIVITY_SQL = "insert into attend(userid,activityid)VALUES(?,?)";
	public static final String DELETEATTEND_SQL = "DELETE FROM attend WHERE userid=? and activityId=?";
	public static final String GETATTENDBYUSERID_SQL = "SELECT * FROM attend WHERE userid=?";
	public static final String ISATTENDED_SQL = "SELECT * FROM attend WHERE userid=? and activityId=?";
	public static final String GETATTENDBYACTIVITYID_SQL = "SELECT userid FROM attend WHERE activityId=?";
	//friend
	public static final String INSERTFRIEND_SQL = "insert into friend(userid1,userid2)VALUES(?,?)";
	public static final String GETFRIEND_SQL = "SELECT * FROM friend WHERE userid1=?";
	public static final String DELETEFRIEND_SQL = "DELETE FROM friend WHERE userid1=? and userid2=?";
	//comment
	public static final String INSERTCOMMENT_SQL = "insert into comment(userid,activityname,cuploadtime,comcontent,istop)VALUES(?,?,?,?,?)";
	public static final String GETCOMMENT_SQL ="SELECT* FROM comment WHERE  userid=? and activityname=?";
	public static final String UPDATECOMMENT_SQL ="UPDATE comment WHERE  set comcontent=? where userid=? and activityname=?";
	public static final String GETCOMMENTINFO_SQL ="SELECT* FROM comment WHERE  activityname=?";
	//photo
	public static final String INSERTPHOTO_SQL = "insert into photo(photoid,userid,description,uploadtime,location)VALUES(?,?,?,?,?)";
	public static final String GETPHOTO_SQL = "SELECT* FROM photo where userid=?";
	public static final String DELETEPHOTO_SQL="DELETE FROM photo where photoname=?";
	public static final String GETPHOTOBYLOCATION_SQL="SELECT* FROM photo where location=?";

	//avatar
	public static final String INSERTROUTE_SQL = "INSERT INTO avatar(userid,imageroute) VALUES(?,?)";
	public static final String UPDATEROUTE_SQL = "UPDATE avatar SET imageroute=? where userid=?";
	public static final String GETROUTE_SQL = "SELECT imageroute FROM avatar where userid=?";
	
	
	
}