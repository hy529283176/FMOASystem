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
	
  </head>
  
  <body onselectstart="return false" oncontextmenu=return(false) style="overflow-x:hidden;">
  	<!--禁止网页另存为-->
<noscript><iframe scr="*.jsp"></iframe></noscript>
<!--禁止网页另存为-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="header">
  <tr>
    <td rowspan="2" align="left" valign="top" id="logo"><img src="<%=basePath%>/images/main/logo.png" width="64" height="64"></td>
    <td align="left" valign="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="bottom" id="header-name">黄大宝财务管理系统</td>
        <td align="right" valign="top" id="header-right">
        	<a href="loginOut.action" onFocus="this.blur()" class="admin-out">注销</a>
           <a href="JSP/xitongguanli/Update/UpdatePwd.jsp" target="mainFrame" onFocus="this.blur()" class="admin-home">修改密码</a>
        	<a href="main.jsp" target="mainFrame" onFocus="this.blur()" class="admin-index">首页</a>       	
          <span>
						<!-- 日历 -->
						<SCRIPT type=text/javascript src="<%=basePath%>/js/clock.js"></SCRIPT>
						<SCRIPT type=text/javascript>showcal();</SCRIPT>
          </span>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
  </body>
</html>
