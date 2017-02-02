package com.kaoqin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaoqin.dao.TeacherDao;
import com.kaoqin.po.Teacher;
import com.kaoqin.util.KqTool;

public class DelTeacher extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		
		System.out.println("del teacher-id:  " + id);
		
		if(id == null || id.equals("")) {
			KqTool.printAlertAndGoBack(out, "�Ƿ�����!");
		} else {

			if(TeacherDao.delTeacher(id)) {
				KqTool.printAlert(out, "�����ɹ���", "showTeacher.jsp");
			} else {
				KqTool.printAlertAndGoBack(out, "����ʧ�ܣ�");
			}
		}
	}

}
