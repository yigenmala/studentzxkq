<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@page import="com.kaoqin.dao.TeacherDao"%>
<%@page import="com.kaoqin.po.Student"%>
<% 
	Student admin = (Student)session.getAttribute("admin");
	if(null == admin) {
		out.println("�Ƿ�����");
		return;
	}
	
	long sid = admin.getId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE19 {
	color: #344b50;
	font-size: 12px;
}
.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}
.STYLE22 {
	font-size: 12px;
	color: #295568;
}
a:link {font-size:12px; text-decoration:none; color:#344b50;}
a:visited {font-size:12px; text-decoration:none; color:#344b50;}
a:hover{font-size:12px; text-decoration:none; color:#FF0000;}
-->
</style>
<script>
var  highlightcolor='#d5f4fe';
//�˴�clickcolorֻ����winϵͳ��ɫ������ܳɹ�,�����#xxxxxx�Ĵ���Ͳ���,��û�����Ϊʲô:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>


</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">&nbsp;��ٻ�����Ϣ�б�</span></td>
              </tr>
            </table></td><%--
            <td>
               <div align="right"><span class="STYLE1">
               <input type="checkbox" name="checkbox11" id="checkbox11" />
                 ȫѡ&nbsp;&nbsp;<img src="images/add.gif" width="10" height="10" /> ����   &nbsp; <img src="images/del.gif" width="10" height="10" /> ɾ��    &nbsp;&nbsp;<img src="images/edit.gif" width="10" height="10" /> �༭   &nbsp;</span><span class="STYLE1"> &nbsp;</span></div>
            </td>
          --%></tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
      <tr>
        <td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">
          ���</div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">ѧ��</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��ʦ���</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">����</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�γ���</span></div></td>
        <td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�������</span></div></td>
        <td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">�Ǽ�����</span></div></td>
        <td width="20%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">���ԭ��</span></div></td>
        <td width="6%" height="20" bgcolor="d3eaef" class="STYLE6"><div align="center"><span class="STYLE10">��׼</span></div></td>
      </tr>
      <%
      		com.kaoqin.db.Conn conn = new com.kaoqin.db.Conn();
      		ResultSet rs = conn.executeQuery("select kid,tid,sid,sname,tname,ktype,course,courseTime,redate,content,isOn from kq_view where sid=" + sid + " order by kid desc");
      		
      		int i = 0;
      		while(rs.next()) {
       %>
      <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=++i %></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><span class="STYLE19"><%=rs.getString("sid") %></span></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><span class="STYLE19"><%=rs.getString("tid") %></span></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rs.getString("ktype") %></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rs.getString("course") %></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rs.getString("courseTime") %></div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center"><%=rs.getString("redate") %></div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21"><%=rs.getString("content") %></div></td>
        <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE21"><%=rs.getString("isOn") %></div></td>
      </tr>
      <%
      		} 
      		rs.close();
      		conn.close();
      %>
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%"><div align="left"><span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;����<strong> <%=i%></strong> ����¼����ǰ��<strong> 1</strong> ҳ���� <strong>1</strong> ҳ</span></div></td>
        <td width="67%"><br /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>