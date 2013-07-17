<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
  
  <head>
    <meta charset="utf-8">
    <title>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- 上传按钮bootstrap ui -->
    <script src="bootstrap/js/bootstrap.file-input.js"></script>
	<link href="bootstrap/css/bootstrap.file-input.css" rel="stylesheet">
    <style>
      body { padding-top: 60px; }
    </style>
    <script src="bootstrap/js/bootstrap.js">
    </script>
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">    
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }
	</style>    
  </head>
  <body>

            <script type="text/javascript">
			      $(document).ready(function(){
			        $('#endDate').popover();
			      });
 		   </script>
    <div class="container">
	<form action="servlet/RegisterServlet" method="post" class="form-signin" enctype="multipart/form-data">
	<h4>Register</h4>
      <div class="control-group"><div class="controls">       
      <label class="control-label">username</label><input type="text" name="username"></div></div>
      <div class="control-group"><label class="control-label">gender</label><div class="controls"><input type="text" name="gender"></div></div>
      <div class="control-group"><label class="control-label">school</label><div class="controls"><input type="text" name="school"></div></div>
      <div class="control-group"><label class="control-label">password</label><div class="controls"><input type="password"  name="password"></div></div>    
      <div class="control-group"><label class="control-label">birthday</label><div class="controls"><input type="text"  name="birthday"  id="endDate" 
	        rel="popover" title="提示" data-content="样例输入：2013-06-01" data-placement="bottom" ></div></div>
      <div class="control-group"><label class="control-label">hometown</label><div class="controls"><input type="text"  name="homeland"></div></div>
      <div class="control-group"><div class="controls"><label class="control-label">upload avatar</label><input type="file" id="file" class="custom-file-input" name="fileName"></div></div>
      <input type="submit" class="btn btn-large btn-info" value="Submit" />
      </form>               
    </div>
  </body> 
</html>
