package SERVLET;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lifejavabean.photo_javabean;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadImages extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UploadImages() {
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			//request.setCharacterEncoding("utf-8");
			photo_javabean photobean = new photo_javabean();
			HttpSession session = request.getSession();
			int userId = (Integer)(session.getAttribute("userId"));
			String photoDescription = "";
			String route = "";
			
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
				for (int i = 0; i < items.size(); i++) 
				{ 
					FileItem item = items.get(i);
					file = new File("");
					//isFormField为true，表示这不是文件上传表单域 
					if(item.isFormField()) 
					{				
							photoDescription=item.getString();
							photoDescription = new String(photoDescription.getBytes("ISO-8859-1"),"UTF-8");						
					}
				
					if(!item.isFormField())
					{ 
						ServletContext sctx = getServletContext(); 
						//获得存放文件的物理路径 
						//upload下的某个文件夹 得到当前在线的用户 找到对应的文件夹 
						
						path = sctx.getRealPath("/photo_album"); 
						//获得文件名 
						fileName = item.getName(); 
						//该方法在某些平台(操作系统),会返回路径+文件名 
						fileName = fileName.substring(fileName.lastIndexOf("/")+1); 
						file = new File(path+"\\"+fileName);
						
						if(!file.exists())			//如果原文件中不存在此图片文件就进去
						{ 
							item.write(file); 
							int id=1;
							route = path+'\\'+fileName;				//路径							
							
							int photoid = photobean.getMaxUserId() + 1;
							Date date = new Date();			
						    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");        
						    String uploadtime = dateFormat.format(date);
							photobean.insertphoto(photoid, userId, photoDescription, uploadtime, route);
							response.sendRedirect("/36_Life/PhotoAlbum.jsp");
						}
					}
			}

	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
