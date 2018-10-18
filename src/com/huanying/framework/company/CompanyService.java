package com.huanying.framework.company;

import java.util.Map;

import com.huanying.framework.PageBean;

/**
 *<p></p>
 * @author Alan Yu
 * @date 2016年12月16日
 */
public interface CompanyService {
	
	/**
	 * @param company
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void add(Company company) throws Exception;
	
	/**
	 * @param company
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void update(Company company) throws Exception;
	
	/**
	 * @param company
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void delete(int id) throws Exception;
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public Company getbyId(int id) throws Exception;
	
	/**
	 * @param name
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
	public PageBean searchCompanies(Map<String,String> map,int pageSize,int page) throws Exception;

}
