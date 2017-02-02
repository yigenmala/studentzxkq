package com.kaoqin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaoqin.db.Conn;
import com.kaoqin.util.KqTool;

public class DelKq extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String kid = request.getParameter("kid");
		
		if(kid == null || kid.equals("")) {
			KqTool.printAlertAndGoBack(out, "�Բ�����Ϣ����Ϊ�գ�");
		} else {
			
			Conn conn = new Conn();
			int count = conn.executeUpdate("delete from kq where kid=" + kid);
			if(count > 0)  {
				KqTool.printAlert(out, "�����ɹ���", "showStudent.jsp");
			} else {
				KqTool.printAlertAndGoBack(out, "����ʧ�ܣ�");
			}
		}
	}

}
