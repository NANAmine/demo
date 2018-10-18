package com.huanying.risk.content;

import java.util.Map;

import com.huanying.framework.PageBean;

/**
 *<p></p>
 * @author Alan Yu
 * @date 2016年12月16日
 */
public interface ContentService {
	
	/**
	 * @param content
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void add(Content content) throws Exception;
	
	/**
	 * @param content
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void add_file(Upload_File file) throws Exception;
	
	/**
	 * @param content
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void update(Content content) throws Exception;
	
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
	public Content getbyId(int id) throws Exception;
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public Province getProvincebyId(int id) throws Exception;
	
	/**
	 * @param map
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
	public PageBean searchContent(Map<String,String> map,int pageSize,int page) throws Exception;
	
	/**
	 * @param map
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
	public PageBean searchProvince(Map<String,String> map,int pageSize,int page) throws Exception;
	
	/**
	 * @param map
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
    public PageBean searchKeyword(Map<String,String> map,int pageSize,int page) throws Exception;
	
	/**
	 * @param map
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
	public PageBean searchCountry(Map<String, String> map, int pageSize, int page) throws Exception;
	
	/**
	 * @param map
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
	public PageBean searchFile(Map<String,String> map,int pageSize,int page) throws Exception;
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public Upload_File getFilebyId(int id) throws Exception;
	
	/**
	 * @param map
	 * @param pageSize
	 * @param page
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2017年2月8日
	 */
	public void deleteFile(int id) throws Exception;

	public	PageBean searchProvinceContent(Map<String, String> map, int pageSize, int page) throws Exception;

	public PageBean searchCountryContent(Map<String, String> map, int pageSize, int page) throws Exception;
public void add_new(News news) throws Exception;
	
	/**
	 * @param content
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void update_new(News news) throws Exception;
	
	/**
	 * @param id
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public void delete_new(int id) throws Exception;
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	//public News getnewbyId(int id) throws Exception;
	
	/**
	 * @param id
	 * @return
	 * @throws Exception
	 * @author Alan Yu
	 * @date 2016年12月16日
	 */
	public PageBean searchNews(Map<String, String> map, int pageSize, int page) throws Exception;

	public News getnewbyId(String id) throws Exception;

}
