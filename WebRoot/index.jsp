<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% String uName = (String)request.getAttribute("UserName"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>黄大宝财务管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/css.css" type="text/css" rel="stylesheet" />
  </head>
  
<!--框架样式-->
<frameset rows="95,*,30" cols="*" frameborder="no" border="0" framespacing="0">
<!--top样式-->
	<frame src="top.jsp" name="topframe" scrolling="no" noresize id="topframe" title="topframe" />
	
	<!--contact样式-->
	<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="194,12,*" rows="*">
		<frame scrolling="auto" noresize="" frameborder="no" name="leftFrame" src="left.jsp"></frame>
		<frame id="leftbar" scrolling="no" noresize="" name="switchFrame" src="switch.jsp"></frame>
		<frame scrolling="auto" noresize="" border="0" name="mainFrame" src="main.jsp"></frame>
	</frameset>
	
	<!--bottom样式-->
	<frame src="bottom.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
	
</frameset>
	
	<noframes></noframes>
	<!--不可以删除-->
</html>
