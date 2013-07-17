<%-- <%@ page contentType="text/html; charset=utf-8" %>   
<%@ page language="java" %>   
<!-- <HTML>     
<HEAD>     
<TITLE>DATABASETITLE</TITLE>     
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
</HEAD>     
<FORM METHOD=POST ACTION="do_upload.jsp">     
人物:<INPUT TYPE="text" NAME="name"><BR>   
图片:<INPUT TYPE="file" NAME="image"><BR>     
<INPUT TYPE="submit" value="提交">   
 </FORM>
</BODY>     
</HTML>   -->
<HTML>
<BODY>
<form id="form1" name="form1" method="post" action="servlet/p" enctype="multipart/form-data">
    <table width="100%" border="0">
    <tr>
      名称:<INPUT TYPE="text" NAME="name"><BR> 
      <td width="30%"><input name="cl" type="file" /></td><BR> 
      <td width="9%"><input type="submit" name="Submit" value="上传"></td>
    </tr>
    </table>
    </BODY>
    </form>
    </HTML>  --%>
    <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html> 
<head> 
<base href="<%=basePath%>"> 
<title>My JSP 'upload.jsp' starting page</title> 
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
<form action="servlet/dalian" method="post"  enctype="multipart/form-data">
        name: <input type="text" class="input-block-level" name="fuck">
        <input type="file" class="input-block-level" name="fileName">
        <input type="submit" value="上传"/> 
      </form>
</body> 
</html> 