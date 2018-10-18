<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html style="height: 100%">
   <head>
       <meta charset="utf-8">
       <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>联合国维和行动风险评估系统</title>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta name="renderer" content="webkit">
	  <meta http-equiv="Cache-Control" content="no-siteapp" />
	  <link rel="icon" type="image/png" href="assets/i/favicon.png">
	  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
	  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
   </head>
 <body style="height: 100%; margin: 0">
 <header class="am-topbar am-topbar-fixed-top">
  <div class="am-container am-u-sm-centered">
    <h1 class="am-topbar-brand ">
      <a href="#">联合国维和行动风险评估系统</a>
    </h1>
   </div>
</header>
       <div id="container" style="height: 100%"></div>
<footer>
  <hr>
  <p class="am-padding-left">© 2016 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>
       <script type="text/javascript" src="assets/js/echarts/echarts.min.js"></script>
	   <script type="text/javascript" src="assets/js/echarts/echarts-gl.min.js"></script>
       <script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
app.title = '极坐标系下的堆叠柱状图';

var data = [
    [1, 5, 4],
    [1, 5, 5],
    [1, 5, 3],
    [1, 5, 2],
    [1, 5, 5],
    [1, 5, 1],
    [1, 5, 3],
    [1, 5, 2],
    [1, 5, 4],
    [1, 5, 1]   
];
var cities = new Array('Northern Bahr el Ghazal', 'Western Bahr el Ghazal', 'Central Equatoria', 'Eastern Equatoria', 'Western Equatoria', 'Jonglei', 'Lakes', 'Upper Nile', 'Unity', 'Warrap');
var barHeight = 1;

option = {
	    title: {
	        text: '南苏丹----驻在国外部特征',
	        top: 50,
	        left: 10
	    },
	    tooltip: {
	        trigger: 'item',
	        backgroundColor : 'rgba(0,0,250,0.5)'
	    },
	    legend: {
	        type: 'scroll',
	        bottom: 10,
	        data: (function (){
	            var list = [];
	            for (var i = 0; i <10; i++) {
	                list.push(cities[i] + '');
	            }
	            return list;
	        })()
	    },

	    radar: {
	       indicator : [
	           { text: '国际总体安全形势', max: 100,color: 'black'},
	           { text: '联合国改革与发展趋势', max: 100,color: 'black'},
	           { text: '地缘政治因素', max: 100,color: 'black'},
	           { text: '联合国之外的国际组织影响', max: 100,color: 'black'},
	           { text: '非政府组织影响', max: 100,color: 'black'},
	           { text: '区域组织影响', max: 100,color: 'black'},
	           { text: '大国关系', max: 100,color: 'black'},
	           { text: '邻国关系', max: 100,color: 'black'},
	           { text: '全球经济形势', max: 100,color: 'black'},
	           { text: '恐怖主义影响', max: 100,color: 'black'}
	        ]
	    },
	    series : (function (){
	        var series = [];
	        for (var i = 0; i < 10; i++) {
	            series.push({
	                name:'驻在国外部特征',
	                type: 'radar',
	                symbol: 'none',
	                lineStyle: {
	                    width: 1
	                },
	                emphasis: {
	                    areaStyle: {
	                        color: 'rgba(0,250,0,0.8)'
	                    }
	                },
	                data:[
	                  {
	                    value:[
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1),
	                        Math.floor(Math.random()*100+1)
	                    ],
	                    name: cities[i] + ''
	                  }
	                ]
	            });
	        }
	        return series;
	    })()
	};

if (option && typeof option === "object") {
    myChart.setOption(option, true);
}

myChart.on('click', function (params) {
    window.open('point_detail.do?content_id=1');
})
       </script>
   </body>
</html>