package com.huanying.framework.role;

import com.huanying.framework.PageBean;

public interface RoleService {
	/**
	 * @param role
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public void add(Role role,String[] menuid_array) throws Exception;
	/**
	 * @param role
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public void update(Role role,String[] menuid_array) throws Exception;
	/**
	 * @param role
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public Role getbyId(int id) throws Exception;
	/**
	 * @param name
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public PageBean searchRoles(String name,int pageSize,int page) throws Exception;
	
	/**
	 * @param role_menu
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public void add_role_menu(Role_Menu role_menu) throws Exception;
	
	/**
	 * @param role_menu
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月13日
	 */
	public void delete_role_menu(int role_id, int status) throws Exception;//修改Role_Menu表中数据的状态
	
	public void deleteOld(Role role) throws Exception;
	public void add_role(Role role) throws Exception;//只填加role
	public void update_role(Role role) throws Exception;//只更新role
	public void delete(int id) throws Exception;//修改role的状态

}
