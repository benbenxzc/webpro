package SERVLET;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lifejavabean.activity_javabean;

public class EditActivitiesServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditActivitiesServlet() {
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

		int activityId = Integer.parseInt(new String(request.getParameter("activityId").trim().getBytes("iso-8859-1"), "utf-8"));
		String activityName = new String(request.getParameter("activityName").trim().getBytes("iso-8859-1"), "utf-8");
		String activityType = new String(request.getParameter("activityType").trim().getBytes("iso-8859-1"), "utf-8");
		String activityAddress = new String(request.getParameter("activityAddress").trim().getBytes("iso-8859-1"), "utf-8");
		String contactWay = new String(request.getParameter("contactWay").trim().getBytes("iso-8859-1"), "utf-8");
		String activitStartdate = new String(request.getParameter("activityEndDate").trim().getBytes("iso-8859-1"), "utf-8");	//活动开展时间
		String activityContent = new String(request.getParameter("activityContent").trim().getBytes("iso-8859-1"), "utf-8");
		
		try {
			activity_javabean activitybean = new activity_javabean();
			
			activitybean.updateName(activityName, activityId);
			activitybean.updatetype(activityType, activityId);
			activitybean.updateContactWay(contactWay, activityId);
			activitybean.updateStartdate(activitStartdate, activityId);
			activitybean.updateactaddress(activityAddress, activityId);
			activitybean.updateactcontent(activityContent, activityId);
			response.sendRedirect("/36_Life/MyActivities.jsp");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
