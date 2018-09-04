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
		<form action="pingzhengguanli/getVoucher/getVoucherList.action" id="mainForm" method="post">
			<div class="right">
				<div class="current">当前位置：<a href="javascript:void(0)" style="color:#6E6E6E;">凭证管理</a> &gt; 凭证汇总表</div>
				<div class="rightCont">
					<p class="g_title fix">凭证汇总表 &nbsp;&nbsp;&nbsp;&nbsp;<a id="export" class="btn04">导出</a></p>
					<table class="tab1">
						<tbody>
							<tr>
								<td width="90" align="right">凭证日期：</td>
								<td>
									<input name="qijian1" type="date" class="allInput"/>至<input name="qijian2" type="date" class="allInput"/>
								</td>
								<td width="90" align="right">凭证号：</td>
								<td>
									<input name="voucher_id1" type="text" class="allInput" value="" style="height:30px;" />至<input style="height:30px;" name="voucher_id2" type="text" class="allInput" value=""/>
									<input name="currentPage" type="hidden" class="allInput" value="${page.currentPage}"/>
								</td>
	                            <td width="85" align="right"><input type="submit" class="tabSub" value="查 询" /></td>
	       					</tr>
						</tbody>
					</table>
					<div class="zixun fix">
						<table id="voucherListTale" class="tab2" width="100%">
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
									</tr>
								</c:forEach>
							</tbody>
						</table>
							<div class='page fix'>
							共 <b>${page.totalCount}</b> 条
							<a
							<c:if test="${page.currentPage == 1}">onclick="mes('已经是首页');return false;"</c:if>
							 href='pingzhengguanli/getVoucher/getVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&voucher_id1=${voucher_id1}&voucher_id2=${voucher_id2}&currentPage=1' class='first'>首页</a>
							<a 
							<c:if test="${page.currentPage == 1}">style="color:#ccc;" onclick="mes('已经是首页');return false;"</c:if>
							href='pingzhengguanli/getVoucher/getVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&voucher_id1=${voucher_id1}&voucher_id2=${voucher_id2}&currentPage=${page.currentPage-1}' class='pre'>上一页</a>
							当前第<span>${page.currentPage}</span>页,共<span>${page.totalPage}</span>页
							<a 
							<c:if test="${page.currentPage == page.totalPage}">style="color:#ccc;" onclick="mes('已经是末页');return false;"</c:if>
							href='pingzhengguanli/getVoucher/getVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&voucher_id1=${voucher_id1}&voucher_id2=${voucher_id2}&currentPage=${page.currentPage+1}' class='next'>下一页</a>
							<a
							<c:if test="${page.currentPage == page.totalPage}">onclick="mes('已经是末页');return false;"</c:if>
							 href='pingzhengguanli/getVoucher/getVoucherList.action?qijian1=${qijian1}&qijian2=${qijian2}&voucher_id1=${voucher_id1}&voucher_id2=${voucher_id2}&currentPage=${page.totalPage}' class='last'>末页</a>
						</div>
					</div>
				</div>
			</div>
	    </form>
	    <script type="text/javascript">
	    	function mes(m){
	    		alert(m);
	    	}
	    	
	    	/*导出Excel表*/
	    	function ExportTableToExcel(){
	    		alert(1);
	    		JSExportTableToExcel('voucherListTale');
	    	}
	    	function JSExportTableToExcel(tableid) {
     		    var curTbl = document.getElementById(tableid);
      			var oXL = null;
      			try{
        			oXL = new ActiveXObject("Excel.Application"); //创建AX对象excel
      			}catch(e){
        			alert("无法启动Excel!\n\n如果您确信您的电脑中已经安装了Excel，"+"那么请调整IE的安全级别。\n\n具体操作：\n\n"+"工具 → Internet选项 → 安全 → 自定义级别 → 对没有标记为安全的ActiveX进行初始化和脚本运行 → 启用");
        			return false;
      			}
      			var oWB = oXL.Workbooks.Add(); //获取workbook对象
      			var oSheet = oWB.ActiveSheet;//激活当前sheet
      			var sel = document.body.createTextRange();
      			sel.moveToElementText(curTbl); //把表格中的内容移到TextRange中
      			sel.select(); //全选TextRange中内容
      			sel.execCommand("Copy");//复制TextRange中内容
      			oSheet.Paste();//粘贴到活动的EXCEL中
      			oXL.Visible = true; //设置excel可见属性
      			var fname = oXL.Application.GetSaveAsFilename("将table导出到excel.xls", "Excel Spreadsheets (*.xls), *.xls");
      			oWB.SaveAs(fname);
      			oWB.Close();
      			oXL.Quit();
    		}
    	// 使用outerHTML属性获取整个table元素的HTML代码（包括<table>标签），然后包装成一个完整的HTML文档，设置charset为urf-8以防止中文乱码
        var html = "<html><head><meta charset='utf-8' /></head><body>" + document.getElementsByTagName("table")[1].outerHTML + "</body></html>";
        // 实例化一个Blob对象，其构造函数的第一个参数是包含文件内容的数组，第二个参数是包含文件类型属性的对象
        var blob = new Blob([html], { type: "application/vnd.ms-excel" });
        var a = document.getElementsByTagName("a")[1];
        // 利用URL.createObjectURL()方法为a元素生成blob URL
        a.href = URL.createObjectURL(blob);
        // 设置文件名，目前只有Chrome和FireFox支持此属性
        a.download = "凭证汇总表.xls";
	    </script>
	</body>
</html>
