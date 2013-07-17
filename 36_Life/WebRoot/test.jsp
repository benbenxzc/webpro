<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:useBean id="activitybean" class="lifejavabean.activity_javabean">
 <% 	
 	int j;
 	int i = 0;
 	Vector<String> v = activitybean.getActivityInfo();
 	for(j = 0; j < v.size()/9; j++)
 	{ 		
 		int k;
 		for(k = 0; k < 9 ; k++)
 		{
 			System.out.println(v.get(i));
 			i++;	
 		}
 	}
  %>
 </jsp:useBean>
 
</body>
</html>