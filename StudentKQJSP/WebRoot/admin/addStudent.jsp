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
<form action="addStudent" method="post">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24" bgcolor="#353c44"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="6%" height="19" valign="bottom"><div align="center"><img src="images/tb.gif" width="14" height="14" /></div></td>
                <td width="94%" valign="bottom"><span class="STYLE1">添加学生信息</span></td>
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
        <td width="28%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">学号：</div></td>
        <td width="72%" height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="sid" />
        </div></td>
      </tr>
      <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">密码：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left"><input type="text" name="pass" /></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">&nbsp;姓名：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <input type="text" name="sname" />
        </div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">性别：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <select name="sex"  > 
       <option value="男">男</option>
       <option value="女">女 </option></select></div></td></tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">班级：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
         <select name="tclass" > 
       <option value="1301">1301</option>
       <option value="1401">1401 </option>
       <option value="1501">1501 </option>
       <option value="1601">1601 </option>
       <option value="1401">1602 </option>
       </select> </div></td></tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">专业：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <select name="zy" > 
       <option value="计算机科学与技术">计算机科学与技术</option>
        <option value="电子信息">电子信息 </option>
        <option value="信息管理">信息管理</option> </select>
        </div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="d3eaef" class="STYLE10"><div align="center">备注：</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
          <textarea name="remark" cols="50" rows="5"> </textarea>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33%">&nbsp;</td>
        <td width="67%"><input type="submit" value=" << 添 加   " /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>