package com.huanying.risk.point;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;

@Service
public class PointServiceImpl implements PointService {
	
	private static Logger logger = Logger.getLogger(PointServiceImpl.class);
	
	@Autowired
	private BaseDao dao;

	@Override
	public void add(Risk_Point point) throws Exception {
		dao.save(point);
	}

	@Override
	public void update(Risk_Point point) throws Exception {
		dao.update(point);
	}

	@Override
	public void delete(int id) throws Exception {
		List<Object> param = new ArrayList<Object>();
		String hql = "update Risk_Point set status=0 where id=?";
		param.add(id);
    	dao.exculeByParams(hql, param);
	}

	@Override
	public Risk_Point getbyId(int id) throws Exception {
		return (Risk_Point)dao.load(Risk_Point.class, id);
	}

	@Override
	public PageBean searchPoints(Map<String,String> map, int pageSize, int page) throws Exception {
		StringBuilder hql = new StringBuilder("from Risk_Point where status=1");
		List<Object> params = new ArrayList<Object>();
		if(map.get("name")!=null && !("").equals(map.get("name"))){
			hql.append(" and name like ?");
			params.add("%"+map.get("name")+"%");
		}
		if(map.get("source_id")!=null && !("").equals(map.get("source_id"))){
			hql.append(" and source.id = ?");
			params.add(map.get("source_id"));
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
