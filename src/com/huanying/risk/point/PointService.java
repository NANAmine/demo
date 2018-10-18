package com.huanying.risk.point;

import java.util.Map;

import com.huanying.framework.PageBean;

/**
 *<p></p>
 * @author Alan Yu
 * @date 2016年12月16日
 */
public interface PointService {
	
	/**
	 * @param point
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void add(Risk_Point point) throws Exception;
	
	/**
	 * @param point
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void update(Risk_Point point) throws Exception;
	
	/**
	 * @param id
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
	public Risk_Point getbyId(int id) throws Exception;
	
	/**
	 * @param name
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
	public PageBean searchPoints(Map<String,String> map,int pageSize,int page) throws Exception;

}
