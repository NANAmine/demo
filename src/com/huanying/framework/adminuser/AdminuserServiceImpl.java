package com.huanying.framework.adminuser;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;


@Service
public class AdminuserServiceImpl implements AdminuserService{
	@Autowired
	private BaseDao dao;
	
	@Override
	public void add(Adminuser user) throws Exception {
		// TODO Auto-generated method stub
		dao.save(user);
	}

	@Override
	public void update(Adminuser user) throws Exception {
		// TODO Auto-generated method stub
		dao.update(user);
	}

	@Override
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		List<Object> param = new ArrayList<Object>();
		String hql = "update Adminuser  set status=0 where id=?";
		param.add(id);
		dao.exculeByParams(hql, param);
	}

	@Override
	public Adminuser getbyId(int user_id) throws Exception {
		// TODO Auto-generated method stub
		return (Adminuser)dao.load(Adminuser.class, user_id);
	}

	@Override
	public PageBean searchUser(Map<String, Object> map, int pageSize, int page) throws Exception {
		StringBuffer hql = new StringBuffer("from Adminuser where 1=1");
		List<Object> param = new ArrayList<Object>();
		if (map.get("name") != "" && map.get("name") != null) {
			hql.append(" and name like ?");
			param.add("%" + map.get("name") + "%");
		}
		if (map.get("role") != "" && map.get("role") != null) {
			hql.append(" and role=?");
			param.add(Integer.parseInt((String)map.get("role")));
		}
		int allRow = dao.queryAllRowCount(hql.toString(), param);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int currentPage = PageBean.countCurrentPage(page);
		List<Object> list = dao.queryForPageAndParams(hql.toString(), param, offset, pageSize);

		// 把分页信息保存到Bean中
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
	public Adminuser checkuser(String name) throws Exception {
		// TODO Auto-generated method stub
		String hql="from Adminuser where phone=? and status=1";
		List<Object> param = new ArrayList<Object>();
		param.add(name);
		Adminuser user=null;
		if((dao.queryAllRowCount(hql, param))!=0)
		{
			user=(Adminuser)dao.exculeHqlGetOjbectByParams(hql, param);
		}
		else{
			user=null;
		}
		return user;
	}

}
