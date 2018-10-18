package com.huanying.framework.menu;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;

@Service
public class MenuServiceImpl implements MenuService {

	private static Logger logger = Logger.getLogger(MenuServiceImpl.class);
	
	@Autowired
	private BaseDao dao;

	@Override
	public void add(Menu company) throws Exception {
		dao.save(company);
	}

	@Override
	public void update(Menu company) throws Exception {
		dao.update(company);
	}

	@Override
	public void delete(Menu company) throws Exception {
		dao.delete(company);
	}
	
	//通过ID查询menu
	@Override
	public Menu getbyId(int id) throws Exception {
		String hql = "from Menu m left join fetch m.previous_menu p where m.status=1 and m.id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		return (Menu)dao.exculeHqlGetOjbectByParams(hql,params);
	}

	//通过name、level查询多条menu，并填充到pageBean中
	@Override
	public PageBean searchMenus(String name,int level, int pageSize, int page) throws Exception {
		StringBuilder hql = new StringBuilder("from Menu m left join fetch m.previous_menu p where m.status=1");
		List<Object> params = new ArrayList<Object>();
		if(name!=null && !("").equals(name)){
			hql.append(" and m.name like ?");
			params.add("%"+name+"%");
		}
		if(level!=0){
			hql.append(" and m.level = ?");
			params.add(level);
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
	public List<Menu> getbyRoleId(int role_id) throws Exception {
		String hql = "from Menu m where m.status=1 and m.id in (select rm.menu_id from Role_Menu rm where rm.status=1 and rm.role_id=?)";
		List<Object> params = new ArrayList<Object>();
		params.add(role_id);
		List<Menu> l = dao.exculeHqlByParams(hql, params);
		return l;
	}
}
