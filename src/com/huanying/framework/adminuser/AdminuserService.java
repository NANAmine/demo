package com.huanying.framework.adminuser;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.huanying.framework.PageBean;


@Service
public interface AdminuserService {

	public void add(Adminuser user) throws Exception;
	
	public void update(Adminuser user) throws Exception ;
	
	public void delete(int id) throws Exception;
	
	public Adminuser getbyId(int user_id) throws Exception ;
	
	public PageBean searchUser(Map<String,Object> map,int pageSize, int page) throws Exception ;

    public Adminuser checkuser(String name) throws Exception;
}
