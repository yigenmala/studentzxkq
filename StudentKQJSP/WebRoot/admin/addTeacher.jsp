<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
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
.STYLE6 {color: #000000; font-size: 12; }
.STYLE10 {color: #000000; font-size: 12px; }
.STYLE25 {color: #000000; font-size: 24px; }
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
<form action="addTeacher" method="post" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"  onmouseout="changeback()">
	
      <tr>
        <td width="23%" height="20" bgcolor="d3eaef" class="STYLE10"><div align="center"></div></td>
        <td width="77%" height="20" bgcolor="d3eaef" class="STYLE25">��ӽ�ʦ</td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">ְ����ţ�</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><input type="text" name="tid" /></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">���룺</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><input type="text" name="userPass" /></td>
      </tr>
      <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">������</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left"><input type="text" name="tname" /></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"> �Ա�</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
        <select name="tsex" > 
       <option value="��">��</option>
       <option value="Ů">Ů </option></select></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">�칫�ң�</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
        <select name="office" > 
       <option value="һ�Ű칫��">һ�Ű칫��</option>
        <option value="���Ű칫��">���Ű칫�� </option>
        <option value="���̴�303">���̴�303</option> </select></div></td>
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">�γ�����</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="left">
        <select name="course" > 
       <option value="C����">C����</option>
        <option value="Java����">Java���� </option>
        <option value="Asp.net">Asp.net</option> </select></div></td>
       
      </tr>
	  <tr>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center">��ע��</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><textarea name="remark" cols="50" rows="5">һ������ʦ</textarea></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td aheight="30">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<input type="submit" value="���" /> &nbsp; &nbsp; &nbsp;&nbsp;  
      <input type="reset" value="����"/></td>
  </tr>
</table>
</form>
</body>
</html>
