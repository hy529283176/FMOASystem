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
		<form action="#" id="mainForm" method="post">
			<div class="right">
				<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">账簿查询</a> &gt; 科目余额</div>
				<div class="rightCont">
					<p class="g_title fix">科目余额&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn04" href="#">导出</a></p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">凭证日期：</td>
								<td>
									<input name="createTime" type="date" class="allInput"/>至<input name="createTime" type="date" class="allInput"/>
								</td>
								<td width="90" align="right">凭证号：</td>
								<td>
									<input name="periods_id" type="text" class="allInput" value="" style="height:30px;" />至<input style="height:30px;" name="periods_id" type="text" class="allInput" value=""/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table class="tab2" width="100%">
							<tbody>
								<tr>
								    <th rowspan="2">科目编码</th>
								    <th rowspan="2">科目名称</th>
								    <th colspan="2">期初余额</th>
								    <th colspan="2">本期发生额</th>
								    <th colspan="2">本年累计发生额</th>
								    <th colspan="2">期末余额</th>
								</tr>
								<tr>
								    <th>借方</th>
								    <th>贷方</th>
								    <th>借方</th>
								    <th>贷方</th>
								    <th>借方</th>
								    <th>贷方</th>
								    <th>借方</th>
								    <th>贷方</th>
								</tr>
								<tr>
										<td>1101</td>
										<td>库存现金</td>
										<td>10000.00</td>
										<td></td>
										<td>1111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
								</tr>
								<tr>
										<td>1102</td>
										<td>银行存款</td>
										<td>10000.00</td>
										<td></td>
										<td>1111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
								</tr>
								<tr>
										<td>1103</td>
										<td>持有股票</td>
										<td>10000.00</td>
										<td></td>
										<td>1111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
								</tr>
								<tr>
										<td>1104</td>
										<td>保险柜现金</td>
										<td>10000.00</td>
										<td></td>
										<td>1111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
								</tr>
								<tr>
										<td>1105</td>
										<td>第三方贷款</td>
										<td>10000.00</td>
										<td></td>
										<td>1111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
										<td>11111.00</td>
										<td></td>
								</tr>
							</tbody>
						</table>
						<div class='page fix'>
							共 <b>5</b> 条
							<a href='###' class='first'>首页</a>
							<a href='###' class='pre'>上一页</a>
							当前第<span>1/1</span>页
							<a href='###' class='next'>下一页</a>
							<a href='###' class='last'>末页</a>
						</div>
					</div>
				</div>
			</div>
	    </form>
	    <script type="text/javascript">
	    	// 使用outerHTML属性获取整个table元素的HTML代码（包括<table>标签），然后包装成一个完整的HTML文档，设置charset为urf-8以防止中文乱码
        	var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementsByTagName("table")[1].outerHTML + "</body></html>";
        	// 实例化一个Blob对象，其构造函数的第一个参数是包含文件内容的数组，第二个参数是包含文件类型属性的对象
        	var blob = new Blob([html], { type: "application/vnd.ms-excel" });
        	var a = document.getElementsByTagName("a")[1];
        	// 利用URL.createObjectURL()方法为a元素生成blob URL
       	 	a.href = URL.createObjectURL(blob);
        	// 设置文件名，目前只有Chrome和FireFox支持此属性
        	a.download = "科目余额表.xls";
	    </script>
	</body>
</html>
