package com.huanying.framework.user;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huanying.framework.BaseController;
import com.huanying.framework.PageBean;

@Controller
public class UserController extends BaseController {
	
	@Autowired
	private UserService userService;
	
	Logger logger = Logger.getLogger(UserController.class);
	
	@RequestMapping("/show_add_user.do")
	public String index(String name,String page_num,Model model) throws Exception {
		model.addAttribute("name", "");
		if(page_num ==null){
			page_num = "1";
		}
		PageBean pageBean = userService.searchUsers(name, 3, Integer.valueOf(page_num));
		
		model.addAttribute("users", pageBean.getList());
		model.addAttribute("page",pageBean);
		model.addAttribute("name", name);
		return "user/add_user";
	}
	
	

}
