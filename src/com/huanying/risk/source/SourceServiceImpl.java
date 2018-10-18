package com.huanying.risk.source;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;

@Service
public class SourceServiceImpl implements SourceService {
	
	private static Logger logger = Logger.getLogger(SourceServiceImpl.class);
	
	@Autowired
	private BaseDao dao;

	@Override
	public void add(Risk_Source source) throws Exception {
		dao.save(source);
	}

	@Override
	public void update(Risk_Source source) throws Exception {
		dao.update(source);
	}

	@Override
	public void delete(int id) throws Exception {
		List<Object> param = new ArrayList<Object>();
		String hql = "update Risk_Source set status=0 where id=?";
		param.add(id);
    	dao.exculeByParams(hql, param);
	}

	@Override
	public Risk_Source getbyId(int id) throws Exception {
		return (Risk_Source)dao.load(Risk_Source.class, id);
	}

	@Override
	public PageBean searchSources(Map<String,String> map, int pageSize, int page) throws Exception {
		StringBuilder hql = new StringBuilder("from Risk_Source where status=1");
		List<Object> params = new ArrayList<Object>();
		if(map.get("name")!=null && !("").equals(map.get("name"))){
			hql.append(" and name like ?");
			params.add("%"+map.get("name")+"%");
		}
		hql.append(" order by id asc");
		
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
