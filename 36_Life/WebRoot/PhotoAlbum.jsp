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
    <script src="bootstrap/js/bootstrap.file-input.js"></script>
	<link href="bootstrap/css/bootstrap.file-input.css" rel="stylesheet">
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
                <!-- <li><a href="Friend.jsp">好友</a></li> -->
                <li class="active"><a href="PhotoAlbum.jsp">我的相册</a></li>                                              
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>
      
      
      <div class="control-group"><div class="controls">
      <!-- 上传照片表单 -->
      <form action="servlet/UploadImages" method="post" class="form-signin" enctype="multipart/form-data">
      	<input type="text" name="photoDescription"   placeholder="照片描述">		    
		<input type="file"  name="fileName"   class="custom-file-input"  >
		<br>
		<input type="submit" class="btn " value="提交" >			
		</form>
		
		</div></div>
	<jsp:useBean id="photobean" class="lifejavabean.photo_javabean">
	<div id="myCarousel" class="carousel slide">
	<ol class="carousel-indicators" >
	<%
	 		int userId = (Integer)session.getAttribute("userId");
    		Vector<String> photoInfo = photobean.getPhotoInfo(userId);
    		int i;
    		if(!photoInfo.isEmpty())
    		{
	    		for(i = 0; i < photoInfo.size()/3; i++)
	    		{
	    			
	 %>
                  
	      <li data-target="#myCarousel" data-slide-to="<%=i+1 %>" <%if(i == 0) {%>class="active" <%} %>></li>
	      <%
	      		}
	      	}
	       %>
	       	       
	    </ol>
	    <div class="carousel-inner" >
    <%
    		if(!photoInfo.isEmpty())
    		{
	    		for(i = 0; i < photoInfo.size(); i++)
	    		{    		
		    		String route1 = photoInfo.get(i+2).substring(62);		//v.get(i): userId
		      		String route = route1.replace("\\","/");
  					if(i == 0){ %>
	                  <div class="item active">
	                  <%} 
	                   else { %> 
	                  <div class="item">
	                  <%} %>
                    <img src="<%=route %>" alt=""> <!-- width="50%" height="30%" -->
                    <div class="carousel-caption">                       
                      <p><%=photoInfo.get(i)%></p><%i++; %>
                      <p><%=photoInfo.get(i)%></p> <%i++; %>
                    </div> 
                    </div>
         <%
        		}
        	}
         %>
         </div>
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a> 
        <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a> 
        </div> 
          <script>     
    $('.carousel').carousel();
    </script>      
		<%			
		 if(photoInfo.isEmpty()) {
           %>   
           <div class="row">
           <div class="span2"></div>
           <div class="span5">
           <h5>暂无记录</h5>
           </div>
           </div>
           <%
          } 
            %>     
        </jsp:useBean>
                          
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