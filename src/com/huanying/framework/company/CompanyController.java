package com.huanying.framework.company;

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
public class CompanyController extends BaseController {

	@Autowired
	private CompanyService companyService;
	private static Logger logger = Logger.getLogger(CompanyController.class);
	
	@RequestMapping("/show_add_company.do")
	public String index(String name,String code,String level_code,String address,String page_num,Model model) throws Exception {
		Map<String,String> map=new HashMap<String,String>();
		map.put("name", name);
		map.put("code", code);
		map.put("level_code",level_code);
		map.put("address",address);
		model.addAttribute("name", "");
		if(page_num ==null){
			page_num = "1";
		}
		PageBean pageBean = companyService.searchCompanies(map, super.getPageSize(), Integer.valueOf(page_num));
		model.addAttribute("companies", pageBean.getList());
		model.addAttribute("page",pageBean);
		model.addAttribute("name", name);
		return "company/add_company";
	}
	
	@RequestMapping(value="/add_company.do", method = RequestMethod.POST)
	@ResponseBody 
	public Map<String, String> save(@RequestBody Company company, String status) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			if(company.getId()==0){
				company.setStatus(1);
				companyService.add(company);
			}
			else{
				company.setStatus(Integer.parseInt(status));
				companyService.update(company);
			}
			map.put("flag", "1");
			map.put("id", String.valueOf(company.getId()));
		} catch (Exception e) {
			logger.error("操作机构失败",e);
			map.put("flag", "0");
		}
		return map;
	}
	
	@RequestMapping(value="/get_company.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> get_client(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Company c = companyService.getbyId(id);
			map.put("flag", "1");
			map.put("company", c);
		} catch (Exception e) {
			logger.error("查询机构失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
	@RequestMapping(value="/delete_company.do", method = RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> delete_company(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
		   companyService.delete(id);
			map.put("flag", "1");
		} catch (Exception e) {
			logger.error("查询机构失败",e);
			map.put("flag", "0");
		}
		
		return map;
	}
}
