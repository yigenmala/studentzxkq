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

public class UpdateStudent extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		 
		String sid = request.getParameter("sid");
		String pass = request.getParameter("pass");
		String name = request.getParameter("tname");
		String sex = request.getParameter("tsex");
		String zy = request.getParameter("zy");
		String course = request.getParameter("course");
		String tclass = request.getParameter("tclass");
		String remark = request.getParameter("remark");

		System.out.println(sid + " " + pass + " " + name + " " + sex
				+ " " + course + " " + zy + " " + tclass + " " + remark);

		if (sid == null || pass == null || name == null
				|| sid.equals("") || pass.equals("")
				|| name.equals("")) {
			KqTool.printAlertAndGoBack(out, "对不起，信息不能为空！");
		} else {

			Student s = new Student(sid, pass, name, sex,zy,tclass,course,remark);
			if (StudentDao.updateStudent(s,sid)) {
				 
				KqTool.printAlert(out, "操作成功！", "showStudent.jsp");
			} else {
				KqTool.printAlertAndGoBack(out, "操作失败！");
			}
		}

	}

}
