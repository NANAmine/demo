package com.huanying.framework.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private BaseDao dao;
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public User findUser(User user) throws Exception {
		User user_obj=null;
		String hql="from User where login_name=:login_name and password=:password";
		List list = dao.exculeHql(hql,user);
		if(list!=null && list.size()>0){
			user_obj = (User)list.get(0);
		}
		return user_obj;
	}

	@Override
	public void add(User user) throws Exception {
		dao.save(user);
	}

	@Override
	public void update(User user) throws Exception {
		dao.update(user);
	}

	@Override
	public void delete(User user) throws Exception {
		dao.delete(user);
	}

	@Override
	public User getbyId(int id) throws Exception {
		return (User)dao.load(User.class, id);
	}

	@Override
	public PageBean searchUsers(String name, int pageSize, int page) throws Exception {
		StringBuilder hql = new StringBuilder("from User where status=1");
		List<Object> params = new ArrayList<Object>();
		if(name!=null && !("").equals(name)){
			hql.append(" and login_name like ?");
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

}
