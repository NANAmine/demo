package com.huanying.framework.system_cfg;

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

@Controller
public class System_cfgController extends BaseController {

	@Autowired
	private System_cfgService system_cfgService;
	private static Logger logger = Logger.getLogger(System_cfgController.class);
	@RequestMapping("/show_add_system_cfg.do")
	public String index(String cn_name,String en_name, String page_num,Model model) throws Exception {

		Map<String, String> map = new HashMap<String, String>();
		map.put("cn_name", cn_name);
		map.put("en_name", en_name);
		if(page_num ==null){
			page_num = "1";
		}
		PageBean pageBean = system_cfgService.searchSystem_cfgs(map, super.getPageSize(), Integer.valueOf(page_num));
		model.addAttribute("system_cfgs", pageBean.getList());
		model.addAttribute("page",pageBean);
		return "system_cfg/add_system_cfg";
	}
	
	@RequestMapping(value="/add_system_cfg.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> save(@RequestBody System_cfg system_cfg) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			if(system_cfg.getId()==0){
				system_cfgService.add(system_cfg);
			}
			else{
				system_cfgService.update(system_cfg);
			}
			map.put("flag", "1");
			map.put("id", String.valueOf(system_cfg.getId()));
		} catch (Exception e) {
			logger.error("操作机构失败",e);
			map.put("flag", "0");
		}
		return map;
	}
	
	@RequestMapping(value="/get_system_cfg.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> get_client(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			System_cfg c = system_cfgService.getbyId(id);
			map.put("flag", "1");
			map.put("system_cfg", c);
		} catch (Exception e) {
			logger.error("查询机构失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
	
}
