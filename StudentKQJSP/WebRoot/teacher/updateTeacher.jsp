<%@ page contentType="text/html; charset=gb2312" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

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
<%
	String id = request.getParameter("id");
	if(id==null || id.equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('�Ƿ�����');");
		out.println("window.history.go(-1);");
		out.println("</script>");
		return;
	}
	com.kaoqin.po.Teacher tec =  com.kaoqin.dao.TeacherDao.getTeacherById(id);
%>
<body>
<form action="updateTeacher?id=<%=id%>" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">�޸Ľ�ʦ��Ϣ</span></td>
              </tr>
            </table></td>
            <td><div align="right"><span class="STYLE1">
              &nbsp;&nbsp;</span><span class="STYLE1">&nbsp; <br /></span></div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="1031" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()" height="267">
      <tr>
        <td width="28%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">ְ����ţ�</div></td>
        <td width="72%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left"><input type="text" name="Tid" value="<%=tec.getTid() %>" readonly="readonly" /><input type="text" name="tid" value="<%=tec.getTid() %>"/></div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">���룺</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left"><input type="text" name="userPass" value="<%=tec.getUserPass() %>" /></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">������</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="tname" value="<%=tec.getTname() %>" />
        </div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">�Ա�</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="tsex" value="<%=tec.getTsex() %>" />
        </div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">�칫�ң�</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="office" value="<%=tec.getOffice() %>" />
        </div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">�γ�����</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="course" value=" <%=tec.getCourse() %>" />
        </div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">��ע��</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <textarea name="remark" cols="50" rows="5"><%=tec.getRemark() %></textarea>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%">&nbsp;</td>
        <td width="67%"><input type="submit" value=" << �� ��  " /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>