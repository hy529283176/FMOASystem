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
	<script type="text/javascript">
		function pwdCheck(){
			var pwd = document.getElementById("pwd");
			var errPwd = document.getElementById("errPwd");
			var regx = /[a-zA-Z0-9]+/;
			
			if(pwd.value == "" )
			{
				errPwd.errPwd = "spanStyleErr";
				errPwd.innerHTML = "密码不能为空";
				return false;
			}
			
			if(pwd.value.length<5 || pwd.value.length>12)
			{
				//改变classname从而可以控制样式
				errPwd.className="spanStyleErr";
				//span修改内容用innerHTML
				errPwd.innerHTML = "长度5~12";
				return false;
			}
			
			if(!regx.exec(pwd.value.trim())){
					//改变classname从而可以控制样式
					errPwd.className="spanStyleErr";
					//span修改内容用innerHTML
					errPwd.innerHTML = "密码为数字与字母组合";
					return false;
			}
			errPwd.className="spanStyle";
			errPwd.innerHTML="√";
			return true;
		}
		function pwdReCheck(){
			var pwd = document.getElementById("pwd");
			var rPwd = document.getElementById("rPwd");
			var errRPwd = document.getElementById("errRPwd");
			if(rPwd.value != pwd.value || rPwd.value ==""){
					errRPwd.className = "spanStyleErr";
					errRPwd.innerHTML = "密码不一致";
					return false;
			}
			errRPwd.className="spanStyle";
			errRPwd.innerHTML="√";
			return true;
		}
		function formsubmit(){
			if(pwdCheck() & pwdReCheck()){
				return true;
			}
			return false;	
		}
	</script>
  </head>
  
  <body onload="trColor(); ">
  	<div class="title">密码修改</div>
		<div class="tbDiv">
			<form action="userAndRole/updatePwd.action" method="post" onsubmit="return formsubmit(); ">
			<table id="tUser" class="tUser">
				<tr>
					<td class="tTitle">账号</td>
					<td class="tInput">
					<input class="inCss" style="background-color:#ccc;" type="text"
						id="username" name="username" value="${UserName}" readonly="readonly"/>
					</td>
					<td><span id="errUsername" class="spanStyleErr"></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">密码</td>
					<td class="tInput">
					<input class="inCss" type="password" id="pwd" name="pwd" 
					value="" onblur="pwdCheck();"/>
					</td>
					<td><span id="errPwd" class="spanStyleErr"></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">确认密码</td>
					<td class="tInput">
					<input class="inCss" type="password" id="rPwd" name="rPwd" 
					value="" onblur="pwdReCheck();"/>
					</td>
					<td><span id="errRPwd" class="spanStyleErr">${info}</span></td>
				</tr>		
				
				<tr>
					<td class="tbtn" colspan="3">
						<input class="btnSub" type="submit" id="submit" name="submit" value="修改" />
						<input class="btnSub" type="reset" id="reset" name="reset" value="重置" />
						<a href="main.jsp">返回</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
  </body>
</html>
