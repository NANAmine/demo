package com.huanying.framework;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDao {
	/**
	 * @Autowired 自动装配 相当于get() set()
	 */
	@Autowired
	protected SessionFactory sessionFactory;
	
	@Autowired
	protected JdbcTemplate jdbcTemplate;

	/**
	 * gerCurrentSession 会自动关闭session，使用的是当前的session事务
	 * @return
	 */
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * openSession 需要手动关闭session 意思是打开一个新的session
	 * @return
	 */
	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	public void flush() {
		getSession().flush();
	}

	public void clear() {
		getSession().clear();
	}
	
	/**
	 * 获取所有信息
	 * 
	 * @param hql
	 * 
	 * @return
	 */
	public List exculeHql(final String hql, final Object o) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		query.setProperties(o);
		return query.list();
	}
	
	public List exculeHqlByParams(final String hql,final List<Object> params) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		if(params != null){
			for(int i=0;i<params.size();i++){
				query.setParameter(i, params.get(i));
			}
		}
		return query.list();
	}
	
	public List exculeHqlByParamslines(final String hql,final List<Object> params) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		if(params != null){
			for(int i=0;i<params.size();i++){
				query.setParameter(i, params.get(i));
			}
		}
		query.setFirstResult(0);
		query.setMaxResults(5);
		return query.list();
	}

	public Object exculeHqlGetOjbectByParams(final String hql, final List<Object> params) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		if(params != null){
			for(int i=0;i<params.size();i++){
				query.setParameter(i, params.get(i));
			}
		}
		return query.list().get(0);
	}
	
	public int excule(final String hql, final Object o) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		query.setProperties(o);
		return query.executeUpdate();
	}
	
	public int exculeByParams(final String hql,final List<Object> params) {
		Session session = getSession();
		Query query = session.createQuery(hql);
		if(params != null){
			for(int i=0;i<params.size();i++){
				query.setParameter(i, params.get(i));
			}
		}
		return query.executeUpdate();
	}

	/**
	 * 根据 id 查询信息
	 * @param id
	 * @return
	 */
	public Object load(Class<?> c, int id) {
		Session session = getSession();
		return session.get(c, id);
	}

	/**
	 * 保存
	 * @param bean
	 */
	public Object save(Object bean) throws Exception {
		Session session = getSession();
		session.save(bean);
		
		return bean;
	}
	public Object merge(Object bean) throws Exception {
		Session session = getNewSession();
		session.merge(bean);
		session.flush();
		session.clear();
		session.close();
		return bean;
	}
	/**
	 * 更新
	 * @param bean
	 */
	public void update(Object bean) {
		Session session = getSession();
		
		session.update(bean);
		
	}

	/**
	 * 删除
	 * @param bean
	 */
	public void delete(Object bean) {
		Session session = getSession();
		session.delete(bean);
		session.flush();
		session.clear();
		session.close();
	}

	/**
	 * 根据ID删除
	 * @param c   类
	 * @param id  ID
	 */
	public void delete(Class<?> c, int id) {
		Session session = getSession();
		Object obj = session.get(c, id);
		session.delete(obj);
		flush();
		clear();
	}

	/**
	 * 批量删除
	 * @param c  类
	 * @param ids ID 集合
	 */
	public void delete(Class<?> c, String[] ids) {
		for (String id : ids) {
			Object obj = getSession().get(c, id);
			if (obj != null) {
				getSession().delete(obj);
			}
		}
	}
	
	 
	 /**
	  * 分页查询带查询条件
	  * @param hql 查询sql
	  * @param Ojbect()[] 条件数组
	  * @param offset 开始记录
	  * @param length 一次查询几条记录
	  * @return
	  */
	public List<Object> queryForPageAndParams(final String hql,final List<Object> params,final int offset,final int length) throws Exception{
		List<Object> list=null;
		Query query=getSession().createQuery(hql);
		if(params != null){
			for(int i=0;i<params.size();i++){
					query.setParameter(i, params.get(i));
			}
		}
		query.setFirstResult(offset);
        query.setMaxResults(length);
        list = query.list();
		return list;
	}
	
	/**
	  * 查询所有记录数(配合分页查询使用)
	  * @return 总记录数
	  */
	 public int queryAllRowCount(final String hql,final List<Object> params) throws Exception{ 
			List list=null;
			try{
				Query query=getSession().createQuery(hql);
				if(params != null){
					for(int i=0;i<params.size();i++){
						query.setParameter(i, params.get(i));
					}
				}
				list = query.list(); 
				
			}catch(RuntimeException re){
				throw re;
			}
			return list.size(); 
	 }
	 
	 /**
	  * 分页查询带查询条件
	  * @param hql 查询sql
	  * @param Ojbect()[] 条件数组
	  * @param offset 开始记录
	  * @param length 一次查询几条记录
	  * @return
	  */
	public List<Object> queryForPage_jdbc(final String hql,final List<Object> params,final int offset,final int length) throws Exception{
		List<Object> list=null;
		Query query=getSession().createQuery(hql);
		if(params != null){
			for(int i=0;i<params.size();i++){
					query.setParameter(i, params.get(i));
			}
		}
		query.setFirstResult(offset);
        query.setMaxResults(length);
        list = query.list();
		return list;
	}
	
	 /**
	  * 分页查询带查询条件
	  * @param hql 查询sql
	  * @param Ojbect()[] 条件数组
	  * @param offset 开始记录
	  * @param length 一次查询几条记录
	  * @return
	  */
	public List<Object> queryCount_jdbc(final String hql,final List<Object> params,final int offset,final int length) throws Exception{
		List<Object> list=null;
		Query query=getSession().createQuery(hql);
		if(params != null){
			for(int i=0;i<params.size();i++){
					query.setParameter(i, params.get(i));
			}
		}
		query.setFirstResult(offset);
		query.setMaxResults(length);
		list = query.list();
		return list;
	}
}
