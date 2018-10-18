package com.huanying.framework.company;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	private static Logger logger = Logger.getLogger(CompanyServiceImpl.class);
	
	@Autowired
	private BaseDao dao;

	@Override
	public void add(Company company) throws Exception {
		dao.save(company);
	}

	@Override
	public void update(Company company) throws Exception {
		dao.update(company);
	}

	@Override
	public void delete(int id) throws Exception {
		List<Object> param = new ArrayList<Object>();
		String hql = "update Company set status=0 where id=?";
		param.add(id);
    	dao.exculeByParams(hql, param);
	}

	@Override
	public Company getbyId(int id) throws Exception {
		return (Company)dao.load(Company.class, id);
	}

	@Override
	public PageBean searchCompanies(Map<String,String> map, int pageSize, int page) throws Exception {
		StringBuilder hql = new StringBuilder("from Company where 1=1");
		List<Object> params = new ArrayList<Object>();
		if(map.get("name")!=null && !("").equals(map.get("name"))){
			hql.append(" and name like ?");
			params.add("%"+map.get("name")+"%");
		}
		if(map.get("code")!=null && map.get("code")!=""){
			hql.append(" and code like ?");
			params.add("%"+map.get("code")+"%");
		}
		if(map.get("level_code")!=null && !("").equals(map.get("level_code"))){
			hql.append(" and level_code like ?");
			params.add("%"+map.get("level_code")+"%");
		}
		if(map.get("address")!=null && !("").equals(map.get("address"))){
			hql.append(" and address like ?");
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
