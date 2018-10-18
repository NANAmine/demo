package com.huanying.framework.menu;

import java.util.List;

import com.huanying.framework.PageBean;

public interface MenuService {

	/**
	 * @param menu
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public void add(Menu menu) throws Exception;
	/**
	 * @param menu
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public void update(Menu menu) throws Exception;
	/**
	 * @param menu
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public void delete(Menu menu) throws Exception;
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public Menu getbyId(int id) throws Exception;
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public List<Menu> getbyRoleId(int role_id) throws Exception;
	/**
	 * @param name
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public PageBean searchMenus(String name,int level,int pageSize,int page) throws Exception;
}
