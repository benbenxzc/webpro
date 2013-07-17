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
          <li class="active">
            <a href="HomePage.jsp">新出活动</a>
          </li>
          <li><a href="PromotionalActivities.jsp">发起活动</a></li>
        </ul>
<div class="row">
       <!--  <div class="span2"></div> -->
       
        <div class="span8">
        <jsp:useBean id="activitybean" class="lifejavabean.activity_javabean">
        <jsp:useBean id="avatarbean" class="lifejavabean.avatar_javabean">        
          <table class="table">
          <tbody>
          <%
          		int j;			 	
			 	Vector<String> v = activitybean.getActivityInfo();
			 	int i = v.size() - 1;
			 	int flag = 0;		 						 		
			 	if(!v.isEmpty())
			 	{			 	
				 	for(j = v.size()/11; j > 0; j--)
				 	{
				 		flag = 0; 		
				 		
				 		if(v.get(i).equals("1"))		//活动已结束
				 		{
							 	i -= 11;							 
							 	flag = 1;
				 		}
				 		if(flag == 1)continue;
				 		i--;
				 		String route1 = avatarbean.getRoute(Integer.parseInt(v.get(i))).substring(62);		//v.get(i): userId
      					String route = route1.replace("\\","/");      				
			 	
           %>
          <tr>
          <td>          
            <article class="a-feed a-n-feed" >
            <aside>

              <a>                    
                    <img src="<%=route %>" width="15%" height="15%"/>
            </a>

            </aside>
            <h4 data-wiki="{}"  style="font-family:宋体; ">
            <a href="OthersPersonalPage.jsp?userId=<%=Integer.parseInt(v.get(i))%>"><%i--;%><%=v.get(i)%></a> 	
             <%i--;%>            	<!-- i--表示按时间顺序排列，按照数据库顺序倒序排列 -->
            : <a href='ActivityInformation.jsp?activityId=<%=v.get(i)%>'  ><%i--;%><%=v.get(i) %></a>							<!-- activityname -->
            <%i--;%>           
            </h4>
           
            <div class="content">            
                    <div class="status-lbs" data-wiki="{}">
                            <span class="location"  style="font-family:微软雅黑">地址：<a><%=v.get(i)%><%i--;%></a> </span><br>
                            <span class="location" style="font-family:微软雅黑">分类：<a><%=v.get(i)%><%i--;%></a> </span>
                    </div>
            </div>  
            <div class="content">
            <div class="row">          
                    <div class="status-lbs" data-wiki="{}">                    
                            <span class="location"  style="font-family:微软雅黑">参与人数：<%=v.get(i)%><%i--;%> </span>&nbsp;&nbsp;
                            <span class="location"  style="font-family:微软雅黑">点击量：<%=v.get(i)%><%i--;%> </span>&nbsp;&nbsp;
                            <span class="location"  style="font-family:微软雅黑">联系方式：<%=v.get(i)%><%i--;%> </span>                           
                    </div>
            </div>        
            </div>   
            <div class="content">
            <div class="row">    
            <div class="span1"></div>      
            <div class="span6">
                     <div class="status-lbs" data-wiki="{}">                    
                            <span class="location"   style="font-family:微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开展时间：<%=v.get(i)%><%i--;%> </span>&nbsp;&nbsp;
                    </div> </div>
            </div>        
            </div>              
            <div class="details ui-new">
            <div class="feed-comment" >
            <div class="row">
            <div class="span1"></div>
              <div class="comment-box">
                <!-- <textarea cols="16" rows="2" autocomplete="off">评论...</textarea> -->
                </div>   
                  <div class="action-r">      
                  </div>	
                </div>
              </div>
            </div>
            </article>
            </td>            
          </tr>             
          <%
          			}
          		}
           %>  
          </tbody>           
        </table>
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