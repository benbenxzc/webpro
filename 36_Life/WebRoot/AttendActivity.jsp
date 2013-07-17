<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="activitybean" class="lifejavabean.activity_javabean">
<jsp:useBean id="userbean" class="lifejavabean.user_javabean">             
<%
	int activityId = Integer.valueOf(request.getParameter("activityid"));
	String username = session.getAttribute("username").toString();
	int userId = userbean.getUserId(username);
	boolean isAttended = activitybean.isAttended(userId, activityId);
	if(isAttended == false)				//没参加过这个活动
	{
		boolean isSuccess = activitybean.attendActivity(userId, activityId);
		if(isSuccess)
		{
 %>
 <script type="text/javascript">
	alert("加入成功！");
</script>
<%
		response.setHeader("refresh"," 0.1; URL=/36_Life/HomePage.jsp");
		}
	}
	else
	{
 %>
 <script type="text/javascript">
	alert("已经加入过不能重新加入！");	
</script>
<%
	response.setHeader("refresh"," 0.1; URL=/36_Life/HomePage.jsp");
	}
 %>
 </jsp:useBean>
 </jsp:useBean>
</body>
</html>
