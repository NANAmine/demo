package com.huanying.risk.point;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huanying.framework.BaseController;
import com.huanying.framework.PageBean;
import com.huanying.risk.source.Risk_Source;
import com.huanying.risk.source.SourceService;

@Controller
public class PointController extends BaseController {

	@Autowired
	private PointService pointService;
	@Autowired
	private SourceService sourceService;
	private static Logger logger = Logger.getLogger(PointController.class);
	
	@RequestMapping("/show_add_point.do")
	public String index(String name,String page_num,Model model) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		map.put("name", name);
		model.addAttribute("name", "");
		if(page_num ==null){
			page_num = "1";
		}
		PageBean pageBean_point = pointService.searchPoints(map, super.getPageSize(), Integer.valueOf(page_num));
		PageBean pageBean_source = sourceService.searchSources(new HashMap(), 100, 1);
		model.addAttribute("points", pageBean_point.getList());
		model.addAttribute("sources", pageBean_source.getList());
		model.addAttribute("page",pageBean_point);
		model.addAttribute("name", name);
		return "point/show_add_point";
	}
	
	@RequestMapping(value="/add_point.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> save(@RequestBody Risk_Point point,String source_id) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			if(point.getId()==0){
				point.setStatus(1);
				Risk_Source s = sourceService.getbyId(Integer.valueOf(source_id).intValue());
				point.setSource(s);
				pointService.add(point);
			}
			else{
				point.setStatus(1);
				Risk_Source s = sourceService.getbyId(Integer.valueOf(source_id).intValue());
				point.setSource(s);
				pointService.update(point);
			}
			map.put("flag", "1");
			map.put("id", String.valueOf(point.getId()));
		} catch (Exception e) {
			logger.error("操作监测点失败",e);
			map.put("flag", "0");
		}
		return map;
	}
	
	@RequestMapping(value="/get_point.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> get_client(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Risk_Point p = pointService.getbyId(id);
			map.put("flag", "1");
			map.put("point", p);
		} catch (Exception e) {
			logger.error("查询监测点失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
	@RequestMapping(value="/delete_point.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> delete_source(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pointService.delete(id);
			map.put("flag", "1");
		} catch (Exception e) {
			logger.error("删除监测点失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
}
