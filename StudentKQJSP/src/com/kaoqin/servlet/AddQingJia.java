package com.kaoqin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaoqin.dao.QingJiaDao;
import com.kaoqin.dao.StudentDao;
import com.kaoqin.po.QingJia;
import com.kaoqin.po.Student;
import com.kaoqin.util.KqTool;

public class AddQingJia extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String course = request.getParameter("course");
		String courseTime = request.getParameter("courseTime");
		String type = request.getParameter("ktype");
		String tid = request.getParameter("tid");
		String sid =request.getParameter("sid"); 
		String content = request.getParameter("content");
		String day = request.getParameter("days");
		int days = 0;
		
		try{
			days = Integer.parseInt(day);
		} catch(Exception e) {
			days = 1;
		}
		
		System.out.println(course + " " + courseTime + " " + type  + " " + tid + " " + content  + " " );
		
		if(course == null || courseTime == null || content == null || 
				course.equals("") || courseTime.equals("") || content.equals("")) {
			KqTool.printAlertAndGoBack(out, "对不起，信息不能为空！");
		} else {
			String   id = ((Student)request.getSession().getAttribute("admin")).getSid();
			QingJia qj = new QingJia( tid,sid,course,courseTime,type,content,days);
			if(QingJiaDao.addQingJia(qj)) {
				KqTool.printAlert(out, "操作成功！", "qj.jsp");
			} else {
				KqTool.printAlertAndGoBack(out, "操作失败！");
			}
		}
	}

}
