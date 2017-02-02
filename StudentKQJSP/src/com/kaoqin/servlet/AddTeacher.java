package com.kaoqin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kaoqin.dao.AdminDao;
import com.kaoqin.dao.TeacherDao;
import com.kaoqin.po.Admin;
import com.kaoqin.po.Teacher;
import com.kaoqin.util.KqTool;

public class AddTeacher extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
	 
		String tid = request.getParameter("tid");
		String userPass = request.getParameter("userPass");
		String name = request.getParameter("tname");
		String sex = request.getParameter("tsex");
		String course = request.getParameter("course");
		String office = request.getParameter("office");
		String remark = request.getParameter("remark");
		
		System.out.println(tid + " " + userPass + " " + name  + " " + sex + " " + course  + " " + office + " " + remark);
		
		if(tid == null || userPass == null || name == null || 
				tid.equals("") || userPass.equals(" ") || name.equals("")) {
			KqTool.printAlertAndGoBack(out, "对不起，信息不能为空！");
		} else {
			 
			Teacher t = new Teacher(tid,userPass,name,sex,office,course,remark);
			if(TeacherDao.addTeacher(t)) {
				KqTool.printAlertAndGoBack(out, "操作成功！");
			} else {
				KqTool.printAlertAndGoBack(out, "用户名已存在！");
			}
		}
		
	}

}
