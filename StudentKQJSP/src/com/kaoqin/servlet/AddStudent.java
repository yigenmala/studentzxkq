package com.kaoqin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaoqin.dao.StudentDao;
import com.kaoqin.po.Student;
import com.kaoqin.util.KqTool;

public class AddStudent extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("sid");
		String userPass = request.getParameter("pass");
		String name = request.getParameter("sname");
		String sex = request.getParameter("sex");
		String tclass = request.getParameter("tclass");
		String course = request.getParameter("course");
		String zy = request.getParameter("zy");
		String remark = request.getParameter("remark");
		
		System.out.println(userName + " " + userPass + " " + name  + " " + sex + " " + tclass  + " " + zy + " " + course + " " + remark);
		
		if(userName == null || userPass == null || name == null || 
				userName.equals("") || userPass.equals("") || name.equals("")) {
			KqTool.printAlertAndGoBack(out, "对不起，信息不能为空！");
		} else {
			
			Student s = new Student(userName,userPass,name,sex,zy,tclass,course,remark);
			if(StudentDao.addStudent(s)) {
				KqTool.printAlert(out, "操作成功！", "addStudent.jsp");
			} else {
				KqTool.printAlertAndGoBack(out, "操作失败！");
			}
		}
	}

}
