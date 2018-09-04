<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  	<div class="title">用户维护</div>
		<div class="tbDiv">
			<form action="userAndRole/user/updateUser.action" method="post">
			<table id="tUser" class="tUser">
				<tr>
					<td class="tTitle">账号</td>
					<td class="tInput">
					<input class="inCss" style="background-color:#ccc;" type="text"
						id="username" name="username" value="${user.username}" readonly="readonly"/>
					</td>
					<td class="errCss"><span class="errUser"></span></td>
				</tr>
				<%/*
				<tr>
					<td class="tTitle">密码</td>
					<td class="tInput">
					<input class="inCss" type="text" id="pwd" name="pwd" 
					value="${user.pwd}" readonly="readonly" style="background-color:#ccc;"/>
					</td>
					<td class="errCss"><span class="errPwd"></span></td>
				</tr>
				 <*/%>
				<tr>
					<td class="tTitle">用户姓名</td>
					<td class="tInput">
					<input class="inCss" type="text" id="uName" name="uName" 
					value="${user.uName}"/>
					</td>
					<td class="errCss"><span class="errEName"></span></td>
				</tr>		
				
				<tr>
					<td class="tTitle">分配角色</td>
					<td class="tInput">
						<select id="role_id" name="role_id" class="sCSS">
							<c:forEach items="${roleList}" var="role">
								<option value="${role.role_id}" <c:if test="${role.role_id eq 5}">selected="selected"</c:if>>
									${role.role_name}
								</option>
							</c:forEach>
						</select>
					</td>
					<td class="errCss"><span></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">是否启用</td>
					<td class="tInput">
						<input type="radio" id="enStatus" name="enStatus" value="1" checked="checked"/>启用
						<input type="radio" id="enStatus1" name="enStatus" value="0" />不启用
					</td>
					<td class="errCss"><span>${info}</span></td>
				</tr>
				
				<tr>
					<td class="tbtn" colspan="3">
						<input class="btnSub" type="submit" id="submit" name="submit" value="更新" />
						<input class="btnSub" type="reset" id="reset" name="reset" value="重置" />
						<a href="userAndRole/user/getUserList.action?zhanghao=&mingcheng=&currentPage=1">返回</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
  </body>
</html>
