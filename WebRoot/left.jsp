<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
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
	<link href="<%=basePath%>/css/css.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="<%=basePath%>/js/sdmenu.js"></script>
<script type="text/javascript">
	// <![CDATA[
	var myMenu;
	window.onload = function() {
		myMenu = new SDMenu("my_menu");
		myMenu.init();
	};
	// ]]>
</script>
<style type=text/css>
html{ SCROLLBAR-FACE-COLOR: #538ec6; SCROLLBAR-HIGHLIGHT-COLOR: #dce5f0; SCROLLBAR-SHADOW-COLOR: #2c6daa; SCROLLBAR-3DLIGHT-COLOR: #dce5f0; SCROLLBAR-ARROW-COLOR: #2c6daa;  SCROLLBAR-TRACK-COLOR: #dce5f0;  SCROLLBAR-DARKSHADOW-COLOR: #dce5f0; overflow-x:hidden;}
body{overflow-x:hidden; background:url(../images/main/leftbg.jpg) left top repeat-y #f2f0f5; width:194px;}
</style>
  </head>
  
  <body onselectstart="return false;" ondragstart="return false;" oncontextmenu="return false;">
   <div id="left-top">
	<div><img src="<%=basePath%>/images/main/member.gif" width="44" height="44" /></div>
    <span>用户：${UserName}<br>角色：${rolename}<br>姓名：${uName}</span>
</div>
    <div style="float: left" id="my_menu" class="sdmenu">
      <div class="collapsed">
        <span>凭证管理</span>
        <a href="<%=basePath%>/JSP/pingzhengguanli/InsertVoucher.jsp" target="mainFrame" onFocus="this.blur()">填写凭证</a>
        <a <c:if test="${rolename == '出纳员'}">onclick="noAuth();return false;"</c:if> href="pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=&qijian2=&currentPage=1" target="mainFrame" onFocus="this.blur()">审核凭证</a>
        <a href="pingzhengguanli/getVoucher/getVoucherList.action?qijian1=&qijian2=&voucher_id1=&voucher_id2=&currentPage=1" target="mainFrame" onFocus="this.blur()">凭证汇总</a>
      </div>
      
      <div>
        <span>账簿查询</span>
        <a href="zhangbuchaxun/SubjectRemainingSum.action" target="mainFrame" onFocus="this.blur()">科目余额</a>
        <a href="<%=basePath%>/JSP/zhangbuchaxun/TotleVoucherList.jsp" target="mainFrame" onFocus="this.blur()">总账</a>
      </div>
      
             
      <div>
        <span>财务报表</span>
         <a href="<%=basePath%>/JSP/zichanfuzhai/zichanfuzhaibiao.jsp" target="mainFrame" onFocus="this.blur()">资产负债表</a>
      </div>
      
      <div>
        <span>记账结账</span>
         <a 
         <c:choose>
         	 <c:when test="${rolename eq '管理员'}">
         	 	onclick="javascript:return true;"   
  			 </c:when>   
  			 <c:when test="${rolename eq '会计主管'}">
  			 	onclick="javascript:return true;"    
 			 </c:when>   
 			 <c:otherwise>
 			 	onclick="noAuth();return false;"    
 			 </c:otherwise>   
         </c:choose> 
         href="<%=basePath%>/JSP/jizhangjiezhang/jizhang.jsp" target="mainFrame" onFocus="this.blur()">记账</a>
         <a 
         <c:choose>
         	 <c:when test="${rolename eq '管理员'}">
         	 	onclick="javascript:return true;"   
  			 </c:when>   
  			 <c:when test="${rolename eq '会计主管'}">
  			 	onclick="javascript:return true;"    
 			 </c:when>   
 			 <c:otherwise>
 			 	onclick="noAuth();return false;"    
 			 </c:otherwise>   
         </c:choose> 
          href="<%=basePath%>/JSP/jizhangjiezhang/jiezhang.jsp" target="mainFrame" onFocus="this.blur()">期末结账</a>
      </div>
      
      <div>
        <span>系统管理</span>
        <a <c:if test="${rolename ne '管理员'}">onclick="noAuth();return false;"</c:if> href="xitongguanli/assetSubject/getAssetSubjectList.action?bianhao=&mingcheng=&leixing=&acSub_classes=zichan" target="mainFrame" onFocus="this.blur()">会计科目</a>
        <a <c:if test="${rolename ne '管理员'}">onclick="noAuth();return false;"</c:if> href="userAndRole/user/getUserList.action?zhanghao=&mingcheng=&currentPage=1" target="mainFrame" onFocus="this.blur()">用户管理</a>
        <a <c:if test="${rolename ne '管理员'}">onclick="noAuth();return false;"</c:if> href="userAndRole/role/getRoleList.action?sid=&sname=&currentPage=1" target="mainFrame" onFocus="this.blur()">角色管理</a>
      </div>
   		<script type="text/javascript">
   			function noAuth(){
   				alert("你没有权限!");
   			}
   		</script>
    </div>
  </body>
</html>
