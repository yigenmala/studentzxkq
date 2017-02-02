package com.kaoqin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaoqin.dao.*;
import com.kaoqin.po.*;
import com.kaoqin.util.KqTool;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		System.out.println("========");
		
		String userName = request.getParameter("userName");
		String userPass = request.getParameter("userPass");
		String userType = request.getParameter("userType");
		
		System.out.println(userName + userPass + userType);
		
		if(userName == null || userPass == null || userType == null || 
				userName.equals("") || userPass.equals("") || userType.equals("")) {
			//request.getRequestDispatcher("index.jsp").forward(request, response);
			out.println("<script language='javascript'>");
			out.println("alert('对不起，用户名或密码不能为空！');");
			out.println("window.location='login.html';");
			out.println("</script>");
		}
		
		HttpSession session = request.getSession();
		
		if(userType.equals("0")){			// student
			Student sd = new Student(userName,userPass);
			if(StudentDao.login(sd)) {
				session.setAttribute("admin", sd);
				response.sendRedirect("student/main.html");
			}
			
		} else if(userType.equals("1")){	// teacher
			Teacher th = new Teacher(userName,userPass);
			if(TeacherDao.login(th)) {
				session.setAttribute("admin", th);
				response.sendRedirect("teacher/main.html");
			}
		} else if(userType.equals("2")){	// admin
			Admin ad = new Admin(userName,userPass);
			if(AdminDao.login(ad)) {
				session.setAttribute("admin", ad);
				response.sendRedirect("admin/main.html");
			}
		}
		KqTool.printAlert(out, "对不起，用户名或密码错误！", "login.html");
		
	}


	public void init() throws ServletException {
	}

}
