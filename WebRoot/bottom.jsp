<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=basePath%>/css/css.css" type="text/css" rel="stylesheet" />
	<style>
		#footer{font-size:12px;}
		.footer_pad{padding:7px 9px 5px 9px;}
	</style>
  </head>
  
  <body style="overflow-x:hidden; background:url(../images/main/bottombg.jpg) repeat-x top left;" onselectstart="return false" oncontextmenu=return(false) >
   	<table width="100%" border="0" cellspacing="0" cellpadding="0" id="footer">
 		<tr>
   			 <td align="center" valign="middle" class="footer_pad">计科本141&nbsp;&nbsp;黄勇</td>
  		</tr>
	</table>
  </body>
</html>
