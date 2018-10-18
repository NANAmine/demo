<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

    <head>
      <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>联合国维和行动风险评估系统</title>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <meta name="renderer" content="webkit">
	  <meta http-equiv="Cache-Control" content="no-siteapp" />
	  <link rel="icon" type="image/png" href="assets/i/favicon.png">
	  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
	  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
	  <link rel="stylesheet" href="assets/css/admin.css">
      <link rel="stylesheet" href="assets/ammap/ammap.css" type="text/css">
      <script src="assets/ammap/ammap.js" type="text/javascript"></script>
      <!-- map file should be included after ammap.js -->
	  <script src="assets/ammap/maps/js/worldLow.js" type="text/javascript"></script>
   	  <script src="assets/ammap/maps/js/southSudanLow.js" type="text/javascript"></script>
      <script src="assets/ammap/themes/light.js"></script>
      <script src="assets/js/jquery.min.js"></script>
      <script>
      		$(function() {  
      			console.log($("#pro_src1").attr('title'))
      			console.log($("#country").attr('title'))
      			var h = $(window).height();
      			$("#mapdiv").height(h); 
    	  	});
      		var targetSVG = "M9,0C4.029,0,0,4.029,0,9s4.029,9,9,9s9-4.029,9-9S13.971,0,9,0z M9,15.93 c-3.83,0-6.93-3.1-6.93-6.93S5.17,2.07,9,2.07s6.93,3.1,6.93,6.93S12.83,15.93,9,15.93 M12.5,9c0,1.933-1.567,3.5-3.5,3.5S5.5,10.933,5.5,9S7.067,5.5,9,5.5 S12.5,7.067,12.5,9z";
      		var map;
			var worldDataProvider,worldDataProvider01,worldDataProvider02,worldDataProvider03,worldDataProvider04,worldDataProvider05;
      		var southSudanDataProvider;
      		
      		function handleGoHome() {
			    map.dataProvider = worldDataProvider;
			    map.validateNow();
			}
			
			AmCharts.ready(function() {
				map = new AmCharts.AmMap();
          
          		southSudanDataProvider = {
              		mapVar: AmCharts.maps.southSudanLow,
			        getAreasFromMap:true,
			        areas: [
						      {
						         id: "SS-BN",
			                  	 title: "Northern Bahr el Ghazal",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
						         	"<tr><td align='left'>驻在国安全形势--30</td></tr>"+
				      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
				      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
				      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
				      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
				      			 value:$("#pro_src1").attr('title')
				      		  },
					          {
						         id: "SS-BW",
			                  	 title: "Western Bahr el Ghazal",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国外部特征--35</td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--20</td></tr>"+
			                  	"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
						         value: $("#pro_src2").attr('title')},
					          {
						         id: "SS-EC",
			                  	 title: "Central Equatoria",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>联合国风险抵御能力--33</td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--33</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--28</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
						         value: $("#pro_src3").attr('title')},
					          {
						         id: "SS-EE",
			                  	 title: "Eastern Equatoria",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--31</td></tr>"+
			                  	"<tr><td align='left'>联合国风险抵御能力--23</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--20</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
						         value: $("#pro_src4").attr('title')},
					          {
						         id: "SS-EW",
			                  	 title: "Western Equatoria",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--32</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
			      				"<tr><td align='left'>联合国风险抵御能力--20</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--16</td></tr></table>",
						         value: $("#pro_src5").attr('title')},
					          {
						         id: "SS-JG",
			                  	 title: "Jonglei",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--30</td></tr>"+
			                  	"<tr><td align='left'>维和人员风险抵御能力--25</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
			      				"<tr><td align='left'>联合国风险抵御能力--18</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--10 </td></tr></table>",
						         value: $("#pro_src6").attr('title')},
					          {
						         id: "SS-LK",
			                  	 title: "Lakes",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--30</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
						         value: $("#pro_src7").attr('title')},
					          {
						         id: "SS-NU",
			                  	 title: "Upper Nile",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--30</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
						         value: $("#pro_src8").attr('title')},
					          {
						         id: "SS-UY",
			                  	 title: "Unity",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--30</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
						         value: $("#pro_src9").attr('title')},
					         {
						         id: "SS-WR",
			                  	 title: "Warrap",
			                  	balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  	"<tr><td align='left'>驻在国安全形势--30</td></tr>"+
			      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
			      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
			      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
			      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
						         value: $("#pro_src10").attr('title')}
						   ]
          		};
          		
          		southSudanDataProvider01 = {
                  	mapVar: AmCharts.maps.southSudanLow,
    			    getAreasFromMap:true,
    			    areas: [
						      {
						         id: "SS-BN",
			                  	 title: "Northern Bahr el Ghazal",
						         value: 90,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
				      		  },
					          {
						         id: "SS-BW",
			                  	 title: "Western Bahr el Ghazal",
						         value: 80,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
						      },
					          {
						         id: "SS-EC",
			                  	 title: "Central Equatoria",
						         value: 85,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
						      },
					          {
						         id: "SS-EE",
			                  	 title: "Eastern Equatoria",
						         value: 92,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
					          },
					          {
						         id: "SS-EW",
			                  	 title: "Western Equatoria",
						         value: 85,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
					          },
					          {
						         id: "SS-JG",
			                  	 title: "Jonglei",
						         value: 93,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
					          },
					          {
						         id: "SS-LK",
			                  	 title: "Lakes",
						         value: 88,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
					          },
					          {
						         id: "SS-NU",
			                  	 title: "Upper Nile",
						         value: 85,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
					          },
					          {
						         id: "SS-UY",
			                  	 title: "Unity",
						         value: 90,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"
					          },
					         {
						         id: "SS-WR",
			                  	 title: "Warrap",
						         value: 87,
						         url:"point_list.do?province_id=1&source_id=1",
						         urlTarget:"_blank",
						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--5</td></tr>"+
				      				"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--4</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>非政府组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>邻国国关系--2</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--2</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--2</td></tr></table>"   
					         }
						   ]
              	};
          		
          		
          		southSudanDataProvider02 = {
                      	mapVar: AmCharts.maps.southSudanLow,
        			    getAreasFromMap:true,
        			    areas: [
    						      {
    						         id: "SS-BN",
    			                  	 title: "Northern Bahr el Ghazal",
    						         value: 95,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
 				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
 				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
 				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
 				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
 				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
 				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
 				      				"<tr><td align='left'>种族差异--3</td></tr>"+
 				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
 				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
 				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
 				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
 				      				"<tr><td align='left'>文化程度--2</td></tr>"+
 				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    				      		  },
    					          {
    						         id: "SS-BW",
    			                  	 title: "Western Bahr el Ghazal",
    						         value: 90,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EC",
    			                  	 title: "Central Equatoria",
    						         value: 95,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EE",
    			                  	 title: "Eastern Equatoria",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-EW",
    			                  	 title: "Western Equatoria",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-JG",
    			                  	 title: "Jonglei",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-LK",
    			                  	 title: "Lakes",
    						         value: 88,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-NU",
    			                  	 title: "Upper Nile",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-UY",
    			                  	 title: "Unity",
    						         value: 90,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    					          },
    					         {
    						         id: "SS-WR",
    			                  	 title: "Warrap",
    						         value: 87,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
  				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
  				      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
  				      				"<tr><td align='left'>政治纷争--4</td></tr>"+
  				      				"<tr><td align='left'>自然灾害--3</td></tr>"+
  				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
  				      				"<tr><td align='left'>种族差异--3</td></tr>"+
  				      				"<tr><td align='left'>贫富差异--3</td></tr>"+
  				      				"<tr><td align='left'>公众对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
  				      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
  				      				"<tr><td align='left'>文化程度--2</td></tr>"+
  				      				"<tr><td align='left'>人口性别比--2</td></tr></table>"
    					         }
    						   ]
                  	};
          		
          		southSudanDataProvider03 = {
                      	mapVar: AmCharts.maps.southSudanLow,
        			    getAreasFromMap:true,
        			    areas: [
    						      {
    						         id: "SS-BN",
    			                  	 title: "Northern Bahr el Ghazal",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
 				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
 				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
 				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
 				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
 				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
 				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
 				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
 				      				"<tr><td align='left'>治安案件--3</td></tr>"+
 				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
 				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
 				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
 				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
 				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    				      		  },
    					          {
    						         id: "SS-BW",
    			                  	 title: "Western Bahr el Ghazal",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EC",
    			                  	 title: "Central Equatoria",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EE",
    			                  	 title: "Eastern Equatoria",
    						         value: 90,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    					          },
    					          {
    						         id: "SS-EW",
    			                  	 title: "Western Equatoria",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    					          },
    					          {
    						         id: "SS-JG",
    			                  	 title: "Jonglei",
    						         value: 95,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    					          },
    					          {
    						         id: "SS-LK",
    			                  	 title: "Lakes",
    						         value: 98,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    					          },
    					          {
    						         id: "SS-NU",
    			                  	 title: "Upper Nile",
    						         value: 95,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    					          },
    					          {
    						         id: "SS-UY",
    			                  	 title: "Unity",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    					          },
    					         {
    						         id: "SS-WR",
    			                  	 title: "Warrap",
    						         value: 87,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
  				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
  				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
  				      				"<tr><td align='left'>案件侦破情况--4</td></tr>"+
  				      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
  				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
  				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
  				      				"<tr><td align='left'>治安案件--3</td></tr>"+
  				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
  				      				"<tr><td align='left'>有组织犯罪形势--3</td></tr>"+
  				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
  				      				"<tr><td align='left'>司法部门执法能力--3</td></tr>"+
  				      				"<tr><td align='left'>伤亡人数--3</td></tr></table>"
    					         }
    						   ]
                  	};
          		
          		southSudanDataProvider04 = {
                      	mapVar: AmCharts.maps.southSudanLow,
        			    getAreasFromMap:true,
        			    areas: [
    						      {
    						         id: "SS-BN",
    			                  	 title: "Northern Bahr el Ghazal",
    						         value: 88,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
 				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
 				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
 				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
 				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
 				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
 				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
 				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    				      		  },
    					          {
    						         id: "SS-BW",
    			                  	 title: "Western Bahr el Ghazal",
    						         value: 90,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EC",
    			                  	 title: "Central Equatoria",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EE",
    			                  	 title: "Eastern Equatoria",
    						         value: 94,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-EW",
    			                  	 title: "Western Equatoria",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-JG",
    			                  	 title: "Jonglei",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-LK",
    			                  	 title: "Lakes",
    						         value: 89,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-NU",
    			                  	 title: "Upper Nile",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-UY",
    			                  	 title: "Unity",
    						         value: 90,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    					          },
    					         {
    						         id: "SS-WR",
    			                  	 title: "Warrap",
    						         value: 97,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
  				      				"<tr><td align='left'>联合国预算--5</td></tr>"+
  				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
  				      				"<tr><td align='left'>维和力量的协调配合能力--4</td></tr>"+
  				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
  				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
  				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>"
    					         }
    						   ]
                  	};
          		
          		southSudanDataProvider05 = {
                      	mapVar: AmCharts.maps.southSudanLow,
        			    getAreasFromMap:true,
        			    areas: [
    						      {
    						         id: "SS-BN",
    			                  	 title: "Northern Bahr el Ghazal",
    						         value: 95,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
 				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
 				      				"<tr><td align='left'>个人装备--5</td></tr>"+
 				      				"<tr><td align='left'>个人急救--4</td></tr>"+
 				      				"<tr><td align='left'>语言交流--4</td></tr>"+
 				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
 				      				"<tr><td align='left'>心理安全--3</td></tr>"+
 				      				"<tr><td align='left'>交通安全--3</td></tr>"+
 				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
 				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
 				      				"<tr><td align='left'>受训情况-2</td></tr>"+
 				      				"<tr><td align='left'>学历情况-2</td></tr>"+
 				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    				      		  },
    					          {
    						         id: "SS-BW",
    			                  	 title: "Western Bahr el Ghazal",
    						         value: 90,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EC",
    			                  	 title: "Central Equatoria",
    						         value: 95,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    						      },
    					          {
    						         id: "SS-EE",
    			                  	 title: "Eastern Equatoria",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-EW",
    			                  	 title: "Western Equatoria",
    						         value: 80,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-JG",
    			                  	 title: "Jonglei",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-LK",
    			                  	 title: "Lakes",
    						         value: 88,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-NU",
    			                  	 title: "Upper Nile",
    						         value: 85,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    					          },
    					          {
    						         id: "SS-UY",
    			                  	 title: "Unity",
    						         value: 90,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    					          },
    					         {
    						         id: "SS-WR",
    			                  	 title: "Warrap",
    						         value: 87,
    						         url:"point_list.do?province_id=1&source_id=1",
    						         urlTarget:"_blank",
    						         balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
  				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
  				      				"<tr><td align='left'>个人装备--5</td></tr>"+
  				      				"<tr><td align='left'>个人急救--4</td></tr>"+
  				      				"<tr><td align='left'>语言交流--4</td></tr>"+
  				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
  				      				"<tr><td align='left'>心理安全--3</td></tr>"+
  				      				"<tr><td align='left'>交通安全--3</td></tr>"+
  				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
  				      				"<tr><td align='left'>违纪情况-2</td></tr>"+
  				      				"<tr><td align='left'>受训情况-2</td></tr>"+
  				      				"<tr><td align='left'>学历情况-2</td></tr>"+
  				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>"
    					         }
    						   ]
                  	};
          		

			    worldDataProvider = {
			        mapVar: AmCharts.maps.worldLow,
			        getAreasFromMap:true,
			        zoomLevel: 2,
		            zoomLongitude: 15,
		            zoomLatitude: 30,
			        areas: [
						      {
						         id: "SS",
			                  	 title: "South Sudan",
			                  	 linkToObject: southSudanDataProvider,
			                  	 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  		"<tr><td align='left'>驻在国安全形势--25</td></tr>"+
				      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
				      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
				      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr>"+
				      				"<tr><td align='left'>驻在国内部特征--10</td></tr></table>",
				      			 value:$("#country").attr('title')
			                  },
						      {
							         id: "ML",
									 title: "Mali",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>驻在国安全形势--29</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr>"+
					      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr></table>",
							         value: 99},
				                  {
							         id: "CF",
									 title: "Central African Republic",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>联合国风险抵御能力--30</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--25</td></tr>"+
					      				"<tr><td align='left'>驻在国安全形势--15</td></tr>"+
					      				"<tr><td align='left'>维和人员风险抵御能力--15</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--10</td></tr></table>",
							         value: 95}, 
				                  {
							         id: "CD",
									 title: "Democratic Republic of Congo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>维和人员风险抵御能力--25</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--20</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--15</td></tr>"+
					      				"<tr><td align='left'>驻在国安全形势--25</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--10</td></tr></table>",
							         value: 85}, 
				                  {
							         id: "HT",
									 title: "Haiti",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>驻在国安全形势--25</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--20</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--15</td></tr><tr>"+
					      				"<tr><td align='left'>驻在国内部特征--10</td></tr>"+
					      				"<td align='left'>维和人员风险抵御能力--10</td></tr></table>",
							         value: 80}, 
				                  {
							         id: "LR",
									 title: "Liberia",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>驻在国安全形势--25</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--20</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--10</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--10</td></tr>"+
					      				"<tr><td align='left'>维和人员风险抵御能力--10</td></tr></table>",
							         value: 75}, 
				                  {
							         id: "EH",
									 title: "Western Sahara",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--20</td></tr>"+
					      				"<tr><td align='left'>驻在国安全形势--20</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--10</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--10</td></tr>"+
					      				"<tr><td align='left'>维和人员风险抵御能力--10</td></tr></table>",
							         value: 70},
						          {
							         id: "XK",
									 title: "Kosovo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>驻在国安全形势--20</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--15</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--10</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--10</td></tr>"+
					      				"<tr><td align='left'>维和人员风险抵御能力--10</td></tr></table>",
							         value: 65},
						          {
							         id: "LB",
									 title: "Lebanon",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>驻在国安全形势--17</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--15</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--10</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--10</td></tr>"+
					      				"<tr><td align='left'>维和人员风险抵御能力--10</td></tr></table>",
							         value: 63},
				                  {
							         id: "CY",
									 title: "Cyprus",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>驻在国安全形势--20</td></tr>"+
					      				"<tr><td align='left'>驻在国外部特征--10</td></tr>"+
					      				"<tr><td align='left'>驻在国内部特征--10</td></tr>"+
					      				"<tr><td align='left'>联合国风险抵御能力--10</td></tr>"+
					      				"<tr><td align='left'>维和人员风险抵御能力--10</td></tr></table>",
							         value: 60}
						   ]
			    };
			    
			    worldDataProvider01 = {
						  mapVar: AmCharts.maps.worldLow,
					      getAreasFromMap:true,
			              zoomLevel: 2,
			              zoomLongitude: 15,
			              zoomLatitude: 30,
			              areas: [
						      {
						         id: "SS",
			                  	 title: "South Sudan",
			                  	 linkToObject: southSudanDataProvider,
			                  	 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
			                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
			                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
				      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
				      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
				      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
				      				"<tr><td align='left'>大国关系--3</td></tr>"+
				      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
				      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
				      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
						         value: $("#country").attr('title')},
						         {
							         id: "ML",
									 title: "Mali",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国之外的国际组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>恐怖主义影响--4</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势-3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--2</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 80},
				                  {
							         id: "CF",
									 title: "Central African Republic",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势-3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 90}, 
				                  {
							         id: "CD",
									 title: "Democratic Republic of Congo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 95}, 
				                  {
							         id: "HT",
									 title: "Haiti",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 80}, 
				                  {
							         id: "LR",
									 title: "Liberia",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 85}, 
				                  {
							         id: "EH",
									 title: "Western Sahara",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 75},
						          {
							         id: "XK",
									 title: "Kosovo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 65},
						          {
							         id: "LB",
									 title: "Lebanon",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 63},
				                  {
							         id: "CY",
									 title: "Cyprus",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>非政府组织影响--5</td></tr>"+
				                  		"<tr><td align='left'>联合国改革与发展趋势--4</td></tr>"+
				                  		"<tr><td align='left'>邻国国关系--4</td></tr>"+
					      				"<tr><td align='left'>地缘政治因素--3</td></tr>"+
					      				"<tr><td align='left'>联合国之外的国际组织影响--3</td></tr>"+
					      				"<tr><td align='left'>区域组织影响--3</td></tr>"+
					      				"<tr><td align='left'>大国关系--3</td></tr>"+
					      				"<tr><td align='left'>全球经济形势--3</td></tr>"+
					      				"<tr><td align='left'>恐怖主义影响--3</td></tr>"+
					      				"<tr><td align='left'>国际总体安全形势--2</td></tr></table>",
							         value: 60}        
			                  ]
			      		};
				  
			    worldDataProvider02 = {
						  mapVar: AmCharts.maps.worldLow,
					      getAreasFromMap:true,
			              zoomLevel: 2,
			              zoomLongitude: 15,
			              zoomLatitude: 30,
			              areas: [
						      {
						         id: "SS",
			                  	 title: "South Sudan",
			                  	 linkToObject: southSudanDataProvider,
			                  	 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
			                  		"<tr><td align='left'>自然灾害--5</td></tr>"+
			                  		"<tr><td align='left'>贫富差异--4</td></tr>"+
				      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
				      				"<tr><td align='left'>疾病疫病--3</td></tr>"+
				      				"<tr><td align='left'>政治纷争--3</td></tr>"+
				      				"<tr><td align='left'>宗教差异--3</td></tr>"+
				      				"<tr><td align='left'>种族差异--3</td></tr>"+
				      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
				      				"<tr><td align='left'>冲突各方对维和的态度--3</td></tr>"+
				      				"<tr><td align='left'>社会舆论风向--3</td></tr>"+
				      				"<tr><td align='left'>文化程度--3</td></tr>"+
				      				"<tr><td align='left'>驻在国经济形势--2</td></tr>"+
				      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
						         value: $("#country").attr('title')},
						         {
							         id: "ML",
									 title: "Mali",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--5</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
					      				"<tr><td align='left'>政治纷争--4</td></tr>"+
					      				"<tr><td align='left'>自然灾害--3</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>贫富差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
					      				"<tr><td align='left'>文化程度--2</td></tr>"+
					      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
							         value: 85},
				                  {
							         id: "CF",
									 title: "Central African Republic",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>种族差异--5</td></tr>"+
									 	"<tr><td align='left'>冲突各方对维和的态度--5</td></tr>"+
				                  		"<tr><td align='left'>自然灾害--5</td></tr>"+
				                  		"<tr><td align='left'>文化程度--4</td></tr>"+
				                  		"<tr><td align='left'>贫富差异--4</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--3</td></tr>"+
					      				"<tr><td align='left'>政治纷争--3</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--3</td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--2</td></tr>"+
					      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
							         value: 95}, 
				                  {
							         id: "CD",
									 title: "Democratic Republic of Congo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				                  		"<tr><td align='left'>自然灾害--5</td></tr>"+
				                  		"<tr><td align='left'>贫富差异--4</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--3</td></tr>"+
					      				"<tr><td align='left'>政治纷争--3</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--3</td></tr>"+
					      				"<tr><td align='left'>文化程度--3</td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--2</td></tr>"+
					      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
							         value: 85}, 
				                  {
							         id: "HT",
									 title: "Haiti",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--5</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
					      				"<tr><td align='left'>政治纷争--4</td></tr>"+
					      				"<tr><td align='left'>自然灾害--3</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>贫富差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
					      				"<tr><td align='left'>文化程度--2</td></tr>"+
					      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
							         value: 75}, 
				                  {
							         id: "LR",
									 title: "Liberia",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--5</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
					      				"<tr><td align='left'>政治纷争--4</td></tr>"+
					      				"<tr><td align='left'>自然灾害--3</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>贫富差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
					      				"<tr><td align='left'>文化程度--2</td></tr>"+
					      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
							         value: 75}, 
				                  {
							         id: "EH",
									 title: "Western Sahara",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--5</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
					      				"<tr><td align='left'>政治纷争--4</td></tr>"+
					      				"<tr><td align='left'>自然灾害--3</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>贫富差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
					      				"<tr><td align='left'>文化程度--2</td></tr>"+
					      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
							         value: 70},
						          {
							         id: "XK",
									 title: "Kosovo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--5</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--4</td></tr>"+
					      				"<tr><td align='left'>政治纷争--4</td></tr>"+
					      				"<tr><td align='left'>自然灾害--3</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>贫富差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--2</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--2</td></tr>"+
					      				"<tr><td align='left'>文化程度--2</td></tr>"+
					      				"<tr><td align='left'>人口性别比--2</td></tr></table>",
							         value: 65},
						          {
							         id: "LB",
									 title: "Lebanon",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--5</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--5</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--5</td></tr>"+
					      				"<tr><td align='left'>政治纷争--4</td></tr>"+
					      				"<tr><td align='left'>自然灾害--4</td></tr>"+
					      				"<tr><td align='left'>宗教差异--4</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>贫富差异--3</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--3</td></tr>"+
					      				"<tr><td align='left'>文化程度--3</td></tr>"+
					      				"<tr><td align='left'>人口性别比--3</td></tr></table>",
							         value: 90},
				                  {
							         id: "CY",
									 title: "Cyprus",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>驻在国经济形势--2</td></tr>"+
					      				"<tr><td align='left'>基础设施建设--4</td></tr>"+
					      				"<tr><td align='left'>疾病疫病--3</td></tr>"+
					      				"<tr><td align='left'>政治纷争--3</td></tr>"+
					      				"<tr><td align='left'>自然灾害--5</td></tr>"+
					      				"<tr><td align='left'>宗教差异--3</td></tr>"+
					      				"<tr><td align='left'>种族差异--3</td></tr>"+
					      				"<tr><td align='left'>贫富差异--4</td></tr>"+
					      				"<tr><td align='left'>公众对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>冲突各方对维和的态度--3</td></tr>"+
					      				"<tr><td align='left'>社会舆论风向--3</td></tr>"+
					      				"<tr><td align='left'>文化程度--3</td></tr>"+
					      				"<tr><td align='left'>人口性别比--3</td></tr></table>",
							         value: 60}         
			                  ]
			      		};
				  
			    worldDataProvider03 = {
						  mapVar: AmCharts.maps.worldLow,
					      getAreasFromMap:true,
			              zoomLevel: 2,
			              zoomLongitude: 15,
			              zoomLatitude: 30,
			              areas: [
						      {
						         id: "SS",
			                  	 title: "South Sudan",
			                  	 linkToObject: southSudanDataProvider,
			                  	 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>部落纷争--5</td></tr>"+
				      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
				      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
				      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
				      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
				      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
				      				"<tr><td align='left'>刑事案件--3</td></tr>"+
				      				"<tr><td align='left'>治安案件--3</td></tr>"+
				      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
				      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
				      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
				      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
				      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
						         value: $("#country").attr('title')},
						         {
							         id: "ML",
									 title: "Mali",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>跨国犯罪集团影响--5</td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--4</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势-3</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 99},
				                  {
							         id: "CF",
									 title: "Central African Republic",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>监狱管理能力--5</td></tr>"+
									 	"<tr><td align='left'>跨国犯罪集团影响--5</td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>刑事案件--4</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--4</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 95}, 
				                  {
							         id: "CD",
									 title: "Democratic Republic of Congo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 "<tr><td align='left'>武器枪支民间流散情况--5</td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--4</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--3</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--3</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr></table>",
							         value: 85}, 
				                  {
							         id: "HT",
									 title: "Haiti",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 80}, 
				                  {
							         id: "LR",
									 title: "Liberia",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 75}, 
				                  {
							         id: "EH",
									 title: "Western Sahara",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 70},
						          {
							         id: "XK",
									 title: "Kosovo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 65},
						          {
							         id: "LB",
									 title: "Lebanon",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 63},
				                  {
							         id: "CY",
									 title: "Cyprus",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>部落纷争--5</td></tr>"+
					      				"<tr><td align='left'>驻在国部队稳定性--5</td></tr>"+
					      				"<tr><td align='left'>当地警察数量及质量--4</td></tr>"+
					      				"<tr><td align='left'>案件侦破情况--3</td></tr>"+
					      				"<tr><td align='left'>反对派武装实力--3</td></tr>"+
					      				"<tr><td align='left'>武器枪支民间流散情况--3</td></tr>"+
					      				"<tr><td align='left'>刑事案件--3</td></tr>"+
					      				"<tr><td align='left'>治安案件--3</td></tr>"+
					      				"<tr><td align='left'>跨国犯罪集团影响--3</td></tr>"+
					      				"<tr><td align='left'>有组织犯罪形势--2</td></tr>"+
					      				"<tr><td align='left'>监狱管理能力--2</td></tr>"+
					      				"<tr><td align='left'>司法部门执法能力--2</td></tr>"+
					      				"<tr><td align='left'>伤亡人数--2</td></tr></table>",
							         value: 60}          
			                  ]
			      		};
				  
			    worldDataProvider04 = {
						  mapVar: AmCharts.maps.worldLow,
					      getAreasFromMap:true,
			              zoomLevel: 2,
			              zoomLongitude: 15,
			              zoomLatitude: 30,
			              areas: [
						      {
						         id: "SS",
			                  	 title: "South Sudan",
			                  	 linkToObject: southSudanDataProvider,
			                  	 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
				      				"<tr><td align='left'>联合国预算--4</td></tr>"+
				      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
				      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
				      				"<tr><td align='left'>任务区授权--3</td></tr>"+
				      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
				      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
						         value: $("#country").attr('title')},
						         {
							         id: "ML",
									 title: "Mali",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
					      				"<tr><td align='left'>联合国预算--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 99},
				                  {
							         id: "CF",
									 title: "Central African Republic",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>维和力量的社会管控能力--5</td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--4</td></tr>"+
					      				"<tr><td align='left'>联合国预算--3</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 95}, 
				                  {
							         id: "CD",
									 title: "Democratic Republic of Congo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>维和力量的协调配合能力--5</td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--4</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>联合国预算--3</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--3</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 85}, 
				                  {
							         id: "HT",
									 title: "Haiti",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
					      				"<tr><td align='left'>联合国预算--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 80}, 
				                  {
							         id: "LR",
									 title: "Liberia",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
					      				"<tr><td align='left'>联合国预算--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 75}, 
				                  {
							         id: "EH",
									 title: "Western Sahara",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--2</td></tr>"+
					      				"<tr><td align='left'>联合国预算--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--3</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--5</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--3</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--3</td></tr></table>",
							         value: 70},
						          {
							         id: "XK",
									 title: "Kosovo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
					      				"<tr><td align='left'>联合国预算--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 65},
						          {
							         id: "LB",
									 title: "Lebanon",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
					      				"<tr><td align='left'>联合国预算--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 63},
				                  {
							         id: "CY",
									 title: "Cyprus",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>风险应急响应机制--5</td></tr>"+
					      				"<tr><td align='left'>联合国预算--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的社会管控能力--4</td></tr>"+
					      				"<tr><td align='left'>维和力量的协调配合能力--3</td></tr>"+
					      				"<tr><td align='left'>任务区授权--3</td></tr>"+
					      				"<tr><td align='left'>维和警察装备--2</td></tr>"+
					      				"<tr><td align='left'>维和医疗救护--2</td></tr></table>",
							         value: 60}          
			                  ]
			      		};
				  
			    worldDataProvider05 = {
						  mapVar: AmCharts.maps.worldLow,
					      getAreasFromMap:true,
			              zoomLevel: 2,
			              zoomLongitude: 15,
			              zoomLatitude: 30,
			              areas: [
						      {
						         id: "SS",
			                  	 title: "South Sudan",
			                  	 linkToObject: southSudanDataProvider,
			                  	 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
				      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
				      				"<tr><td align='left'>个人装备--5</td></tr>"+
				      				"<tr><td align='left'>个人急救--4</td></tr>"+
				      				"<tr><td align='left'>语言交流--4</td></tr>"+
				      				"<tr><td align='left'>文化冲突--3</td></tr>"+
				      				"<tr><td align='left'>心理安全--3</td></tr>"+
				      				"<tr><td align='left'>交通安全--3</td></tr>"+
				      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
				      				"<tr><td align='left'>违纪情况--2</td></tr>"+
				      				"<tr><td align='left'>受训情况--2</td></tr>"+
				      				"<tr><td align='left'>学历情况--2</td></tr>"+
				      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
						         value: $("#country").attr('title')},
						         {
							         id: "ML",
									 title: "Mali",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况-2</td></tr>"+
					      				"<tr><td align='left'>受训情况-2</td></tr>"+
					      				"<tr><td align='left'>学历情况-2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 99},
				                  {
							         id: "CF",
									 title: "Central African Republic",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
									 	"<tr><td align='left'>交通安全--5</td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>文化冲突--4</td></tr>"+
					      				"<tr><td align='left'>个人装备--4</td></tr>"+
					      				"<tr><td align='left'>受训情况--3</td></tr>"+
					      				"<tr><td align='left'>个人急救--3</td></tr>"+
					      				"<tr><td align='left'>语言交流--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--2</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 80}, 
				                  {
							         id: "CD",
									 title: "Democratic Republic of Congo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>受训情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 85}, 
				                  {
							         id: "HT",
									 title: "Haiti",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>受训情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 95}, 
				                  {
							         id: "LR",
									 title: "Liberia",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>受训情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 75}, 
				                  {
							         id: "EH",
									 title: "Western Sahara",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>受训情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 70},
						          {
							         id: "XK",
									 title: "Kosovo",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>受训情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 65},
						          {
							         id: "LB",
									 title: "Lebanon",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>受训情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 63},
				                  {
							         id: "CY",
									 title: "Cyprus",
									 balloonText: "<table><tr><td><b>[[title]]</b></td></tr>"+
					      				"<tr><td align='left'>维和人员数量质量--5</td></tr>"+
					      				"<tr><td align='left'>个人装备--5</td></tr>"+
					      				"<tr><td align='left'>个人急救--4</td></tr>"+
					      				"<tr><td align='left'>语言交流--4</td></tr>"+
					      				"<tr><td align='left'>文化冲突--3</td></tr>"+
					      				"<tr><td align='left'>心理安全--3</td></tr>"+
					      				"<tr><td align='left'>交通安全--3</td></tr>"+
					      				"<tr><td align='left'>人身财产安全--3</td></tr>"+
					      				"<tr><td align='left'>违纪情况--2</td></tr>"+
					      				"<tr><td align='left'>受训情况--2</td></tr>"+
					      				"<tr><td align='left'>学历情况--2</td></tr>"+
					      				"<tr><td align='left'>分队管理水平--2</td></tr></table>",
							         value: 60}         
			                  ]
			      		};
				  var button01 = {
						    imageURL: "img/waibu.png",
						    height:32,
						    width:32,
					        label: "驻在国外部特征",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: worldDataProvider01,
					        left: 30,
					        bottom: 250,
					        labelFontSize: 20
					    };
				  var button02 = {
						  	imageURL: "img/neibu.png",
						  	height:32,
						    width:32,
					        label: "驻在国内部特征",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: worldDataProvider02,
					        left: 30,
					        bottom: 200,
					        labelFontSize: 20
					    };
				  var button03 = {
						  	imageURL: "img/anquan.png",
						  	height:32,
						    width:32,
					        label: "驻在国安全形势",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: worldDataProvider03,
					        left: 30,
					        bottom: 150,
					        labelFontSize: 20
					    };
				  var button04 = {
						    imageURL: "img/lianheguo.png",
						  	height:32,
						    width:32,
					        label: "联合国风险抵御能力",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: worldDataProvider04,
					        left: 30,
					        bottom: 100,
					        labelFontSize: 20
					    };
				  var button05 = {
						  	imageURL: "img/jingcha.png",
						  	height:32,
						    width:32,
					        label: "维和人员风险抵御能力",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: worldDataProvider05,
					        left: 30,
					        bottom: 50,
					        labelFontSize: 20
					    };
				  
				  var ss_button01 = {
						    imageURL: "img/waibu.png",
						    height:32,
						    width:32,
					        label: "驻在国外部特征",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: southSudanDataProvider01,
					        left: 30,
					        bottom: 250,
					        labelFontSize: 20
					    };
				  var ss_button02 = {
						  	imageURL: "img/neibu.png",
						  	height:32,
						    width:32,
					        label: "驻在国内部特征",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: southSudanDataProvider02,
					        left: 30,
					        bottom: 200,
					        labelFontSize: 20
					    };
				  var ss_button03 = {
						  	imageURL: "img/anquan.png",
						  	height:32,
						    width:32,
					        label: "驻在国安全形势",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: southSudanDataProvider03,
					        left: 30,
					        bottom: 150,
					        labelFontSize: 20
					    };
				  var ss_button04 = {
						    imageURL: "img/lianheguo.png",
						  	height:32,
						    width:32,
					        label: "联合国风险抵御能力",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: southSudanDataProvider04,
					        left: 30,
					        bottom: 100,
					        labelFontSize: 20
					    };
				  var ss_button05 = {
						  	imageURL: "img/jingcha.png",
						  	height:32,
						    width:32,
					        label: "维和人员风险抵御能力",
					        rollOverColor: "#CC0000",
					        labelRollOverColor: "#CC0000",
					        useTargetsZoomValues: true,
					        linkToObject: southSudanDataProvider05,
					        left: 30,
					        bottom: 50,
					        labelFontSize: 20
					    };
				  var juba = {
						  svgPath: targetSVG,
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "朱巴",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      linkToObject: southSudanDataProvider,
					      labelFontSize: 15,
					      latitude: 4.7416,
					      longitude: 31.3979
				  };
				  var ss_juba = {
						  svgPath: targetSVG,
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "朱巴",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      labelFontSize: 15,
					      latitude: 4.7416,
					      longitude: 31.3979
				  };
				  var bamako = {
						  svgPath: targetSVG,
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "巴马科",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      labelFontSize: 15,
					      latitude: 12.6530,
					      longitude: -7.9864
				  };
				  
				  var laayoune = {
						  svgPath: targetSVG,
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "阿尤恩",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      labelFontSize: 15,
					      latitude: 27.7971,
					      longitude: -12.7911
				  };
				  var monrovia = {
						  svgPath: targetSVG,
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "蒙罗维亚",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      labelFontSize: 15,
					      latitude: 6.4232,
					      longitude: -10.5357
				  };
				  var bangui = {
						  svgPath: targetSVG,
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "班吉",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      labelFontSize: 15,
					      latitude: 4.3621,
					      longitude: 18.5873
				  };
				  var kinshasa = {
						  svgPath: targetSVG,
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "金沙萨",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      labelFontSize: 15,
					      latitude: -4.3369,
					      longitude: 15.3271
				  };
				  var beijing =  {
						  imageURL : "img/beijing.png",
						  height:15,
						  width:15,
					      zoomLevel: 5,
					      scale: 0.5,
					      label: "北京",
					      rollOverColor: "#CC0000",
					      labelRollOverColor: "#CC0000",
					      labelFontSize: 20,
					      latitude: 39.9056,
					      longitude: 116.3958
				  };
				worldDataProvider.images = [button01,button02,button03,button04,button05,juba,monrovia,bamako,laayoune,bangui,kinshasa,beijing];
				worldDataProvider01.images = [button01,button02,button03,button04,button05,juba,monrovia,bamako,laayoune,bangui,kinshasa,beijing];
				worldDataProvider02.images = [button01,button02,button03,button04,button05,juba,monrovia,bamako,laayoune,bangui,kinshasa,beijing];
				worldDataProvider03.images = [button01,button02,button03,button04,button05,juba,monrovia,bamako,laayoune,bangui,kinshasa,beijing];
				worldDataProvider04.images = [button01,button02,button03,button04,button05,juba,monrovia,bamako,laayoune,bangui,kinshasa,beijing];
				worldDataProvider05.images = [button01,button02,button03,button04,button05,juba,monrovia,bamako,laayoune,bangui,kinshasa,beijing];
				
				southSudanDataProvider.images= [ss_button01,ss_button02,ss_button03,ss_button04,ss_button05,ss_juba];
				southSudanDataProvider01.images= [ss_button01,ss_button02,ss_button03,ss_button04,ss_button05,ss_juba];
				southSudanDataProvider02.images= [ss_button01,ss_button02,ss_button03,ss_button04,ss_button05,ss_juba];
				southSudanDataProvider03.images= [ss_button01,ss_button02,ss_button03,ss_button04,ss_button05,ss_juba];
				southSudanDataProvider04.images= [ss_button01,ss_button02,ss_button03,ss_button04,ss_button05,ss_juba];
				southSudanDataProvider05.images= [ss_button01,ss_button02,ss_button03,ss_button04,ss_button05,ss_juba];
				
				map.colorSteps = 5;
				map.minValue = 0;
				map.maxValue = 5;
				map.zoomControl =  {
		                "gridHeight": 100,
		                "draggerAlpha": 1,
		                "gridAlpha": 0.2
		              };
				
			    map.areasSettings = {
			        autoZoom: true,
			        color: "#33cc00",
			        colorSolid: "#ff3030",
			        selectedColor: "#00FF99",
			        rollOverOutlineColor: "#000000"
			    };
			    
			    map.imagesSettings = {
				        color: "#CC0000",
				        rollOverColor: "#CC0000",
				        selectedColor: "#000000",
				        selectedLabelColor: "#FF000",
				      };
			    
				
			    map.titles = [{text: "联合国维和行动风险评估系统",size:50,color:"#5E5E5E"}];
			    map.colorSteps = 10;
		        map.valueLegend =  {
                          "right": 10,
                          "minValue": "安全",
                          "maxValue": "危险"
                        };
			    map.dataProvider = worldDataProvider;
          		map.theme = "light";
          		map.smallMap = new AmCharts.SmallMap();
          		map.addListener("homeButtonClicked", handleGoHome);
			    map.write("mapdiv");

			});
      
		</script>
    </head>

    <body>
        <div id="mapdiv" style="width: 100%; background-color:#EEEEEE;"></div>
        <c:forEach var="pro_src" items="${list_pro_src}" varStatus="s">
            <div id="pro_src${s.count}" title="${pro_src}"></div>
        </c:forEach>
        <div id="country" title="${country_src}"></div>
    </body>
<script type="text/javascript">

</script>
</html>