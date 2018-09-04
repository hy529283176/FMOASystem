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
	<link href="<%=basePath%>/css/all.css" rel="stylesheet" type="text/css" >

  </head>
  
  <body style="background: #e1e9eb;">
  	<%request.setCharacterEncoding("utf-8"); %>
		<form action="pingzhengguanli/getVoucher/auditVoucherList.action" id="mainForm" method="post">
			<div class="right">
				<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">凭证管理</a> &gt; 审核凭证</div>
				<div class="rightCont">
					<p class="g_title fix">审核凭证</p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">会计期间：</td>
								<td>
									<input name="qijian1" type="date" class="allInput" value=""/>至<input name="qijian2" type="date" class="allInput" value=""/>
									<input name="currentPage" type="hidden" class="allInput" value="${page.currentPage}"/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th>日期</th>
								    <th>凭证字号</th>
								    <th>摘要</th>
								   	<th>科目</th>
								    <th>借方金额</th>
								    <th>贷方金额</th>
								    <th>制单人</th>
								    <th>审核人</th>
								    <th>记账人</th>
								    <th>操作</th>
								</tr>
								<c:forEach items="${voucherlist}" var="vlist">
								<tr>
										<c:choose>
  			 								<c:when test="${vlist.voucher_id == null}">
								 				<td></td>
								 				<td></td>
  			 								</c:when>
  			 								<c:when test="${vlist.voucher_id != null}">
												<td>${vlist.createTime}</td>
												<td>记${vlist.voucher_id}</td>
  			 								</c:when>    
										</c:choose>
										<td>${vlist.acsAbstract}</td>
										<td>${vlist.acSub_name}</td>
										<td>${vlist.debitMoney}</td>
										<td>${vlist.creditorMoney}</td>
										<td>${vlist.formMaker}</td>
										<td>${vlist.reChecker}</td>
										<td>${vlist.bookKeeper}</td>
										<c:choose>
  			 								<c:when test="${vlist.voucher_id == null}">
								 				<td></td>								 				
  			 								</c:when>
  			 								<c:when test="${vlist.voucher_id != null}">
												<td>
													<c:choose>
														<c:when test="${vlist.checkStatus eq false}">
															<a
															<c:if test="${vlist.formMaker eq uName}">
																onclick="return noAuth();"
															</c:if>												
															 href="pingzhengguanli/shenhe/shenheVoucher.action?voucherid=${vlist.voucher_id}&cstatus=1&checker=${uName}">审核</a>&nbsp;		
															<!--  <a href="pingzhengguanli/update/updateVoucher.action?voucherid=${vlist.voucher_id}">修改</a>-->
														</c:when>
														<c:otherwise>
															<a href="pingzhengguanli/shenhe/shenheVoucher.action?voucherid=${vlist.voucher_id}&cstatus=0&checker=">反审核</a>&nbsp;
														</c:otherwise>
													</c:choose>
													
													<a href="pingzhengguanli/delete/deleteVoucher.action?voucherid=${vlist.voucher_id}" onclick="return window.confirm('确定删除吗？')">删除</a>
												</td>
  			 								</c:when>    
										</c:choose>
										
									</tr>
								</c:forEach>
								<!-- 
									<tr>
										<td rowspan="2"><input type="checkbox" /></td>
										<td rowspan="2">2017-11-21</td>
										<td rowspan="2">记1</td>
										<td>aaa</td>
										<td>1001 银行存款</td>
										<td>1000</td>
										<td></td>
										<td rowspan="2">黄大锤</td>
										<td rowspan="2">黄小锤</td>
										<td rowspan="2">王铁锤</td>
										<td rowspan="2">
											<a href="#">修改</a>&nbsp;
											<a href="#">删除</a>
										</td>
									</tr>
									<tr>
										<td>aaa</td>
										<td>1002 库存现金</td>
										<td></td>
										<td>1000</td>
									</tr>
									 -->
							</tbody>
						</table>
						<div class='page fix'>
							共 <b>${page.totalCount}</b> 条
							<a
							<c:if test="${page.currentPage == 1}">onclick="mes('已经是首页');return false;"</c:if>
							 href='pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&currentPage=1' class='first'>首页</a>
							<a 
							<c:if test="${page.currentPage == 1}">style="color:#ccc;" onclick="mes('已经是首页');return false;"</c:if>
							href='pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&currentPage=${page.currentPage-1}' class='pre'>上一页</a>
							当前第<span>${page.currentPage}</span>页,共<span>${page.totalPage}</span>页
							<a 
							<c:if test="${page.currentPage == page.totalPage}">style="color:#ccc;" onclick="mes('已经是末页');return false;"</c:if>
							href='pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&currentPage=${page.currentPage+1}' class='next'>下一页</a>
							<a
							<c:if test="${page.currentPage == page.totalPage}">onclick="mes('已经是末页');return false;"</c:if>
							 href='pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&currentPage=${page.totalPage}' class='last'>末页</a>
						</div>
					</div>
				</div>
			</div>
	    </form>
	    <script type="text/javascript">
	    	function noAuth(){
	    		alert("审核人和制单人不能相同");
	    		return false;
	    	}
	    	function mes(m){
	    		alert(m);
	    	}
	    </script>
  </body>
</html>
