package com.huanying.framework.adminuser;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.exceptions.ClientException;
import com.huanying.framework.BaseController;
import com.huanying.framework.PageBean;
import com.huanying.framework.user.User;
import com.huanying.framework.user.UserService;
import com.huanying.framework.utils.MD5;

@Controller
public class AdminuserController extends BaseController {
	@Autowired
	private UserService userService;

	private static Logger logger = Logger.getLogger(AdminuserController.class);

	@RequestMapping(value = "/login.do")
	public String login(String area, Model model) {
		model.addAttribute("area",area);
		return "/adminuser/login";
	}

	// 处理登录传过来的数据检查用户是否注册
	@RequestMapping(value = "/dologin.do")
	public String dologin(HttpServletRequest request,String name, String password,String area, Model model) {

		User user;
		String url="";
		try {
			PageBean user_page = userService.searchUsers(name, 1, 1);
			user = (User)user_page.getList().get(0);
			if (user != null) {
				HttpSession session = request.getSession();
					// 比对加密后的密码与数据库中的密码
				session.setAttribute("user", user);
				if (password.equals(user.getPassword())) {
					if (user.getType() == 1) {
						url = "redirect:show_add_source.do";
					}else if(user.getType()==3){
						url = "redirect:show_point_list.do?type=1";
					}else if(user.getType()==4){
						url = "redirect:show_point_list.do?type=2";
					}
					else {
						if(area.equals("1")){
							url = "redirect:nsd_map.do";
						}
						else{
							url = "redirect:map.do";
						}
					}
					logger.info("后台用户登陆成功");
				} else {
					model.addAttribute("mes", "2");
					return "/adminuser/login";
				}
			} else {
				model.addAttribute("mes", "1");
				return "/adminuser/login";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("用户验证出错", e);
		}

		return url;
	}
}
