<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资产负债表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
			.bodyCSS{
				margin:0;
				padding:0;
				width: 100%;
				height: auto;
			}
			#div_content{
				    width: 100%;
				    height:auto;
    				margin-top: 10px;
			}
			#div_header{
				    width: 1024px;
    				height: 50px;
			}
			table{
				border-collapse: collapse;
				width:100%;
			}
			thead th{
				border: solid 1px #009688;
				text-align: center;
				
			}
			tbody td{
				border: solid 1px #009688;
				text-align: center;
			}
		</style>
  </head>
  
  <body style="background: #e1e9eb;">
    	<div id="div_body" class="bodyCSS">
			<div id="div_header">
				<div id="div_searchForm">					
					<form>
						<div>
						<span>资产负债表</span>&nbsp;
						<span>
							<select id="qishu" style="height:30px;">
								<option>2018年1期</option>
								<option>2018年2期</option>
								<option>2018年3期</option>
							</select>
						</span>&nbsp;&nbsp;
						<span><input type="button" style="height:30px;" id="Search" value="查询"/></span></div>
					</form>
				</div>
			</div>
			<div id="div_content">
				<div id="TableData">
					<table id="ZICHANFUZHAI">
					<thead>
						<tr>
							<th>资产</th>
							<th>行次</th>
							<th>期末数</th>
							<th>年初数</th>
							<th>负债和所有者（或股东）权益</th>
							<th>行次</th>
							<th>期末数</th>
							<th>年初数</th>
						</tr>
					</thead>
					<tbody>
					<tr>
							<td>流动资产：</td>
							<td>1</td>
							<td></td>
							<td></td>
							<td>流动负债：</td>
							<td>33</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;货币资金</td>
							<td>2</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;短期负债</td>
							<td>34</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;短期投资</td>
							<td>3</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;应付票据</td>
							<td>35</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;应收票据</td>
							<td>4</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;应付账款</td>
							<td>36</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;应收账款</td>
							<td>5</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;预收账款</td>
							<td>37</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;预付账款</td>
							<td>6</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;应付职工薪酬</td>
							<td>38</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;应收股利</td>
							<td>7</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;应交税费</td>
							<td>39</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;应收利息</td>
							<td>8</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;应付利息</td>
							<td>40</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;其他应收款</td>
							<td>9</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;应付利润</td>
							<td>41</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;存货</td>
							<td>10</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;其他应付款</td>
							<td>42</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;其他：原材料</td>
							<td>11</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;其他流动负债</td>
							<td>43</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;在产品</td>
							<td>12</td>
							<td></td>
							<td></td>
							<td>流动负债合计</td>
							<td>44</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;库存商品</td>
							<td>13</td>
							<td></td>
							<td></td>
							<td>非流动负债：</td>
							<td>45</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;周转材料</td>
							<td>14</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;长期借款</td>
							<td>46</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;其他流动资产</td>
							<td>15</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;长期应付款</td>
							<td>47</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>流动资产合计</td>
							<td>16</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;递延收益</td>
							<td>48</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>非流动资产：</td>
							<td>17</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;其他非流动负债</td>
							<td>49</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;长期债券投资</td>
							<td>18</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;非流动负债合计</td>
							<td>50</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;长期股权投资</td>
							<td>19</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负债合计</td>
							<td>51</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;固定资产原价</td>
							<td>20</td>
							<td></td>
							<td></td>
							<td></td>
							<td>52</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;减：累计折旧</td>
							<td>21</td>
							<td></td>
							<td></td>
							<td></td>
							<td>53</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;固定资产账面价值</td>
							<td>22</td>
							<td></td>
							<td></td>
							<td></td>
							<td>54</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;在建工程</td>
							<td>23</td>
							<td></td>
							<td></td>
							<td></td>
							<td>55</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;工程物资</td>
							<td>24</td>
							<td></td>
							<td></td>
							<td></td>
							<td>56</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;固定资产清理</td>
							<td>25</td>
							<td></td>
							<td></td>
							<td></td>
							<td>57</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;生产性生物资产</td>
							<td>26</td>
							<td></td>
							<td></td>
							<td>所有者权益（或股东权益）</td>
							<td>58</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;无形资产</td>
							<td>27</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;实收资本</td>
							<td>59</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;开发支出</td>
							<td>28</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;资本公积</td>
							<td>60</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;长期待摊费用</td>
							<td>29</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;盈余公积</td>
							<td>61</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;其他非流动资产</td>
							<td>30</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;未分配利润</td>
							<td>62</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;非流动资产合计</td>
							<td>31</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;所有者权益（或股东权益）</td>
							<td>63</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>资产总计</td>
							<td>32</td>
							<td></td>
							<td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;负债和所有者权益（或股东权益）总计</td>
							<td>64</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
					<tfoot></tfoot>						
					</table>
				</div>
				
			</div>
			<div id="div_footer"></div>
		</div>
  </body>
</html>