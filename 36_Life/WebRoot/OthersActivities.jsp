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
      		int userId = Integer.parseInt(request.getParameter("userId").toString());
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
            
            <div class="span1"></div>
            <div class="span8">
	            <ul class="nav nav-pills">
	          <li>
	            <a href="OthersPersonalPage.jsp?userId=<%=userId%>"  style="font-family:微软雅黑">TA参与的活动</a>
	          </li>
	          <li class="active"><a href="OthersActivities.jsp?userId=<%=userId%>"  style="font-family:微软雅黑">TA发起的活动</a></li>
	        </ul>
	        <table class="table">
          <tbody>
	        <%
	        	String username = userbean.getUsername(userId);
	        	Vector<Integer> activityId = attendbean.getActivityIdByUsername(username);
	        	
	        	if(!activityId.isEmpty())
	        	{	        	
		        	int k = 0;
		        	int j = 0; 
		        	for(k = 0; k < activityId.size(); k++)
		        	{
		        		j = 0;
		        		Vector<String> activityInfo = attendbean.getActivityInfoByIdPersonalPage(activityId.get(k));
		        		int user = userbean.getUserId(activityInfo.get(j));
		        		String imagePath1 = avatarbean.getRoute(user).substring(62);
      					String imagePath = imagePath1.replace("\\","/");	
	        			        	
	         %>
	      <tr>
          <td>          
            <article class="a-feed a-n-feed" >
            <aside>

              <a>                    
                    <img src="<%=imagePath %>" width="15%" height="15%"/>
            </a>

            </aside>
            <h4 data-wiki="{}"  style="font-family:宋体; ">
            <%=activityInfo.get(j)%> 				<!-- username -->
             <%j++;%>            
            : <a href='ActivityInformation.jsp?activityId=<%=activityInfo.get(j)%>'  >  <!-- activityname -->
            <%j++;%><%=activityInfo.get(j) %></a>				<!-- address -->			
           <%j++;%>          
            </h4>
           
            <div class="content">            
                    <div class="status-lbs" data-wiki="{}">
                            <span class="location"  style="font-family:微软雅黑">地址：<%=activityInfo.get(j)%><%j++;%> </span><br>
                            <span class="location"  style="font-family:微软雅黑">分类：<%=activityInfo.get(j)%><%j++;%> </span><br>
                    </div>
            </div>  
            <div class="content">
            <div class="row">          
                    <div class="status-lbs" data-wiki="{}">                    
                            <span class="location"  style="font-family:微软雅黑">参与人数：<%=activityInfo.get(j)%><%j++;%> </span>&nbsp;&nbsp;
                            <span class="location"  style="font-family:微软雅黑">点击量：<%=activityInfo.get(j)%><%j++;%></span>&nbsp;&nbsp;
                            <span class="location"  style="font-family:微软雅黑">联系方式：<%=activityInfo.get(j)%><%j++;%></span>
                    </div>                   
            </div>       
            </div>  
            
            
             <div class="content">
            <div class="row">          
            <div class="span1"></div>             
                    <div class="status-lbs" data-wiki="{}">                  
                    <span class="location"  style="font-family:微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;参与人员：
                    <%	
                    		//得到每个活动的参与人员id
                    		Vector<Integer> attendedUser = attendbean.getAttendUserId(activityId.get(k));
                    		int m = 0;
                    		if(!attendedUser.isEmpty())
                    		{
	                    		for(m = 0; m < attendedUser.size(); m++)
	                    		{                    			
	                    			int id = attendedUser.get(m);
	                    			String name = userbean.getUsername(id);		//attendedUser为userId的容器，转换为username                  
                     %>
                            
                            <a href="OthersPersonalPage.jsp?userId=<%=id%>"><%=name%></a>&nbsp;&nbsp;
                            <%
                            	}
                            }    
                            else
                            {            
                             %>
                             <a>无</a>
                             <%} %>
                             </span>&nbsp;&nbsp;
                    </div>   
                                  
            </div>       
            </div>  
            <div class="content">
            <div class="row">          
            <div class="span1"></div>
                    <div class="status-lbs" data-wiki="{}">                    
                            <span class="location"   style="font-family:微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开始时间：<%=activityInfo.get(j)%><%j++;%> </span>&nbsp;&nbsp;
                    </div>
            </div>        
            </div>                        
            </article>
            </td>            
          </tr>     
          <%
          }
         }
         else
         {
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
	         
	         </tbody>
	         </table>
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