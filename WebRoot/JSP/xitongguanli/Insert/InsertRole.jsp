<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="<%=basePath%>/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/tableRowsStyle.js" ></script>
	<link rel="stylesheet" href="<%=basePath%>/css/insertTableCSS.css" />

  </head>
  
  <body onload="trColor(); ">
  	<div class="title">新增角色</div>
		<div class="tbDiv">
			<form action="userAndRole/role/insertRole.action" method="post">
			<table id="tUser" class="tUser">
				<tr>
					<td class="tTitle">角色名</td>
					<td class="tInput">
					<input class="inCss" type="text" id="role_name" name="role_name" value=""/>
					</td>
					<td class="errCss"><span class="errRole">${info}</span></td>
				</tr>
				<tr>
					<td class="tbtn" colspan="3">
						<input class="btnSub" type="submit" id="submit" name="submit" value="保存" />
						<input class="btnSub" type="reset" id="reset" name="reset" value="重置" />
						<a href="userAndRole/role/getRoleList.action?sid=&sname=&currentPage=1">返回</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
  </body>
</html>
