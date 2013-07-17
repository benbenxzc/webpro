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
                <li  class="active"><a href="RecommendedActivities.jsp">热门活动</a></li>  
                <li><a href="PersonalPage.jsp">个人主页</a></li>
               <!-- <li><a href="Friend.jsp">好友</a></li> -->
                <li><a href="PhotoAlbum.jsp">我的相册</a></li>                            
              </ul>
            </div>
          </div>
        </div><!-- /.navbar -->
      </div>
      
 <div class="row">
        <!-- <div class="span2"></div> -->
       
        <div class="span8">
        <jsp:useBean id="userbean" class="lifejavabean.user_javabean">
        <jsp:useBean id="avatarbean" class="lifejavabean.avatar_javabean">
        <jsp:useBean id="activitybean" class="lifejavabean.activity_javabean">        
          <table class="table">
          <tbody>
          <%
          		int j;			 	
          		Vector<Integer> activityId = activitybean.getRecommandedActivities();		//得到推荐活动的id
          		if(!activityId.isEmpty())
          		{
          		    int k;
          		    for(k = 0; k < activityId.size(); k++)				//活动id的循环
          		    {
	          			Vector<String> activityInfo = activitybean.getActivityInfoRecommanded(activityId.get(k));
	          			int i = 0;
	          			int flag;
	          			if(!activityInfo.isEmpty())						//活动内容循环输出
	          			{
	          				for(i = 0; i < activityInfo.size(); i++)
	          				{          			
	          				
	          					flag = 0; 		
				 		
						 		if(activityInfo.get(i).equals("1"))		//活动已结束
						 		{
									 	i += 10;							 
									 	flag = 1;
						 		}
						 		if(flag == 1)continue;
						 		i++;
			 					int id = userbean.getUserId(activityInfo.get(i));
		        				String imagePath1 = avatarbean.getRoute(id).substring(62);
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
            <%=activityInfo.get(i)%> 	
             <%i++;%>            	<!-- i--表示按时间顺序排列，按照数据库顺序倒序排列 -->
            : <a href='ActivityInformation.jsp?activityId=<%=activityInfo.get(i)%>'  ><%i++;%><%=activityInfo.get(i) %></a>							<!-- activityname -->
            <%i++;%>           
            </h4>
           
            <div class="content">        
                    <div class="status-lbs" data-wiki="{}">
                            <span class="location"  style="font-family:微软雅黑">地址：<a><%=activityInfo.get(i)%><%i++;%></a> </span><br>
                            <span class="location" style="font-family:微软雅黑">分类：<a><%=activityInfo.get(i)%><%i++;%></a> </span>
                    </div>
            </div>  
            <div class="content">
            <div class="row">          
                    <div class="status-lbs" data-wiki="{}">                    
                            <span class="location"  style="font-family:微软雅黑">参与人数：<%=activityInfo.get(i)%><%i++;%> </span>&nbsp;&nbsp;
                            <span class="location"  style="font-family:微软雅黑">点击量：<%=activityInfo.get(i)%><%i++;%> </span>&nbsp;&nbsp;
                            <span class="location"  style="font-family:微软雅黑">联系方式：<%=activityInfo.get(i)%><%i++;%> </span>
                    </div>
            </div>        
            </div>   
            <div class="content">
            <div class="row">          
            <div class="span1"></div>
                    <div class="status-lbs" data-wiki="{}">                    
                            <span class="location"   style="font-family:微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开始时间：<%=activityInfo.get(i)%><%i++;%> </span>&nbsp;&nbsp;
                    </div>
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
        </jsp:useBean>
        </jsp:useBean>
        </jsp:useBean>
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