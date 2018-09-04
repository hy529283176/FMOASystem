<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>e</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
		.saveBtn{
				height: 30px;
				width:auto;
				border-radius: 3px;
				border: solid 1px cornflowerblue;
				background-color: cornflowerblue;
				font-family: "黑体";
				font-size: 18px;
				color: white;
			}
			.saveBtn:hover{
				border: solid 1px #C9F6FA;
				background-color: #C9F6FA;
			}
</style>
  </head>
  
  <body style="background: #e1e9eb;">
    	<div>
    	<span>
    	记账时间范围：<input style="height:30px;" type="text" id="jizhangkaishi" name="jizhangkaishi" value=""/>至<input style="height:30px;" type="text" id="jizhangjieshu" name="jizhangjieshu" value=""/>
    	<input class="saveBtn" type="button" id="jizhangbtn" value="记账">
    	</span>
    	</div>
  </body>
</html>
