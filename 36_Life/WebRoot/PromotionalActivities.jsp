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
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
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
                <li class="active"><a href="HomePage.jsp">首页</a></li>
                <li><a href="RecommendedActivities.jsp">热门活动</a></li> 
                <li ><a href="PersonalPage.jsp">个人主页</a></li>
                <!-- <li><a href="Friend.jsp">好友</a></li> -->
                <li><a href="PhotoAlbum.jsp">我的相册</a></li>                             
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>
      
<ul class="nav nav-pills">
          <li>
            <a href="HomePage.jsp">新出活动</a>
          </li>
          <li class="active"><a href="PromotionalActivities.jsp">发起活动</a></li>
        </ul>
<div class="row">
        <div class="span2"></div>
       
        <div class="span6">
          
		<div class="container">

	     <form action="servlet/PromotionalActivitiesServlet" method="post" class="form-signin">
	        <h4>发起活动</h4>
	        活动名称：
	        <input type="text" name="activityName"><br>
	        活动类型：
	        <input type="text" name="activityType"><br>
	        活动地点：
	        <input type="text"  name="activityAddress"><br>
	        联系方式：
	        <input type="text"  name="contactWay"><br>
	        开展时间：
	        <input type="text"  name="activityEndDate"  id="endDate" 
	        rel="popover" title="提示" data-content="样例输入：2013/06/14-2013/06/15" data-placement="bottom" ><br>
	        活动内容：
	        <textarea rows="5" cols="30" name="activityContent">
			</textarea>
	        <br><br>
	        <button class="btn btn-large btn-info" type="submit" >提交</button>
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