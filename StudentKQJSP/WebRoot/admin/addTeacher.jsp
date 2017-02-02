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
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE25 {color: #000000; font-size: 24px; }
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
<form action="addTeacher" method="post" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
	
      <tr>
        <td width="23%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center"></div></td>
        <td width="77%" height="20" bgcolor="d3eaef" class="STYLE25">添加教师</td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">职工编号：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><input type="text" name="tid" /></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">密码：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><input type="text" name="userPass" /></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">姓名：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left"><input type="text" name="tname" /></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"> 性别：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
        <select name="tsex" > 
       <option value="男">男</option>
       <option value="女">女 </option></select></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">办公室：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
        <select name="office" > 
       <option value="一号办公室">一号办公室</option>
        <option value="二号办公室">二号办公室 </option>
        <option value="政教处303">政教处303</option> </select></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">课程名：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
        <select name="course" > 
       <option value="C语言">C语言</option>
        <option value="Java语言">Java语言 </option>
        <option value="Asp.net">Asp.net</option> </select></div></td>
       
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">备注：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><textarea name="remark" cols="50" rows="5">一个好老师</textarea></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td aheight="30">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<input type="submit" value="添加" /> &nbsp; &nbsp; &nbsp;&nbsp;  
      <input type="reset" value="重置"/></td>
  </tr>
</table>
</form>
</body>
</html>
