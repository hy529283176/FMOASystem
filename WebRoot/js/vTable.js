			function clearNoNum(obj){ 
    			obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符  
    			obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
    			obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
   				 obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数  
    			if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
        			obj.value= parseFloat(obj.value); 
    			} 
			}
			
			function moneyInput1(miID){
				var idMenu = null;
				var creditorMoney = document.getElementsByName("creditorMoney");
				for (var i = 1; i <= creditorMoney.length; i++)
				{	
					idMenu = "mi" + i;
					if (idMenu == miID)
					{
						if(creditorMoney[i-1].value!="")
						{
							creditorMoney[i-1].value = "";
							
						}
					}
				}
			}
			
			function moneyInput2(minID){
				var debitMoney = document.getElementsByName("debitMoney");
				var idMenu = null;
				for (var i = 1; i <= debitMoney.length; i++)
				{	
					idMenu = "min" + i;
					if (idMenu == minID)
					{
						if(debitMoney[i-1].value!="")
						{
							debitMoney[i-1].value = "";
						}
					}
				}
			}
			
			//鼠标移到科目输入框时，显示“科目”超链接或者按钮
			function showSubject(x){
				var index = x.charAt(15);
				var a = document.getElementsByName("subjectTree");
				a[index].style.display = "block";				
			}
			//鼠标移出科目输入框时，隐藏“科目”超链接或者按钮
			function hideSubject(y){
				var index = y.charAt(15);
				var a = document.getElementsByName("subjectTree");
				a[index].style.display = "none";
			}
			
			//添加分录
			function addFenLuTr(){			
				var voucherTable = document.getElementById("voucherTable");//凭证表
				var rsl = voucherTable.rows.length;//表格的行数			
						
				var addtr = $("<tr>"+
					"<td style='border:none;width:50px;'></td>"+
					"<td><input class='absInput' type='text' name='zhaiyao'/></td>"+					
					"<td>"+
						"<div id='accountSub_Name"+(rsl-2)+"' style='text-align: center;float:left;' onmouseover='showSubject(this.id)' onmouseout='hideSubject(this.id)'>"+
							"<div style='float:left;>"+	
								"<input type='hidden' id='dacSub_id'"+(rsl-2)+"' name='dacSub_id' value=''/>"+
								"<input class='acsubInputCSS' type='text' id='accsubname'"+(rsl-2)+"' name='accountSub_Name' value='' onfocus='getSomeSubjects(this);' onblur='clearContent();' onkeyup='getSomeSubjects(this);' readonly='readonly'/>"+
							"</div>"+
							"<div style='margin-top: 15px;float:left;margin-left:5px;'>"+
								"<a href='#' onclick=\"popupDiv('pop-div');getSubjectTree('zichan','dacSub_id"+(rsl-2)+"','accsubname"+(rsl-2)+"');return false;\" name='subjectTree' style='display: none;'>科目</a>"+
							"</div>"+									
						"</div>"+															
					"</td>"+
					"<td>"+
						"<input class='sumMoney1' type='text' name='debitMoney"+(rsl-1)+"' onkeyup='clearNoNum(this)' onclick='moneyInput1('mi"+(rsl-1)+"');' />"+
					"</td>"+
					"<td>"+
						"<input class='sumMoney2' type='text' name='creditorMoney"+(rsl-1)+"' onkeyup='clearNoNum(this)' onclick='moneyInput2('min"+(rsl-1)+"');'/>"+
					"</td>"+
				"</tr>");
				if(confirm("确定添加吗？")){
					addtr.appendTo(voucherTable);						
				}
			}
			
			//删除分录
			function deleteFenLuTr(){
				var voucherTable = document.getElementById("voucherTable");//凭证表
				var rsl = voucherTable.rows.length;//表格的行数
				if(confirm("确定删除吗？")){
					voucherTable.deleteRow(voucherTable.rows.length-2); 					
				}
			}
			
			
			