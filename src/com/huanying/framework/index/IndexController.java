package com.huanying.framework.index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.huanying.framework.BaseController;

@Controller
public class IndexController extends BaseController {
	
	@RequestMapping("/index.do")
	public String index(@RequestParam(value = "user", required = false) String user,Model model) throws Exception {
		model.addAttribute("name", "");
		return "index/index";
	}
	
	@RequestMapping("/header.do")
	public String header(Model model) throws Exception {
		return "index/header";
	}
	
	@RequestMapping("/tree.do")
	public String tree(Model model) throws Exception {
		return "index/tree";
	}
	
	@RequestMapping("/foot.do")
	public String foot(Model model) throws Exception {
		
		model.addAttribute("name", "");
		return "index/foot";
	}
}

