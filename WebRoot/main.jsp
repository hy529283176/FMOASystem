<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<link href="<%=basePath%>/css/css.css" type="text/css" rel="stylesheet" />
	<link href="<%=basePath%>/css/main.css" type="text/css" rel="stylesheet" />
	<link rel="shortcut icon" href="<%=basePath%>/images/main/favicon.ico" />
	<script type="text/javascript" src="<%=basePath%>/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/echarts3.8.5/echarts.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/echarts3.8.5/theme/macarons.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/echarts3.8.5/echartsapp/zichanecharts.js"></script>
	<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#main{ font-size:12px;}
#main span.time{ font-size:14px; color:#528dc5; width:100%; padding-bottom:10px; float:left}
#main div.top{ width:100%; background:url(../images/main/main_r2_c2.jpg) no-repeat 0 10px; padding:0 0 0 15px; line-height:35px; float:left}
#main div.sec{ width:100%; background:url(../images/main/main_r2_c2.jpg) no-repeat 0 15px; padding:0 0 0 15px; line-height:35px; float:left}
.left{ float:left}
#main div a{ float:left}
#main span.num{  font-size:30px; color:#538ec6; font-family:"Georgia","Tahoma","Arial";}
.left{ float:left}
div.main-tit{ font-size:14px; font-weight:bold; color:#4e4e4e; background:url(../images/main/main_r4_c2.jpg) no-repeat 0 33px; width:100%; padding:30px 0 0 20px; float:left}
div.main-con{ width:100%; float:left; padding:10px 0 0 20px; line-height:36px;}
div.main-corpy{ font-size:14px; font-weight:bold; color:#4e4e4e; background:url(../images/main/main_r6_c2.jpg) no-repeat 0 33px; width:100%; padding:30px 0 0 20px; float:left}
div.main-order{ line-height:30px; padding:10px 0 0 0;}
</style>
  </head>
  
  <body>
   		<div id="mainECharts" style="height:300px;width:350px;float:left;">
   			
   		</div>
   		<div id="mainECharts1" style="height:300px;width:350px;float:left;">
   			
   		</div>
   		<div id="mainECharts2" style="height:300px;width:350px;float:left;">
   			
   		</div>
   		<script type="text/javascript">
   			$(document).ready(function(){
				var myData = {zichan:{legend:['资产','负债','成本','盈利'],data:[200,100,100,200]}};
   				echarts_tjfa(myData,"mainECharts");
   				echarts_tjfa(myData,"mainECharts1"); 
   				echarts_tjfa(myData,"mainECharts2");  
      		});
   		</script>
  </body>
</html>
