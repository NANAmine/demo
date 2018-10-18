package com.huanying.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;

@Service
public class DemoServiceImpl implements DemoService {
	@Autowired
	private BaseDao dao;
	
	@Override
	public String dosomething() {
//		UserInfoBean u = new UserInfoBean();
//		u.setId("1");
//		u.setEmail("fdsfds@gag.com");
//		try {
//			dao.save(u);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return "fromService";
		return null;
	}

}
