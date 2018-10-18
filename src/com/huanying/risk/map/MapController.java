package com.huanying.risk.map;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.huanying.framework.BaseController;
import com.huanying.framework.PageBean;
import com.huanying.risk.content.Content;
import com.huanying.risk.content.ContentService;
import com.huanying.risk.content.Country;
import com.huanying.risk.content.Province;
import com.huanying.risk.keyword.KeyWord;
import com.huanying.risk.point.PointService;
import com.huanying.risk.point.Risk_Point;
import com.huanying.risk.source.Risk_Source;
import com.huanying.risk.source.SourceService;

@Controller
public class MapController extends BaseController {
	
	@Autowired
	private ContentService contentService;
	@Autowired
	private SourceService sourceService;
	@Autowired
	private PointService pointService;
    @Autowired
//	private KeyWordService keyService;
	private static Logger logger = Logger.getLogger(MapController.class);
	
/*	@RequestMapping("/map.do")
	public String map(Model model) throws Exception {
		Map map = new HashMap();
		//获得所有国家
		PageBean pageBean  = contentService.searchCountry(map, 100, 1);
		List country_list = pageBean.getList();
		//获得所有风险源
		map.clear();
		pageBean = sourceService.searchSources(map, 100, 1);
		List source_list = pageBean.getList();
		//获得所有风险点
		map.clear();
		pageBean = pointService.searchPoints(map, 100, 1);
		List point_list = pageBean.getList();
		//组装成key=point_id value=权重的map
		Map pointMap = new HashMap();
		for(int i=0; i<point_list.size(); i++){
			Risk_Point point = (Risk_Point)point_list.get(i);
			pointMap.put(point.getId(), point.getWeight());
		}
		
		//循环国家
		
		//主页需要两种数据
		//1.国家总揽List(Map({"国家名"："","国家code":"","分数":"","风险源列表":List(Map({"风险源名":"","分数":""}))}))
		List<Map> conntry_all_list = new ArrayList<Map>();
		//2.国家各风险源详情 List(Map("风险源名":"","国家列表"：List(Map({"国家名"："","国家id":"","单项风险源分数":"","风险点列表":List(Map({"风险点名":"","分数":""}))}))))
		
		for(int i=0; i<country_list.size(); i++){
			float country_total = 0;
			
			Map countryMap = new HashMap();
			//记录全国内每一个风险源总得分key=风险源id  value=得分
			Map<Integer,Float> country_source_map = new HashMap();
			
			Country country = (Country)country_list.get(i);
			//获得该国所有省份
			map.clear();
			map.put("country_id", country.getId());
			pageBean= contentService.searchProvince(map, 100, 1);
			List province_list = pageBean.getList();
			//省份总揽List(Map({"省名"："","省code":"","总分数":"","风险源列表":List(Map({"风险源名":"","分数":""}))}))
			List<Map> province_all_list = new ArrayList<Map>();
			//循环所有省
			for(int j=0; j<province_list.size(); j++){
				
				Map province_source_map = new HashMap();
				Province province = (Province)province_list.get(j);
				//获得当前省所有风险点打分情况
				map.clear();
				map.put("province_id", province.getId());
				pageBean = contentService.searchContent(map, 100, 1);
				List content_list = pageBean.getList();
				//循环风险点得分，组成key=point_id  value=得分的map
				Map contentMap = new HashMap();
				for(int k=0; k<content_list.size(); k++){
					Content content = (Content)content_list.get(k);
					contentMap.put(content.getPoint().getId(), content.getScore());
				}
				
				
				List province_source_data_list = new ArrayList();
				float province_total = 0;
				//循环风险源，计算当前省内每个风险源分数
				for(int h=0; h<source_list.size(); h++){
					float province_source_total = 0;
					Map province_source_score = new HashMap();
					Map province_one_source_score = new HashMap();
					Risk_Source source = (Risk_Source)source_list.get(h);
					if(country_source_map.get(source.getId()) == null){
						country_source_map.put(source.getId(), Float.valueOf(0));
					}
					
					//获得当前风险源下所有风险点
					map.clear();
					map.put("source_id", source.getId());
					pageBean = pointService.searchPoints(map, 100, 1);
					List source_point_list = pageBean.getList();
					List provice_source_point_data_list = new ArrayList();
					Map province_point_map = new HashMap();
					//循环当前风险源下所有风险点，获得评分
					for(int f=0; f<source_point_list.size(); f++){
						Risk_Point p = (Risk_Point)source_point_list.get(f);
						//获得打分
//						Integer score = (Integer)contentMap.get(p.getId());
//						System.out.println(score);
//						Integer all = 5; 
//						double weight = (double)pointMap.get(p.getId()); 
//						double final_score = (float)(score/all)*weight;
////						int final_score = (int)(score/all);
//					    System.out.println(final_score);
//						country_total+=final_score;
//						country_source_map.put(source.getId(),country_source_map.get(source.getId())+final_score);
//						province_total+=final_score;
//						province_source_total+=final_score;
//						province_point_map.put("point_name", p.getName());
//						province_point_map.put("point_score", score);
//						provice_source_point_data_list.add(province_point_map);
						Integer score = (Integer)contentMap.get(p.getId());
						System.out.println(source_point_list.size());
						System.out.println(score);
						Integer all = 5; 
//						double weight = (double)pointMap.get(p.getId()); 
//						double final_score = (float)(score/all)*weight;
//						int final_score = (int)(score/all);
//					    System.out.println(final_score);
						if(score==null) {score=0;}
						country_total=(country_total+score)/(f+1); 
						country_source_map.put(source.getId(),country_source_map.get(source.getId())+score);
						province_total+=score;
						province_source_total+=score;
						province_point_map.put("point_name", p.getName());
						province_point_map.put("point_score", score);
						provice_source_point_data_list.add(province_point_map);
					}
					province_source_score.put("source_name",source.getName());
					province_source_score.put("source_score", province_source_total);
					province_source_data_list.add(province_source_score);
					for (Object object : provice_source_point_data_list) {
						System.out.println("单个省份各项风险点分数："+object);
					}
					
					
				}
				
				//组装省份主页数据  List(Map({省名,""},{分数,""}{数据,"List(Map{风险源名,""},{分数,""})"})
				province_source_map.put("province_name", province.getEn_name());
				province_source_map.put("province_code", province.getCode());
				province_source_map.put("score", province_total);
				province_source_map.put("data", province_source_data_list);
				for (Object object : province_source_data_list) {
					System.out.println(province.getCode()); 
					System.out.println(province_total);
					System.out.println("各省份数据风险源分数："+object);
				}
				//组装省份各风险源List
				
				
			}
			//组装主页1中的map
			List country_soure_list = new ArrayList();
			for(int h=0; h<source_list.size(); h++){
				Map source_map = new HashMap();
				Risk_Source source = (Risk_Source)source_list.get(h);
				source_map.put("source_name", source.getName());
				source_map.put("score", country_source_map.get(source.getId()));
				country_soure_list.add(source_map);
				for (Object object : country_soure_list) {
					System.out.println("国家分数："+object);
				}
			}
			
			countryMap.put("en_name", country.getEn_name());
			countryMap.put("code", country.getCode());
			countryMap.put("source_list", country_soure_list);
			conntry_all_list.add(countryMap);
			for (Object object : country_soure_list) {
				//province_source_map.score
				System.out.println("全球分数："+object);
			}
		}
		
		return "index/map";
	}*/
	
   /* select * from province  where country_id=?

    		select sum(t.) from cotent t where t.province_id=?

    		select sum(t.) from Cotent t where t.province_id in (select * from Province where country_id = ? )

    		list(province_id_list)

    		map("id","fen");*/
    @RequestMapping("/map.do")
	public String map(Model model) throws Exception {
    	Map m = new HashMap();
//    	int id=Integer.valueOf(country_id);
//    	int id=1;
//    	m.put("province_id", id);
//		PageBean pageBean = contentService.searchProvinceContent(m, 100, 1);
//		List<Content> content_list = pageBean.getList();
//		model.addAttribute("content_list",content_list);
////		for(int i=0;i<privance_list.size();i++){
////			System.out.println(image_list.get(i));
////		}
////		for(int i=0;i<content_list.size();i++) {
////			System.out.println(content_list[i]);
////		}
//		int province_score_average=0;
//		for (Content content : content_list) {
//			province_score_average+=content.getScore();
//		}
//		model.addAttribute("province_score_average",province_score_average/content_list.size());
    	int id=7;
    	m.put("country_id", id);
		PageBean pageBean = contentService.searchProvince(m, 100, 1);
		List<Province> province_list = pageBean.getList();
		List<Integer> list_pro_src =new ArrayList();
		Integer country_src=0;
		for (Province province : province_list) {
			m.put("province_id", province.getId());
			PageBean pageBean2 = contentService.searchProvinceContent(m, 100, 1);
			List<Content> content_list = pageBean2.getList(); 
			int sum=0;
			for (Content content : content_list) {
				sum=sum+content.getScore();
			}
			if(content_list.size()==0) {
				list_pro_src.add(content_list.size()); 
			}else {
				list_pro_src.add(sum/content_list.size()); 
			}
			
			System.out.println(province.getId());
		}
		for (Integer integer : list_pro_src) {
			country_src+=integer;
			
		}
		model.addAttribute("country_src",country_src/list_pro_src.size());
		model.addAttribute("list_pro_src",list_pro_src);
    	return "index/map";
    }    
	@RequestMapping("/nsd_map.do")
	public String nsd_map(Model model) throws Exception {
		Map map = new HashMap();
		return "index/nsd_map";
	}
	
	
	public static void main(String[] args) {
		float a = 4;
		float b = 5;
		float c = a/b;
		System.out.println(c);
	}
}
