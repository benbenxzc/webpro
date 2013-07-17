<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <!-- Le styles -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/oldprofile-all-min.css" rel="stylesheet">
    <link href="bootstrap/css/profile-skin.css" rel="stylesheet">
    <script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </head>
  <body>
  
  <div class="container">
 
        <ul class="nav nav-pills pull-right">
        <li><h4 style="font-family:微软雅黑;color:blue; font-weight:lighter">Hello，<%=session.getAttribute("username") %>！</h4></li>          
          <li class="active"><a href="Logout.jsp">注销</a></li>
        </ul>
         <div class="masthead"> 
        <h3 class="muted">Life.com</h3>
        <div class="navbar">
          <div class="navbar-inner">
            <div class="container">
              <ul class="nav">                
                <li><a href="HomePage.jsp">首页</a></li>
                <li><a href="RecommendedActivities.jsp">热门活动</a></li> 
                <li  class="active"><a href="PersonalPage.jsp">个人主页</a></li>
                <!-- <li><a href="Friend.jsp">好友</a></li> -->
                <li><a href="PhotoAlbum.jsp">我的相册</a></li>
                              
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>
      <jsp:useBean id="userbean" class="lifejavabean.user_javabean">
      <jsp:useBean id="attendbean" class="lifejavabean.activity_javabean">
      <jsp:useBean id="avatarbean" class="lifejavabean.avatar_javabean">
      <%
      		int userId = Integer.parseInt(session.getAttribute("userId").toString());
      		Vector<String> v = userbean.getUserInfo(userId);
      		int i = 0;
      		String route1 = avatarbean.getRoute(userId).substring(62);
      		String route = route1.replace("\\","/");
       %>

       <div class="row">       
            <div class="span2">
            <!-- 图片 -->
  			<aside>
              <a>                    
                    <img src="<%=route %>" width="200px" height="280px"/>
            </a>	
            </aside>    
            
            <!-- 基本信息 -->
             <div class="span2">
			 <div class="profile-summary"><ul class="viewer-actions"></ul>
			<dl class="clearfix">
			
			<div class="clearfix">
			<dt>姓名：</dt>
			<dd><%=v.get(i) %></dd>
			<%i++; %>
			</div>
			
			<div class="clearfix">
			<dt>性别：</dt>
			<dd><%=v.get(i) %></dd>
			</div>
			<%i++; i++;%>		
				
			<div class="clearfix">
			<dt>学校：</dt>
			<dd>
			<%=v.get(i) %>
			<%i++; %>
			</dd>
			</div>
			
			<div class="clearfix">
			<dt>生日：</dt>			 
			<dd>
			<%=v.get(i) %>
			<%i++; %>
			</div>
			
			<div class="clearfix">
			<dt>家乡：</dt>
			<dd><%=v.get(i) %><%i++; %>
			</dd>
			</div></dl>		
			</div>
			</div>        
            </div>
            
            <!-- 修改活动信息 -->
            <%
            	int activityId = Integer.parseInt(request.getParameter("activityId").toString());
            	Vector<String> activityInfoVector = attendbean.getActivityInfoByIdEditActivity(activityId);
            	 int k = 0;
             %>
<div class="row">
        <div class="span2"></div>
       
        <div class="span6">
          
		<div class="container">

	     <form action="servlet/EditActivitiesServlet" method="post" class="form-signin">
	        <h4>修改活动信息</h4>
	        活动名称：
	        <input type="text" name="activityName"  value="<%=activityInfoVector.get(k)%>"><br><%k++; %>
	        活动类型：
	        <input type="text" name="activityType" value="<%=activityInfoVector.get(k)%>"><br><%k++; %>
	        活动地点：
	        <input type="text"  name="activityAddress" value="<%=activityInfoVector.get(k)%>"><br><%k++; %>
	        联系方式：
	        <input type="text"  name="contactWay" value="<%=activityInfoVector.get(k)%>"><br><%k++; %>
	        开展时间：
	        <input type="text"  name="activityEndDate"  id="endDate" 
	        rel="popover" title="提示" data-content="样例输入：2013/06/14-2013/06/15" data-placement="bottom" value="<%=activityInfoVector.get(k)%>"><br><%k++; %>
	        活动内容：
	        <textarea rows="5" cols="30" name="activityContent" ><%=activityInfoVector.get(k)%>	
			</textarea>
	        <br><br>
	        <button class="btn btn-large btn-info" type="submit" >提交</button>
	        <input type="hidden" value="<%=activityId%>" name="activityId">
	      </form>	
			<script type="text/javascript">
			      $(document).ready(function(){
			        $('#endDate').popover();
			      });
 		   </script>
    </div>
        </div>
        </div>
        </div>

		</jsp:useBean>
			</jsp:useBean>
            </jsp:useBean>    
			</div>	
            </div>
            
            </div>            
                          

  </body>
  <style type="text/css">
         
      img 
      {
        float:left;        
        margin:0px 15px 15px 20px;
      }      
      body {
        padding-top: 20px;
        padding-bottom: 60px;
      }

      /* Custom container */
      .container {
        margin: 0 auto;
        max-width: 1000px;
      }
      .container > hr {
        margin: 60px 0;
      }

      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 80px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 100px;
        line-height: 1;
      }
      .jumbotron .lead {
        font-size: 24px;
        line-height: 1.25;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }

      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }


      /* Customize the navbar links to be fill the entire space of the .navbar */
      .navbar .navbar-inner {
        padding: 0;
      }
      .navbar .nav {
        margin: 0;
        display: table;
        width: 100%;
      }
      .navbar .nav li {
        display: table-cell;
        width: 1%;
        float: none;
      }
      .navbar .nav li a {
        font-weight: bold;
        text-align: center;
        border-left: 1px solid rgba(255,255,255,.75);
        border-right: 1px solid rgba(0,0,0,.1);
      }
      .navbar .nav li:first-child a {
        border-left: 0;
        border-radius: 3px 0 0 3px;
      }
      .navbar .nav li:last-child a {
        border-right: 0;
        border-radius: 0 3px 3px 0;
      }
    </style>
  </html>