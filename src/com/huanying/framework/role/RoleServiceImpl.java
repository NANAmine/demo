package com.huanying.framework.role;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private BaseDao dao;
	
	private static Logger logger = Logger.getLogger(RoleServiceImpl.class);

	@Override
	public void add(Role role,String[] menuid_array) throws Exception {
		//新增角色表
		dao.save(role);
		//增加角色——菜单关联表
		Role_Menu role_menu = new Role_Menu();
		role_menu.setRole_id(role.getId());
		role_menu.setStatus(1);
		for (int i = 0; i < menuid_array.length; i++) {
			role_menu.setMenu_id(Integer.valueOf(menuid_array[i]));
			dao.save(role_menu);
		}
	}
	
	@Override
	public void deleteOld(Role role) throws Exception{
		//删除旧关联
		String hql="delete Role_Menu where role_id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(role.getId());
		dao.exculeByParams(hql, params);
	}
	@Override
	public void update(Role role,String[] menuid_array) throws Exception {			
		//修改角色表
		dao.update(role);
		//增加新关联
		Role_Menu role_menu = new Role_Menu();
		role_menu.setRole_id(role.getId());
		role_menu.setStatus(1);
		for (int i = 0; i < menuid_array.length; i++) {
			role_menu.setMenu_id(Integer.valueOf(menuid_array[i]));
			dao.save(role_menu);
		}
	}

	@Override
	public void delete(int id) throws Exception {
		List<Object> param=new ArrayList<Object>();
		String hql="update Role set status=0 where id=?";
		param.add(id);
		dao.exculeByParams(hql, param);
	}

	@Override
	public Role getbyId(int id) throws Exception {
		return (Role)dao.load(Role.class, id);
	}

	@Override
	public PageBean searchRoles(String name, int pageSize, int page) throws Exception {
		StringBuilder hql = new StringBuilder("from Role where 1=1");
		List<Object> params = new ArrayList<Object>();
		if(name!=null && !("").equals(name)){
			hql.append(" and name like ?");
			params.add("%"+name+"%");
		}
		
		
		int allRow = dao.queryAllRowCount(hql.toString(), params);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
	    final int currentPage = PageBean.countCurrentPage(page);
	    List<Object> list = dao.queryForPageAndParams(hql.toString(), params, offset, pageSize);
	    
	    //把分页信息保存到Bean中
        PageBean pageBean = new PageBean();
        pageBean.setPageSize(pageSize);    
        pageBean.setCurrentPage(currentPage);
        pageBean.setAllRow(allRow);
        pageBean.setTotalPage(totalPage);
        pageBean.setList(list);
        pageBean.init();
		
		return pageBean;
	}

	@Override
	public void add_role_menu(Role_Menu role_menu) throws Exception {
		dao.save(role_menu);
	}

	@Override
	public void delete_role_menu(int role_id, int status) throws Exception {
		String hql = "update Role_Menu set status=? where role_id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(status);
		params.add(role_id);
		dao.exculeByParams(hql, params);
	}

	@Override
	public void add_role(Role role) throws Exception {
		// TODO Auto-generated method stub
		dao.save(role);
	}

	@Override
	public void update_role(Role role) throws Exception {
		// TODO Auto-generated method stub
		dao.update(role);
	}

	

}
