package com.huanying.framework.user;

import com.huanying.framework.PageBean;

public interface UserService {
	
	public void add(User user) throws Exception;
	
	public void update(User user) throws Exception;
	
	public void delete(User user) throws Exception;
	
	public User getbyId(int id) throws Exception;
	
	public User findUser(User user) throws Exception;
	
	public PageBean searchUsers(String name,int pageSize,int page) throws Exception;
}
