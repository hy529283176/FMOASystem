<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
	<link rel="stylesheet" href="<%=basePath%>/laydate/theme/default/laydate.css?v=5.0.85" id="layuicss-laydate">
	<link rel="stylesheet" href="<%=basePath%>/css/insertVoucher.css" />
	<link rel="stylesheet" href="<%=basePath%>/css/pop-box.css" />
	<link rel="stylesheet" href="<%=basePath%>/dist/themes/default/style.min.css" />
	<script type="text/javascript" src="<%=basePath%>/js/jquery.js" ></script>
	<script type="text/javascript"	src="<%=basePath%>/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"	src="<%=basePath%>/js/vTable.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/pop-box.js"></script>
	<style type="text/css">
		.mouseOver{
			background: burlywood;
		}
		.mouseOut{
			background: white;
		}
	</style>
  </head>
  
  <body>
  	
  	<form action="pingzhengguanli/InsertVoucher/SaveVouchert.action" id="voucherForm" method="post" onsubmit="return saveVoucher();">
		<div class="btnHeader">
					<input type="submit" id="save2" name="save2" value="保存" class="saveBtn"/>
					<input type="button" id="addFenLu" name="addFenLu" value="添加分录" class="saveBtn"  onclick="addFenLuTr(this);"/>
					<input type="button" id="delFenlu" name="delFenlu" value="删除分录" class="saveBtn" onclick="deleteFenLuTr(this);"/>
					<a style="height:30px;width: 120px;display:  block;float: right;text-align: center;text-decoration: none;padding-top: 8px;" href="pingzhengguanli/getVoucher/auditVoucherList.action" id="back" name="back" class="saveBtn"><span>返回审核凭证</span></a>
		</div>
		<div class="voucherTable">
			<div class="headerFun">
				<div class="infoHeader">
					<div class="info1">
					凭证字&nbsp;<select id="" name="" style="padding-left:3px;width: 50px;height: 20px;">
						<option value="记">记</option>	
					</select>
					</div>
					<div class="info2"><input type="text" id="fvoucher_id" name="fvoucher_id" value="" style=" padding-left:3px;width: 70px;height: 20px;"/>&nbsp;号</div>
					<div class="info3">
						日期&nbsp;<input class="inCss" type="text" id="fcreateTime" name="fcreateTime"
						 placeholder="请选择日期" lay-key="1" style="height: 20px;"/>
					<script type="text/javascript" src="laydate/laydate.js" ></script>
					<script>
						//执行一个laydate实例
						laydate.render({
							elem: '#fcreateTime' //指定元素
						});
					</script>
					</div>
					<div class="info4"><b>记账凭证</b></div>
					<div class="info5">2017年第1期<input type="hidden" name="fperiods" value="1"/></div>
					<div class="info6">附单据&nbsp;<input type="text" id="fbills" name="fbills" style="padding-left: 3px; width:30px;height: 20px;"/>&nbsp;张</div>
				</div>
			</div>
			
			<div class="voucherTbody">
				<table id="voucherTable" class="vTable">
					<thead>
						<tr>
							<th class="thTitle1" style="border:none;"></th>
							<th class="thTitle2">摘要</th>
							<th class="thTitle3">会计科目</th>
							<th class="thTitle4">借方金额(元)</th>
							<th class="thTitle4">贷方金额(元)</th>
						</tr>
					</thead>
					
					<tbody>
					<!-- 第1条 -->
						<tr>
							<td style="border:none;width:50px;"></td>
							<td><input class="absInput" type="text" name="zhaiyao"/></td>
							<td>
								<div id="accountSub_Name0"  style="text-align: center;float:left;" onmouseover="showSubject(this.id)" onmouseout="hideSubject(this.id)">
									<div style="float:left;">	
										<input type="hidden" id="dacSub_id1" name="dacSub_id" value=""/>
										<input type="hidden" id="ddacSub_id2" name="ddacSub_id2" value=""/>
										<input type="hidden" id="dacSub_name1" name="dacSub_name1" value="">
										<input class="acsubInputCSS" type="text" onfocus="getSomeSubjects(this);" onblur="clearContent();" onkeyup="getSomeSubjects(this);" id="accsubname1" name="accountSub_Name" value="" readonly="readonly"/>
									</div>
									<div style="margin-top: 15px;float:left;margin-left:5px;">
										<a href="#" onclick="popupDiv('pop-div');getSubjectTree('zichan','dacSub_id1','accsubname1');return false;" name="subjectTree" style="display: none;">科目</a>
									</div>									
								</div>															
							</td>
							<td>
								<input class="sumMoney1" type="text" 
									id="debitMoney1" name="debitMoney" 
									onkeyup="clearNoNum(this)"
									 onclick="moneyInput1('mi1');" />
							</td>
							<td>
								<input class="sumMoney2" type="text" 
									id="creditorMoney1" name="creditorMoney" 
									onkeyup="clearNoNum(this)" onclick="moneyInput2('min1');"/>
							</td>
						</tr>
						<!-- 第2条 -->
						<tr>
							<td style="border:none;width:50px;"></td>
							<td><input class="absInput" type="text" name="zhaiyao"/></td>
							<td>
								<div id="accountSub_Name1"  style="text-align: center;float:left;" onmouseover="showSubject(this.id)" onmouseout="hideSubject(this.id)">
									<div style="float:left;">	
										<input  type="hidden" id="dacSub_id2" name="dacSub_id" value=""/>
										<input class="acsubInputCSS" type="text" onfocus="getSomeSubjects(this);" onblur="clearContent();" id="accsubname2" name="accountSub_Name" onkeyup="getSomeSubjects(this);" value="" readonly="readonly"/>
									</div>
									<div style="margin-top: 15px;float:left;margin-left:5px;">
										<a href="#" onclick="popupDiv('pop-div');getSubjectTree('zichan','dacSub_id2','accsubname2');return false;" name="subjectTree" style="display: none;">科目</a>
									</div>									
								</div>									
							</td>
							<td>
								<input class="sumMoney1" type="text" 
									id="debitMoney2" name="debitMoney" 
									onkeyup="clearNoNum(this)"
									 onclick="moneyInput1('mi2');" />
							</td>
							<td>
								<input class="sumMoney2" type="text" 
									id="creditorMoney2" name="creditorMoney" 
									onkeyup="clearNoNum(this)" onclick="moneyInput2('min2');"/>
							</td>
						</tr>
						<!-- 第3条 -->
						<tr>
							<td style="border:none;width:50px;"></td>
							<td><input class="absInput" type="text" name="zhaiyao"/></td>
							<td>
								<div id="accountSub_Name2"  style="text-align: center;float:left;" onmouseover="showSubject(this.id)" onmouseout="hideSubject(this.id)">
									<div style="float:left;">	
										<input type="hidden" id="dacSub_id3" name="dacSub_id" value=""/>
										<input class="acsubInputCSS" type="text" onfocus="getSomeSubjects(this);" onblur="clearContent();" onkeyup="getSomeSubjects(this);" id="accsubname3" name="accountSub_Name" value="" readonly="readonly"/>
									</div>
									<div style="margin-top: 15px;float:left;margin-left:5px;">
										<a href="#" onclick="popupDiv('pop-div');getSubjectTree('zichan','dacSub_id3','accsubname3');return false;" name="subjectTree" style="display: none;">科目</a>
									</div>									
								</div>									
							</td>
							<td>
								<input class="sumMoney1" type="text" 
									id="debitMoney3" name="debitMoney" 
									onkeyup="clearNoNum(this)"
									 onclick="moneyInput1('mi3');" />
							</td>
							<td>
								<input class="sumMoney2" type="text" 
									id="creditorMoney3" name="creditorMoney" 
									onkeyup="clearNoNum(this)" onclick="moneyInput2('min3');"/>
							</td>
						</tr>
						<!-- 第4条 -->
						<tr>
							<td style="border:none;width:50px;"></td>
							<td><input class="absInput" type="text" name="zhaiyao"/></td>
							<td>
								<div id="accountSub_Name3"  style="text-align: center;float:left;" onmouseover="showSubject(this.id)" onmouseout="hideSubject(this.id)">
									<div style="float:left;">	
										<input type="hidden" id="dacSub_id4" name="dacSub_id" value=""/>
										<input class="acsubInputCSS" type="text" onfocus="getSomeSubjects(this);" onblur="clearContent();" onkeyup="getSomeSubjects(this);" id="accsubname4" name="accountSub_Name" value="" readonly="readonly"/>
									</div>
									<div style="margin-top: 15px;float:left;margin-left:5px;">
										<a href="#" onclick="popupDiv('pop-div');getSubjectTree('zichan','dacSub_id4','accsubname4');return false;" name="subjectTree" style="display: none;">科目</a>
									</div>									
								</div>									
							</td>
							<td>
								<input class="sumMoney1" type="text" 
									id="debitMoney4" name="debitMoney" 
									onkeyup="clearNoNum(this)"
									onclick="moneyInput1('mi4');" value=""/>
							</td>
							<td>
								<input class="sumMoney2" type="text" 
									id="creditorMoney4" name="creditorMoney" 
									onkeyup="clearNoNum(this)" onclick="moneyInput2('min4');"  value=""/>
							</td>
						</tr>																								
					</tbody>
					
					<tfoot>
						<tr>
							<td style="border:none;width:50px;"></td>
							<td colspan="2" style="text-align: left;">&nbsp;&nbsp;&nbsp;<b>合计：</b><input type="button" style="float:right;" id="countMoney" value="计算" onclick="doSumMoney();"/></td>
							<td><span id="sumDebitSpan"><input type="hidden" id="fsumDebit" name="fsumDebit" value=""/></span></td>
							<td><span id="sumCreditorSpan"><input type="hidden" id="fsumCreditor" name="fsumCreditor" value=""/></span></td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div id="subDiv" class="subCSS">
				<table id="content_table" bgcolor="#FFFAFA" border="0" cellspacing="0"
				cellpadding="0" style="border:none;">
					<tbody id="content_table_tbody">
						
					</tbody>
				</table>
			</div>	
			<div class="footerFun">
				<span>制单人：${uName}<input type="hidden" name="fformMaker" value="${uName}"></span>
				<span style="margin-left: 150px;">审核人：</span>
				<span style="margin-left: 150px;">会计主管：</span>
				<span style="margin-left: 150px;">记账：</span>
			</div>
		</div>
		</form>
		
		<div id='pop-div' style="width: 500px;height:500px;" class="pop-box">
 			<div class="pop-box-head">
 				<div class="pop-box-title"><span>科目列表</span></div>
 				<div class="pop-box-type">
 					<span><input class="subClass" type="button" id="zichan" onclick="getSubjectTree('zichan',$('#ddacSub_id2').val(),$('#dacSub_name1').val());" value="资产"/></span>
 					<span><input class="subClass" type="button" id="fuzhai" onclick="getSubjectTree('fuzhai',$('#ddacSub_id2').val(),$('#dacSub_name1').val());" value="负债"/></span>
 					<span><input class="subClass" type="button" id="quanyi" onclick="getSubjectTree('quanyi',$('#ddacSub_id2').val(),$('#dacSub_name1').val());" value="权益"/></span>
 					<span><input class="subClass" type="button" id="chengben" onclick="getSubjectTree('chengben',$('#ddacSub_id2').val(),$('#dacSub_name1').val());" value="成本"/></span>
 					<span><input class="subClass" type="button" id="sunyi" onclick="getSubjectTree('sunyi',$('#ddacSub_id2').val(),$('#dacSub_name1').val());" value="损益"/></span>
 				</div>
 			</div>
 			
 			<div class="pop-box-body">
 				<div id="SubTree">
 					
 				</div>
 				
 			</div>
 			
 			<div class='pop-box-foot'>
 				<input class="btnOption" type="button" value="确定" id="btnSure" onclick="getTreeData();" />
  				<input class="btnOption" type="button" value="关闭" id="btnClose" onclick="hideDiv('pop-div');" />
 			</div>
 			
 		</div>
		<script type="text/javascript">		
			$(document).ready(function(){
				/*
				$("table").delegate(".acsubInputCSS","click", function(){
    				var input =  $(this);
    				var offset = input.offset();
					$("#subDiv")
					.css("left",offset.left-1+"px")
					.css("top",offset.top+input.height()+2+"px")
					.fadeIn();
				});
				$("table").delegate(".acsubInputCSS","blur", function(){
          			$("#subDiv").css("display","none");
      			});
      			*/
      		});
      		/*异步获取科目*/
      		function getSomeSubjects(input){
      				if(input.value == ""){
      					clearContent();	
      					return;
      				}
					$.ajax({  
             				type: "POST",  
            				url: "pingzhengguanli/getSomeSubjects/getSubjects.action",  
             				data: {acSubjectName:input.value},          				
							dataType : 'json',
             				success: function(data){
                        		if(data.mes=="failed"){
                        			clearContent();
                        			return;
                        		}
                        		var mydata = eval("(" + data.dataList + ")");
                        		setContent(mydata.data);
                        			
                     		},
                     		error: function(){
                     			alert("未知错误，请联系管理员或开发人员!");
                     		}                     		 
       		  			}); 
				}
				/*处理后端传来的科目json数据*/
				function setContent(contents){
					clearContent();
					var size = contents.length;
					for(var i = 0;i<size;i++){
                    	var nextNode = contents[i];//json数组第i个
                    	var tr = document.createElement("tr");
                    	var td = document.createElement("td");
                    	td.setAttribute("border","0");
                    	td.setAttribute("bgcolor","#FFFAFA");
                    	td.onmouseover = function(){
                    		this.className = 'mouseOver';
                    	};
                    	td.onmouseout = function(){
                    		this.className = 'mouseOut';
                    	};
                    	td.onclick=function(){
                    		//点击某个元素是，把值付给输入框
                    	};
                    	var id = nextNode.id;
                    	var name = nextNode.name;
                    	var node = id+" "+name;
                    	var text = document.createTextNode(node);
                    	td.appendChild(text);
                    	tr.appendChild(td);
                    	document.getElementById("content_table_tbody").appendChild(tr);
                    }
				}
				/*清空下拉框之前的数据*/
				function clearContent(){
					var contentTableBody = document.getElementById("content_table_tbody");
					var size = contentTableBody.childNodes.length;
					for(var i = size-1;i>=0;i--){
						contentTableBody.removeChild(contentTableBody.childNodes[i]);
					}
				}
				
				function doSumMoney(){
					$("#sumDebitSpan").html("");
					$("#sumCreditorSpan").html("");
					var voucherTable = document.getElementById("voucherTable");//凭证表
					var rsl = voucherTable.rows.length;//表格的行数
					var creditorMoneys = document.getElementsByName("creditorMoney");
					var debitMoneys = document.getElementsByName("debitMoney");
					var sumd = 0;
					var sumc = 0;
					for(var i = 0;i<rsl-2;i++){
						if(creditorMoneys[i].value != ""){
							sumc += parseFloat(creditorMoneys[i].value);
						}
						if(debitMoneys[i].value != ""){
							sumd += parseFloat(debitMoneys[i].value);
						}
					}
					$("#fsumDebit").val(sumd);
					$("#fsumCreditor").val(sumc);
					$("#sumDebitSpan").html(sumd.toString());
					$("#sumCreditorSpan").html(sumc.toString());
				}
		</script>
		
		<script type="text/javascript" src="<%=basePath%>/dist/jstree.min.js"></script>
		
		<script type="text/javascript">
				var text = null;
				var id = null;
				var inputid = null;
	    		var inputname = null;
				function getSubjectTree(subjectId,subid,subname){
						inputid = subid;
						inputname = subname;
						$("#ddacSub_id2").val(inputid);
						$("#dacSub_name1").val(inputname);
 						$.ajax({  
             				type: "POST",  
            				url: "pingzhengguanli/getSubjectTree/getSubjectTree.action",  
             				data: {subjectType:subjectId},          				
							dataType : 'json',
             				success: function(data){
                        		if(data==null){
                        			return;
                        		}
                        		//var mydata = eval("(" + data + ")");
                        		var tree = $('#SubTree');
 								tree.jstree({ 'core': { data: null }});
                        		tree.jstree(true).settings.core.data = data;
 								tree.jstree(true).refresh();	
                     		},
                     		error: function(){
                     			alert("未知错误，请联系管理员或开发人员!");
                     		}                     		 
       		  			}); 
       		  			/*
					$(function() {
 						$('#SubTree').jstree({
    						'core' : {
    							'multiple' : false,
      							'data' : {
        							"url" : "pingzhengguanli/getSubjectTree/getSubjectTree.action?subjectType="+subjectId,
        							"dataType" : "json" // needed only if you do not supply JSON headers
      							}
    						}
  						});
					});
					*/
				}
				$('#SubTree').on("changed.jstree", function (e, data) {
  					text = data.instance.get_node(data.selected[0]).text;
  					id = data.instance.get_node(data.selected[0]).id;
				});
				
				function getTreeData(){
					var subid = document.getElementById(inputid);
					var subname = document.getElementById(inputname);
					subid.value = id;
					subname.value = text;
					closeWindow();
				}
				
				function closeWindow() {
            		hideDiv('pop-div');
        		}
		</script>
		<script type="text/javascript">
			function saveVoucher(){
				doSumMoney();
				var fcreateTime = $("#fcreateTime").val();
				var fvoucher_id = $("#fvoucher_id").val();
			    var sumd = $("#sumDebitSpan").text();
				var sumc = $("#sumCreditorSpan").text();
				var accountSub_Names = document.getElementsByName("accountSub_Name");
				var zhaiyaos = document.getElementsByName("zhaiyao"); 
				if(sumd!="" & sumc !="" & fcreateTime != "" & fvoucher_id != ""){
					if(sumd==0 && sumc==0){
						alert("请填写金额");
						return false;
					}else{
						if(sumd != sumc){
							alert("借贷不平衡，请检查输入的金额是否相等");
							return false;
						}
					}
				}else{
					alert("请填写相关数据");
					return false;
				}
				for(var i=0;i<accountSub_Names.length;i++){
					if(accountSub_Names[i].value == ""){
						alert("有分录科目没填，请填写吧");
						return false;
					}
				}
				for(var i=0;i<zhaiyaos.length;i++){
					if(zhaiyaos[i].value == ""){
						alert("摘要也不能为空哦");
						return false;
					}
				}
			}
		</script>
  </body>  
</html>
