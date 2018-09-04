<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" href="<%=basePath%>/css/login.css" />
	<script>
			function formsubmit(){
				var username = document.getElementById("username").value;
				var pwd = document.getElementById("password").value;
				var errUname = document.getElementById("errUname");
				var errPwd = document.getElementById("errPwd");
				
				if(username.trim().length==0 & pwd.trim().length==0)
				{
					errUname.innerHTML = "请输入用户名";
					errPwd.innerHTML = "请输入密码";
					return false;
				}else{
				    return true;	
				}
			}
			if (top.location != self.location){       
				top.location=self.location;       
			} 
		</script>
  </head>
  
  <body>
   <form action="<%=basePath%>/doLogin.action" method="post" onsubmit="return formsubmit(); ">
		<div class="login">
			<div class="user">
				<div class="userA">
					<span class="txtUser">账套</span>
					<span>
						<select id="zhangtao" name="zhangtao" >
							<option value="1">广西桂平黄大宝服装有限公司</option>
						</select>
					</span>
					<span></span>
				</div>
				
				<div class="userB">
					<span class="txtUser">用户名</span>
					<span>
						<input type="text" id="username" name="username" value="" class="inSty"/>
					</span>
					
				</div>
				<div class="errMes"><span id="errUname" class="errUsername"></span></div>
				
				<div class="userC">
					<span class="txtUser">密码</span>
					<span>
						<input type="password" id="password" name="password" value="" class="inSty" style="margin-left:30px;"/>
					</span>
				</div>
				<div class="errMes"><span id="errPwd" class="errPassword"></span></div>
				
				<div class="userD">
					<span class="txtUser">角色</span>
					<span id="txtUserD">
						<select id="auth" name="auth">
						<c:forEach items="${loginRoleList}" var="role" varStatus="st">
						<option <c:if test="${st.count == 5}">selected="selected"</c:if> >
							${role.role_name}
						</option>
						</c:forEach>
					</select>
					</span>
				</div>
				
				<div class="userE">
					<span></span>
					<span>
						<input type="image" id="btn_login" name="btn_login" src="<%=basePath%>/images/login/btnlogin.gif"/>
					</span>
				</div>
				<div class="userE"><span>${loginError}</span></div>
			</div>
		</div>
		</form>
  </body>
</html>
