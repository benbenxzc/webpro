package SERVLET;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import lifejavabean.avatar_javabean;
import lifejavabean.user_javabean;

public class RegisterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	/* isRename */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		try {
			//request.setCharacterEncoding("utf-8");
			user_javabean user = new user_javabean();
			String username = "", gender = "", password = "", school = "", birthday = "", homeland = "";
			


			int userId;
			
		
		//为解析类提供配置信息 
				DiskFileItemFactory factory = new DiskFileItemFactory(); 
				//创建解析类的实例 
				ServletFileUpload sfu = new ServletFileUpload(factory); 

				
				//开始解析 
				sfu.setFileSizeMax(1024*400); 
				//每个表单域中数据会封装到一个对应的FileItem对象上 
				List<FileItem> items = sfu.parseRequest(request);
				File file = new File("");
				String path = "";
				String fileName = "";
				//区分表单域 
				for (int i = 0; i < items.size(); i++) { 
				FileItem item = items.get(i);
				file = new File("");
				//isFormField为true，表示这不是文件上传表单域 
					if(item.isFormField()) 
					{
						if(i == 0)
						{
							 username=item.getString();
							 username = new String(username.getBytes("ISO-8859-1"),"UTF-8");
							 if(user.isValidateUsername(username))			//判断是否重名
								{
									response.sendRedirect("/36_Life/RegisterError.jsp");
								}
						}
						 
						if(i == 1)
						{
							 gender=item.getString();
							 gender = new String(gender.trim().getBytes("ISO-8859-1"),"UTF-8");
						}
						 
						if(i == 3)
						{
							 password=item.getString();
							 password = new String(password.trim().getBytes("ISO-8859-1"),"UTF-8");
						}
						 
						if(i == 2)
						{
							 school=item.getString();
							 school = new String(school.trim().getBytes("ISO-8859-1"),"UTF-8");
						}
						 
						if(i == 4)
						{
							 birthday=item.getString();
							 birthday = new String(birthday.trim().getBytes("ISO-8859-1"),"UTF-8");
						}
						 
						if(i == 5)
						{
							 homeland=item.getString();
							 homeland = new String(homeland.trim().getBytes("ISO-8859-1"),"UTF-8");
						}
					}
					if(!item.isFormField())
					{ 
						ServletContext sctx = getServletContext(); 
						//获得存放文件的物理路径 
						//upload下的某个文件夹 得到当前在线的用户 找到对应的文件夹 
			
						path = sctx.getRealPath("/upload"); 
						//获得文件名 
						fileName = item.getName(); 
						//该方法在某些平台(操作系统),会返回路径+文件名 
						fileName = fileName.substring(fileName.lastIndexOf("/")+1); 
						file = new File(path+"\\"+fileName);
						
						if(!file.exists())			//如果原文件中不存在此图片文件就进去
						{ 
							item.write(file); 
							int id=1;
							String route=path+'\\'+fileName;				//路径							
							
							userId = user.getMaxUserId() + 1;
							
							avatar_javabean avatar = new avatar_javabean();
							avatar.insertRoute(userId, route);
							
							user.userRegister(userId,username, gender,password, school, birthday, homeland);
							
							HttpSession session = request.getSession();
							session.setAttribute("userId", userId);
							session.setAttribute("username", username);
							session.setAttribute("password", password);
							session.setMaxInactiveInterval(3600);			
							response.sendRedirect("/36_Life/HomePage.jsp");			
						} 
					} 
				} 
		}
		catch (Exception e) 
		{ 
				e.printStackTrace(); 
				} 
	}	

}
