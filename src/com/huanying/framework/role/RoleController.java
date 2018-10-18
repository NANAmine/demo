package com.huanying.framework.role;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.huanying.framework.menu.Menu;
import com.huanying.framework.menu.MenuService;

@Controller
public class RoleController extends BaseController{
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	private static Logger logger = Logger.getLogger(RoleController.class);
	@RequestMapping("/show_add_role.do")
	public String index(String name, String page_num, Model model) throws Exception {
		model.addAttribute("name", "");
		if (page_num == null) {
			page_num = "1";
		}
		PageBean pageBean = roleService.searchRoles(name, super.getPageSize(), Integer.valueOf(page_num));
		// 获得全部菜单
		PageBean p2 = menuService.searchMenus(null, 2, 20, 1);
		PageBean p3 = menuService.searchMenus(null, 3, 20, 1);
		List<Menu> m_l_2 = p2.getList();
		List<Menu> m_l_3 = p3.getList();
		List all_m = new ArrayList();
		Menu m2;
		Menu m3;
		for (int i = 0; i < m_l_2.size(); i++) {
			List<Menu> temp_m = new ArrayList<Menu>();
			m2 = (Menu) m_l_2.get(i);
			temp_m.add(m2);
			for (int j = 0; j < m_l_3.size(); j++) {
				m3 = (Menu) m_l_3.get(j);
				if (m3.getPrevious_menu().getId() == m2.getId()) {
					temp_m.add(m3);
				}
			}
			all_m.add(temp_m);
		}
		model.addAttribute("roles", pageBean.getList());
		model.addAttribute("page", pageBean);
		model.addAttribute("name", name);
		model.addAttribute("all_m", all_m);
		return "role/add_role";
	}

	@RequestMapping(value = "/add_role/{menus_id}/.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> save(@RequestBody Role role, @PathVariable("menus_id") String menus_id, String status) {
		Map<String, String> map = new HashMap<String, String>();

		try {
			if (!menus_id.equals("0")) {
				String[] menuid_array = menus_id.split("_");
				if (role.getId() == 0) {
					role.setStatus(1);
					roleService.add(role, menuid_array);
				} else {
					Role beforerole = roleService.getbyId(role.getId());
					role.setStatus(Integer.parseInt(status));
					if (role.getStatus() == beforerole.getStatus()) {
						roleService.deleteOld(role);
						roleService.update(role, menuid_array);
						roleService.delete_role_menu(role.getId(), role.getStatus());
					} else {
						roleService.update_role(role);
						roleService.delete_role_menu(role.getId(), role.getStatus());
					}

				}
			} else {

				if (role.getId() == 0) {
					role.setStatus(1);
					roleService.add_role(role);
				} else {
					Role beforerole = roleService.getbyId(role.getId());
					role.setStatus(Integer.parseInt(status));
					if (role.getStatus() == beforerole.getStatus()) {
						roleService.deleteOld(role);
					}
					roleService.update_role(role);
					roleService.delete_role_menu(role.getId(), role.getStatus());
				}

			}
			map.put("flag", "1");
			map.put("id", String.valueOf(role.getId()));
		} catch (Exception e) {
			logger.error("操作角色失败", e);
			map.put("flag", "0");
		}

		return map;
	}

	@RequestMapping(value = "/get_role/{id}/.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> get_role(@PathVariable("id") int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Role r = roleService.getbyId(id);
			List<Menu> menus = menuService.getbyRoleId(id);
			map.put("flag", "1");
			map.put("role", r);
			map.put("menus", menus);
		} catch (Exception e) {
			logger.error("添加角色失败", e);
			map.put("flag", "0");
		}

		return map;
	}

	@RequestMapping(value = "/delete_role/{id}/.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> delete_role(@PathVariable("id") int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			roleService.delete(id);
			roleService.delete_role_menu(id, 0);
			map.put("flag", "1");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			map.put("flag", "0");
			logger.error("删除角色失败", e);
			e.printStackTrace();
		}
		return map;
	}
}
