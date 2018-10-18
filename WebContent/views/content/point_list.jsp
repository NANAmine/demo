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
	  <style>
    .header {
      text-align: center;
      background-color: #0c68A7;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
    .banner {
	with:100%;height:79px;
	max-width: 1120px;
	margin: 0 auto;
	background:#0c68A7 url(img/banner.jpg) no-repeat top left;
}
  </style>
   </head>
 <body style="height: 100%; margin: 0">
<div class="header">
  <div class="banner">

  </div>
</div>
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
    [20, 30, 20],
    [20, 50, 20],
    [0, 10, 20],
    [10, 20, 20],
    [20, 50, 20],
    [20, 40, 20],
    [20, 30, 20],
    [20, 40, 20],
    [20, 30, 20],
    [20, 50, 20],  
];
var cities = ['国际总体安全形势', '联合国改革与发展趋势', '地缘政治因素', '联合国之外的国际组织影响', '非政府组织影响', '区域组织影响', '大国关系', '邻国国关系', '全球经济形势', '恐怖主义影响'];
var barHeight = 1;

option = {
    title: {
        text: '驻在国外部特征'
    },
    legend: {
        show: true,
        data: ['价格范围', '均值']
    },
    grid: {
        top: 100
    },
    angleAxis: {
        type: 'category',
        data: cities
    },
    tooltip: {
        show: true,
        formatter: function (params) {
            var id = params.dataIndex;
            return cities[id] + '<br>得分：' + data[id][1]/10;
        }
    },
    radiusAxis: {
    },
    polar: {
    },
    series: [{
        type: 'bar',
        itemStyle: {
            normal: {
                color: 'transparent'
            }
        },
        data: data.map(function (d) {
            return d[0];
        }),
        coordinateSystem: 'polar',
        stack: '最大最小值',
        silent: true
    }, {
        type: 'bar',
        data: data.map(function (d) {
            return d[1] - d[0];
        }),
        coordinateSystem: 'polar',
        name: '价格范围',
        stack: '最大最小值'
    }, {
        type: 'bar',
        itemStyle: {
            normal: {
                color: 'transparent'
            }
        },
        data: data.map(function (d) {
            return d[2] - barHeight;
        }),
        coordinateSystem: 'polar',
        stack: '均值',
        silent: true,
        z: 10
    }, {
        type: 'bar',
        data: data.map(function (d) {
            return barHeight * 2
        }),
        coordinateSystem: 'polar',
        name: '均值',
        stack: '均值',
        barGap: '-100%',
        z: 10
    }],
    legend: {
        show: true,
        data: ['A', 'B', 'C']
    }
};

if (option && typeof option === "object") {
    myChart.setOption(option, true);
}

myChart.on('click', function (params) {
	if(params.name=="国际总体安全形势"){
		window.open('point_detail.do?content_id=1');
	}
	if(params.name=="恐怖主义影响"){
		window.open('point_detail.do?content_id=11');
	}
})
       </script>
   </body>
</html>