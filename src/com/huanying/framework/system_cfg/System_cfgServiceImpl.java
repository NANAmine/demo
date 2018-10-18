package com.huanying.framework.system_cfg;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;
import com.huanying.framework.PageBean;

@Service
public class System_cfgServiceImpl implements System_cfgService {
	
	private static Logger logger = Logger.getLogger(System_cfgServiceImpl.class);
	
	@Autowired
	private BaseDao dao;
	
	@Override
	public void add(System_cfg system_cfg) throws Exception {
		dao.save(system_cfg);
	}

	@Override
	public void update(System_cfg system_cfg) throws Exception {
		dao.update(system_cfg);
	}

	@Override
	public void delete(System_cfg system_cfg) throws Exception {
		dao.delete(system_cfg);
	}

	@Override
	public System_cfg getbyId(int id) throws Exception {
		return (System_cfg)dao.load(System_cfg.class, id);
	}

	@Override
	public PageBean searchSystem_cfgs(Map<String, String> map, int pageSize, int page) throws Exception {
		StringBuilder hql = new StringBuilder("from System_cfg where 1=1");
		List<Object> params = new ArrayList<Object>();
		if(map.get("cn_name")!=null && !("").equals(map.get("cn_name"))){
			hql.append(" and cn_name like ?");
			params.add("%"+map.get("cn_name")+"%");
		}
		if(map.get("en_name")!=null && !("").equals(map.get("en_name"))){
			hql.append(" and en_name like ?");
			params.add("%"+map.get("en_name")+"%");
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
	public List<Object> searchSystem_cfgs(Map<String, String> map) throws Exception {
		StringBuilder hql = new StringBuilder("from System_cfg where 1=1");
		List<Object> params = new ArrayList<Object>();
		if(map.get("cn_name")!=null && !("").equals(map.get("cn_name"))){
			hql.append(" and cn_name like ?");
			params.add("%"+map.get("cn_name")+"%");
		}
		if(map.get("en_name")!=null && !("").equals(map.get("en_name"))){
			hql.append(" and en_name like ?");
			params.add("%"+map.get("en_name")+"%");
		}		
	    List<Object> list = dao.exculeHqlByParams(hql.toString(), params);
	    return list;
	}

	
	public System_cfg getbycn_name(String cn_name) throws Exception {
		StringBuilder hql = new StringBuilder("from System_cfg where 1=1");
		List<Object> params = new ArrayList<Object>();
		hql.append(" and cn_name = ?");
		params.add(cn_name);				
	    List<Object> list = dao.exculeHqlByParams(hql.toString(), params);
	    if(list.size() != 0){
	    	return (System_cfg) list.get(0);	
	    }else{
	    	return null;
	    }	    
	}
	
	
}
