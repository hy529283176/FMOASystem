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
	<style>
		.selectedStyle{
			 color: #8dcef7;	
		}
	</style>
  </head>
  
 <body style="background: #e1e9eb;">
 <%request.setCharacterEncoding("utf-8"); %>
		<form action="xitongguanli/select/searchSubject.action" id="mainForm" method="post">
			<div class="right">
				<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">系统管理</a> &gt; 会计科目&gt; 资产</div>
				<div class="rightCont">
					<p class="g_title fix">类别&nbsp;
							<span id="subjectClass">
								<a href="xitongguanli/assetSubject/getAssetSubjectList.action?bianhao=&mingcheng=&leixing=&acSub_classes=zichan" class="">资产</a>&nbsp;
								<a href="xitongguanli/assetSubject/getAssetSubjectList.action?bianhao=&mingcheng=&leixing=&acSub_classes=fuzhai" class="">负债</a>&nbsp;
								<a href="xitongguanli/assetSubject/getAssetSubjectList.action?bianhao=&mingcheng=&leixing=&acSub_classes=quanyi" class="">权益</a>&nbsp;
								<a href="xitongguanli/assetSubject/getAssetSubjectList.action?bianhao=&mingcheng=&leixing=&acSub_classes=chengben" class="">成本</a>&nbsp;
								<a href="xitongguanli/assetSubject/getAssetSubjectList.action?bianhao=&mingcheng=&leixing=&acSub_classes=sunyi" class="">损益</a>
							</span>
							<a class="btn03" href="xitongguanli/InsertSubject/getEditIndex.action" onclick="onClick(this);">新 增</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn11" href="#">删 除</a>
					</p>
					
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">编号：</td>
								<td>
									<input name="bianhao" type="text" class="allInput" value=""/>
								</td>
								<td width="90" align="right">名称：</td>
								<td>
									<input name="mingcheng" type="text" class="allInput" value=""/>
								</td>
								<td width="90" align="right">类型：</td>
								<td>
									<input name="leixing" type="text" class="allInput" value=""/>
									<input name="classtype" type="hidden" class="allInput" value="${classtype}"/>
									<input name="currentPage" type="hidden" class="allInput" value="${page.currentPage}"/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table id="subjectTable" class="tab2" width="100%">
							<tbody>
								<tr>
								    <th><input type="checkbox" id="all" onclick=""/></th>
								    <th>编号</th>
								    <th>名称</th>
								    <th>类型</th>
								    <th>余额方向</th>
								    <th>状态</th>
								    <th>操作</th>
								</tr>
								<c:forEach items="${subjectList}" var="sub">
									<tr>
										<td><input type="checkbox" /></td>
										<td>${sub.acSub_id}</td>
										<td>${sub.acSub_name}</td>
										<td>${sub.acSub_property}</td>
										<td>${sub.balanceDirection}</td>
										<c:choose>
											<c:when test="${sub.enStatus == true}">
											    <td>启用</td>
											</c:when>
											<c:otherwise>
												<td>未启用</td>
											</c:otherwise>
										</c:choose>
										<td>
											<a href="xitongguanli/update/getUpdateIndex.action?id=${sub.acSub_id}">修改</a>&nbsp;
											<a href="xitongguanli/delete/deleteSubject.action?id=${sub.acSub_id}" onclick="return window.confirm('确定删除吗？该科目的凭证也会删除哦!')">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class='page fix'>
							共 <b>${page.totalCount}</b> 条
							<a
							<c:if test="${page.currentPage == 1}">onclick="mes('已经是首页');return false;"</c:if>
							 href='xitongguanli/select/searchSubject.action?bianhao=${bianhao}&mingcheng=${mingcheng}&leixing=${leixing}&classtype=${classtype}&currentPage=1' class='first'>首页</a>
							<a 
							<c:if test="${page.currentPage == 1}">style="color:#ccc;" onclick="mes('已经是首页');return false;"</c:if>
							href='xitongguanli/select/searchSubject.action?bianhao=${bianhao}&mingcheng=${mingcheng}&leixing=${leixing}&classtype=${classtype}&currentPage=${page.currentPage-1}' class='pre'>上一页</a>
							当前第<span>${page.currentPage}</span>页,共<span>${page.totalPage}</span>页
							<a 
							<c:if test="${page.currentPage == page.totalPage}">style="color:#ccc;" onclick="mes('已经是末页');return false;"</c:if>
							href='xitongguanli/select/searchSubject.action?bianhao=${bianhao}&mingcheng=${mingcheng}&leixing=${leixing}&classtype=${classtype}&currentPage=${page.currentPage+1}' class='next'>下一页</a>
							<a
							<c:if test="${page.currentPage == page.totalPage}">onclick="mes('已经是末页');return false;"</c:if>
							 href='xitongguanli/select/searchSubject.action?bianhao=${bianhao}&mingcheng=${mingcheng}&leixing=${leixing}&classtype=${classtype}&currentPage=${page.totalPage}' class='last'>末页</a>
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
