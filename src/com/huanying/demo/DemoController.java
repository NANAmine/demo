package com.huanying.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/*
 * controller
 */
@Controller
public class DemoController {
	
	@Autowired
	private DemoService demoService;
	
	@RequestMapping("/demo.do")
	public String hello(
			@RequestParam(value = "name", required = false, defaultValue = "World") String name,
			Model model) {
		
		model.addAttribute("name", demoService.dosomething());
		return "manage/demo_list";
	}
}