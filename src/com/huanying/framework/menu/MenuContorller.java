package com.huanying.framework.menu;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huanying.framework.BaseController;
import com.huanying.framework.PageBean;
import com.huanying.framework.company.CompanyController;

@Controller
public class MenuContorller extends BaseController {
	
	@Autowired
	private MenuService menuService;
	private static Logger logger = Logger.getLogger(CompanyController.class);
	
	@RequestMapping("/show_add_menu.do")
	public String index(String name, String level,String page_num,Model model,HttpSession session) throws Exception {
		model.addAttribute("name", "");
		if(page_num ==null){
			page_num = "1";
		}
		PageBean pageBean = menuService.searchMenus(name,0, super.getPageSize(), Integer.valueOf(page_num));

		model.addAttribute("menus", pageBean.getList());
		model.addAttribute("page",pageBean);
		model.addAttribute("name", name);
		model.addAttribute("pageSize", super.getPageSize());
		return "menu/add_menu";
	}
	
	@RequestMapping(value="/add_menu.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> save(@RequestBody Menu menu) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			//新增
			if(menu.getId()==0){				
				Menu m = menuService.getbyId(menu.getPrevious_id());
				menu.setPrevious_menu(m);
				menuService.add(menu);								
			}
			//修改
			else{
				Menu m = menuService.getbyId(menu.getPrevious_id());
				menu.setPrevious_menu(m);
				menuService.update(menu);
			}
			map.put("flag", "1");
			map.put("id", String.valueOf(menu.getId()));
		} catch (Exception e) {
			logger.error("添加菜单失败",e);
			map.put("flag", "0");
		}
		return map;
	}
	
	@RequestMapping(value="/get_menu.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> get_menu(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Menu m = menuService.getbyId(id);
			PageBean pageBean = menuService.searchMenus(null,m.getLevel()-1, 10, 1);
			map.put("flag", "1");
			map.put("menu", m);
			map.put("menues", pageBean.getList());
		} catch (Exception e) {
			logger.error("查询菜单失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
	@RequestMapping("/get_previous_menu/{level}/.do")
	@ResponseBody 
	public Map<String, Object> get_previous_menu(@PathVariable("level") int level) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			PageBean pageBean = menuService.searchMenus(null,level-1, 10, 1);
			map.put("flag", "1");
			map.put("menues", pageBean.getList());
		} catch (Exception e) {
			logger.error("查询菜单失败",e);
			map.put("flag", "0");
		}		
		return map;
	} 
}
