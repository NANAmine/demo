package com.huanying.framework.manage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huanying.framework.BaseController;
import com.huanying.framework.adminuser.Adminuser;
import com.huanying.framework.adminuser.AdminuserService;


@Controller
public class ManageController extends BaseController {
	private Adminuser user;
	@Autowired
	private AdminuserService userService;

	
	@RequestMapping("/manage_header.do")
	public String header(Model model) throws Exception {
		return "manage/header";
	}
	
	@RequestMapping("/manage_tree.do")
	
	public String tree(HttpServletRequest request,Model model) throws Exception {
		if(request.getParameter("user_id")!=null)
		{
			user=(Adminuser)this.getSession().getAttribute("user");
			
		model.addAttribute("user",user);
		}
		return "manage/tree";
	}
	
	@RequestMapping("/manage_foot.do")
	public String foot(Model model) throws Exception {
		
		model.addAttribute("name", "");
		return "manage/foot";
	}
	
	@RequestMapping("/manage_user_detail.do")
	public String user_detail(String user_id,Model model) throws Exception {
		user=userService.getbyId(Integer.parseInt(user_id));
		model.addAttribute("user",user);
		model.addAttribute("name", "");
		return "manage/user_detail";
	}
	
	@RequestMapping("/manage_exit.do")
	public String exit1(Model model) throws Exception {
		
		//session.removeAttribute("user");
		return "adminuser/login";
	}
}
