<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@page import="com.kaoqin.po.Teacher"%>
<%	
	String ktype = request.getParameter("ktype");
	String sid = request.getParameter("sid");
	String tid = request.getParameter("tid");
	
	if(ktype == null || sid == null || tid == null) {
		out.println("�Ƿ�����");
		return;
	}
	
	if(ktype.equals("yidao")) {
		ktype = "�ѵ�";
	} else if(ktype.equals("kuangke")){
		ktype = "����";
	}
	
	String course = ((Teacher)session.getAttribute("admin")).getCourse();
	
	com.kaoqin.db.Conn conn = new com.kaoqin.db.Conn();
	String sqlstr = "insert into kq(tid,sid,ktype,sname,course,courseTime,content) values(" + tid + "," + sid + ",'" + ktype + "','" + course + "',getdate(),'" + ktype + "')";
	int count = conn.executeUpdate(sqlstr);
	out.println(sqlstr);
	
	if(count > 0 ) {
		out.println("<script>");
		out.println("alert('�����ɹ�');location.href='teacherDM.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('����ʧ��');location.href='teacherDM.jsp';");
		out.println("</script>");
	}
%>