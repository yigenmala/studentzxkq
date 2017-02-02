<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
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
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
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
<form action="addQingJia" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">学生申请请假</span></td>
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
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
      <tr>
        <td width="28%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">课程名：</div></td>
        <td width="72%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="course" />
        *</div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">课程时间：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
		  <SCRIPT language=JavaScript src="meizzDate.js"></SCRIPT>
        <INPUT name="courseTime" readonly="readonly"><INPUT onclick=setday(this,document.all.courseTime) type=button value="."></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">请假类型：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <select name="ktype">
		  	<option value="病假">病假</option>
			<option value="事假">事假</option>
		  </select>
        </div></td>
      </tr>
      <tr>
        <td width="28%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">请假天数：</div></td>
        <td width="72%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="days" value=" " onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" />天</div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">教师：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <select name="tname" style="width:150px">
		  	<%
				com.kaoqin.db.Conn conn = new com.kaoqin.db.Conn();
				ResultSet rs = conn.executeQuery("select id,tname from teacher");
				 
				while(rs.next()){
			%>
		  	<option value="<%=rs.getString("id")%>"><%=rs.getString("tname")%></option>
			<%}
				rs.close();
				conn.close();
			%>
		  </select>
        </div></td>
      </tr>
      
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">请假原因：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <textarea name="content" cols="50" rows="5">   </textarea>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%">&nbsp;</td>
        <td width="67%"><input type="submit" value=" << 申 请  " /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>