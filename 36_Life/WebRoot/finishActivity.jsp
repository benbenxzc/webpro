<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'finishActivity' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <jsp:useBean id="activitybean"  class="lifejavabean.activity_javabean">
  <%
  		request.setCharacterEncoding("utf-8");
  		int activityId = Integer.parseInt(request.getParameter("activityId").toString());
  		activitybean.finishActivity(activityId);
  		response.setHeader("refresh"," 0.1; URL=/36_Life/MyActivities.jsp");
   %>
  </jsp:useBean>
  </body>
</html>
