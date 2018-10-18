package com.huanying.framework.system_cfg;

import java.util.List;
import java.util.Map;

import com.huanying.framework.PageBean;

/**
 *<p></p>
 * @author Alan Yu
 * @date 2016年12月16日
 */
public interface System_cfgService {

	public void add(System_cfg system_cfg) throws Exception;
	
	public void update(System_cfg system_cfg) throws Exception;
	
	public void delete(System_cfg system_cfg) throws Exception;
	
	public System_cfg getbyId(int id) throws Exception;
	
	public System_cfg getbycn_name(String cn_name) throws Exception;
	
	public PageBean searchSystem_cfgs(Map<String, String> map,int pageSize,int page) throws Exception;

	public List<Object> searchSystem_cfgs(Map<String, String> map) throws Exception;
	

}
