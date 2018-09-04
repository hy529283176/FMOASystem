<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("UTF-8");%>
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
  		function addOptions(){ 
			//根据id查找对象， 
			var spro = document.getElementById("sPro");
			var sprolength = spro.length;
			
			var stype = document.getElementById("sType");
			var stypeIndex = stype.selectedIndex;
			var stypeValue = stype.options[stypeIndex].value;
			
			if(sprolength != 0 ){
				spro.length = 0;
			}
			if(stypeValue == "zichan"){
				spro.add(new Option("流动资产","流动资产"));
				spro.add(new Option("非流动资产","非流动资产"));
			}
			if(stypeValue == "fuzhai"){
				spro.add(new Option("流动负债","流动负债"));
				spro.add(new Option("非流动负债","非流动负债"));
			}
			if(stypeValue == "quanyi"){
				spro.add(new Option("所有者权益","所有者权益"));
			}
			if(stypeValue == "chengben"){
				spro.add(new Option("成本","成本"));
			}
			if(stypeValue == "sunyi"){
				spro.add(new Option("营业收入","营业收入"));
				spro.add(new Option("其他收入","其他收入"));
				spro.add(new Option("营业成本及税金","营业成本及税金"));
				spro.add(new Option("期间费用","期间费用"));
				spro.add(new Option("其他损失","其他损失"));
			}
		}
		$(document).ready(function(){
			var superKey = $("#super_acSub_id");					
  			$("#acSub_id").blur(function(){
  			var subNumValue = document.getElementById("acSub_id").value;
  				if(!(subNumValue.length == 4 | subNumValue.length == 6 | subNumValue.length ==8)){
  					alert("请输入长度为4或6或8的科目编号");
  				}else{
  					var patrn = /^[0-9]{4,8}$/;
  					if(!patrn.exec(subNumValue)){
  							alert("请输入数字");
  					}else{
  						$.ajax({  
             				type: "POST",  
            				url: "xitongguanli/InsertSubject/getSuperKey.action",  
             				data: {acSub_id:$("#acSub_id").val()},          				
							dataType : 'json',
             				success: function(data){
                        		superKey.val(data.mes);
                        		$("#super_id").val(data.parentId);
                     		},
                     		error: function(){
                     			alert("未知错误，请联系管理员或开发人员!");
                     		}                     		 
       		  			}); 
       		  		} 
  				}
  				
  		    });
		});
		
  	</script>
  </head>
  
  <body onload="trColor(); ">
  	<div class="title">新增科目</div>
		<div class="tbDiv">
			<form action="xitongguanli/InsertSubject/SaveSubject.action" method="post">
			<table id="tUser" class="tUser">
				<tr>
					<td class="tTitle">上级科目</td>
					<td class="tInput">
					<input style="background-color:#ccc;" readonly="readonly" class="inCss" type="text" id="super_acSub_id" name="super_acSub_id" value="${accountSub.super_id}"/>
					<input type="hidden" id="super_id" name="super_id" value=""/>
					</td>
					<td class="errCss"><span class="errId"></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">科目编号</td>
					<td class="tInput"><input class="inCss" type="text" id="acSub_id" name="acSub_id" value="${accountSub.acSub_id}"/></td>
					<td class="errCss"><span class="errId"></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">科目名称</td>
					<td class="tInput"><input class="inCss" type="text" id="acSub_name" name="acSub_name" value="${accountSub.acSub_name}"/></td>
					<td class="errCss"><span class="errSBName"></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">科目类型</td>
					<td class="tInput">
						<select id="sType" name="acSub_classes" class="sCSS" onchange="addOptions()">
							<option value="zichan" selected="selected">
								资产
							</option>
							<option value="fuzhai">
								负债
							</option>
							<option value="quanyi">
								权益
							</option>
							<option value="chengben">
								成本
							</option>
							<option value="sunyi">
								损益
							</option>
						</select>
					</td>
					<td class="errCss"><span></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">科目性质</td>
					<td class="tInput">
						<select id="sPro" name="acSub_property" class="sCSS">
							<option>
								流动资产
							</option>
							<option>
								非流动资产
							</option>
						</select>
					</td>
					<td class="errCss"><span></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">余额方向</td>
					<td class="tInput">
						<input type="radio" id="balanceDirection" name="balanceDirection" value="借"	checked="checked"/>借
						<input type="radio" id="balanceDirection1" name="balanceDirection" value="贷"/>贷
						
					</td>
					<td class="errCss"><span class="errPwd"></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">数量核算</td>
					<td class="tInput">
						<input type="radio" id="isQuantity" name="isQuantity" value="1" />启用
						<input type="radio" id="isQuantity1" name="isQuantity" value="0" checked="checked"/>不启用
					</td>
					<td class="errCss"><span class="errPwd"></span></td>
				</tr>
				
				<tr>
					<td class="tTitle">状态</td>
					<td class="tInput">
						<input type="radio" id="enStatus" name="enStatus" value="1" checked="checked"/>启用
						<input type="radio" id="enStatus" name="enStatus" value="0"/>不启用
					</td>
					<td class="errCss"><span>${infor}</span></td>
				</tr>
				
				<tr>
					<td class="tbtn" colspan="3">
						<input class="btnSub" type="submit" id="submit" name="submit" value="保存" />
						<input class="btnSub" type="reset" id="reset" name="reset" value="重置" />
						<a href="xitongguanli/assetSubject/getAssetSubjectList.action?bianhao=&mingcheng=&leixing=&acSub_classes=zichan">返回</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
  </body>
</html>
