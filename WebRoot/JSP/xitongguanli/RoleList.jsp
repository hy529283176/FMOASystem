<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	<link href="<%=basePath%>/css/all.css" rel="stylesheet" type="text/css" >
  </head>
  
 <body style="background: #e1e9eb;">
 <%request.setCharacterEncoding("utf-8"); %>
		<form action="userAndRole/role/getRoleList.action" id="mainForm" method="post">
			<div class="right">
				<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">系统管理</a> &gt; 角色列表</div>
				<div class="rightCont">
					<p class="g_title fix">角色列表 &nbsp;&nbsp;<a class="btn03" href="userAndRole/role/getRoleIndex.action">添加角色</a></p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">编号：</td>
								<td>
									<input name="sid" type="text" class="allInput" value=""/>
								</td>
								<td width="90" align="right">角色名：</td>
								<td>
									<input name="sname" type="text" class="allInput" value=""/>
									<input name="currentPage" type="hidden" class="allInput" value="${page.currentPage}"/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table id="roleTable" class="tab2" width="100%">
							<tbody>
								<tr>
								    
								    <th>编号</th>
								    <th>角色名</th>
								    <th>操作</th>
								</tr>
								<c:forEach items="${roleList}" var="r">
									<tr>
										
										<td>${r.role_id}</td>
										<td>${r.role_name}</td>
										<td>
											<a href="userAndRole/role/UpdateIndex.action?rid=${r.role_id}">修改</a>&nbsp;
											<a href="userAndRole/role/deleteRole.action?id=${r.role_id}" onclick="return window.confirm('确定删除吗？')">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
							<div class='page fix'>
							共 <b>${page.totalCount}</b> 条
							<a
							<c:if test="${page.currentPage == 1}">onclick="mes('已经是首页');return false;"</c:if>
							 href='userAndRole/role/getRoleList.action?sid=${sid}&sname=${sname}&currentPage=1' class='first'>首页</a>
							<a 
							<c:if test="${page.currentPage == 1}">style="color:#ccc;" onclick="mes('已经是首页');return false;"</c:if>
							href='userAndRole/role/getRoleList.action?sid=${sid}&sname=${sname}&currentPage=${page.currentPage-1}' class='pre'>上一页</a>
							当前第<span>${page.currentPage}</span>页,共<span>${page.totalPage}</span>页
							<a 
							<c:if test="${page.currentPage == page.totalPage}">style="color:#ccc;" onclick="mes('已经是末页');return false;"</c:if>
							href='userAndRole/role/getRoleList.action?sid=${sid}&sname=${sname}&currentPage=${page.currentPage+1}' class='next'>下一页</a>
							<a
							<c:if test="${page.currentPage == page.totalPage}">onclick="mes('已经是末页');return false;"</c:if>
							 href='userAndRole/role/getRoleList.action?sid=${sid}&sname=${sname}&currentPage=${page.totalPage}' class='last'>末页</a>
						</div>
				</div>	
				</div>
				   
			</div>
			
		</form>		
		 <script type="text/javascript">
	    	function mes(m){
	    		alert(m);
	    	}
	    </script>
	</body>
</html>
