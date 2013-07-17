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
                <li ><a href="PersonalPage.jsp">个人主页</a></li>
                <li class="active"><a href="Friend.jsp">好友</a></li>
                <li><a href="PhotoAlbum.jsp">我的相册</a></li>                              
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>

      <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="well sidebar-nav">
            <ul class="nav nav-list">
              <li class="nav-header">好友</li>
              <li class="active"><a href="#">全部好友</a></li>
              <li><a href="#">搜索好友</a></li>
              <li class="nav-header">好友分组</li>
              <li><a href="#">大学同学</a></li>
              <li><a href="#">高中同学</a></li>
              <li><a href="#">初中同学</a></li>
              <li><a href="#">小学同学</a></li>
              <li><a href="#">幼儿园同学</a></li>              
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
         
      							        
                </div>
                </div>
                </div>
                </div>
                              
      </body>
       <style type="text/css">       
      .sidebar-nav {
        padding:15px, 0;
        margin-left: -20px;
        margin-right: 50px;
        /*float: left;*/
      }

      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
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