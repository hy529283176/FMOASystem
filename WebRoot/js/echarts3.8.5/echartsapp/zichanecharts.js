var echarts_tjfa = function(myData,containerID){
   	/*初始化*/
   	var myChart =  echarts.init(document.getElementById(containerID), "macarons");
   	piedata = myData.zichan
   	
   	/*数据处理*/
   	var option = {
   			title : {
        		//text: '某站点用户访问来源',
        		//subtext: '纯属虚构',
        		//x:'center'
    		},
    		tooltip : {
        		trigger: 'item',
        		formatter: "{a} <br/>{b} : {c} ({d}%)"
    		},
    		legend: {
       	 		orient : 'vertical',
        		x : 'left',
        		data:piedata.legend
    		},
    		calculable : true,
    		series : [
        		{
            		name:'科目占比',
            		type:'pie',
            		radius : '55%',
            		center: ['50%', '60%'],
            		data:[
                		{value:piedata.data[0], name:'资产'},
                		{value:piedata.data[1], name:'负债'},
                		{value:piedata.data[2], name:'成本'},
                		{value:piedata.data[3], name:'盈利'}
            		]
        		}
    		]
   		};
   				
   		/*生成图表*/
   		myChart.setOption(option);	
}