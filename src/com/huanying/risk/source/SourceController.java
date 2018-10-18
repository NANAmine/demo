package com.huanying.risk.source;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

@Controller
public class SourceController extends BaseController {

	@Autowired
	private SourceService sourceService;
	private static Logger logger = Logger.getLogger(SourceController.class);
	
	@RequestMapping("/show_add_source.do")
	public String index(String name,String page_num,Model model) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		map.put("name", name);
		if(page_num ==null){
			page_num = "1";
		}
		PageBean pageBean = sourceService.searchSources(map, super.getPageSize(), Integer.valueOf(page_num));
		model.addAttribute("sources", pageBean.getList());
		model.addAttribute("page",pageBean);
		model.addAttribute("name", name);
		return "source/show_add_source";
	}
	
	@RequestMapping(value="/add_source.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> save(@RequestBody Risk_Source source, String status) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			if(source.getId()==0){
				source.setStatus(1);
				sourceService.add(source);
			}
			else{
				source.setStatus(1);
				sourceService.update(source);
			}
			map.put("flag", "1");
			map.put("id", String.valueOf(source.getId()));
		} catch (Exception e) {
			logger.error("操作风险源失败",e);
			map.put("flag", "0");
		}
		return map;
	}
	
	@RequestMapping(value="/get_source.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> get_source(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Risk_Source s = sourceService.getbyId(id);
			map.put("flag", "1");
			map.put("source", s);
		} catch (Exception e) {
			logger.error("查询风险源失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
	@RequestMapping(value="/delete_source.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> delete_source(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			sourceService.delete(id);
			map.put("flag", "1");
		} catch (Exception e) {
			logger.error("删除风险源失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
}
