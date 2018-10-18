package com.huanying.framework.utils;

import com.danga.MemCached.MemCachedClient;
import com.danga.MemCached.SockIOPool;

public class MemCachedManager {
	// 创建全局的唯一实例
	protected static MemCachedClient mcc = new MemCachedClient();

	protected static MemCachedManager memCached = new MemCachedManager();

	// 设置与缓存服务器的连接池
	static {
		// 服务器列表和其权重
		String[] servers = { "47.94.7.71:11211" };
		Integer[] weights = { 3 };

		// 获取socke连接池的实例对象
		SockIOPool pool = SockIOPool.getInstance();

		// 设置服务器信息
		pool.setServers(servers);
		pool.setWeights(weights);

		// 设置初始连接数、最小和最大连接数以及最大处理时间
		pool.setInitConn(5);
		pool.setMinConn(20);
		pool.setMaxConn(50);
		pool.setMaxIdle(1000 * 60 * 60 * 6);

		// 设置主线程的睡眠时间
		pool.setMaintSleep(30);

		// 设置TCP的参数，连接超时等
		pool.setNagle(false);
		pool.setSocketTO(3000);
		pool.setSocketConnectTO(0);

		// 初始化连接池
		pool.initialize();		
		
	}

	/**
	 * 保护型构造方法，不允许实例化！
	 *
	 */
	protected MemCachedManager() {

	}

	/**
	 * 获取唯一实例.
	 * 
	 * @return
	 */
	public static MemCachedManager getInstance() {
		
		return memCached;
	}

	/**
	 * 添加一个指定的值到缓存中.
	 * 
	 * @param key
	 * @param value
	 * @return
	 */
	public Boolean set(String key, Object value){
        Boolean result = Boolean.FALSE;
        try {
            result = mcc.set(key, value);
        }catch(Exception ex){
        }
        return result;
    }

    public Object get(String key){
        Object value = null;
        try {
            value = mcc.get(key);
        }catch(Exception ex){
        }
        return value;
    }
    
    public Boolean remove(String key){
    	Boolean result = Boolean.FALSE;
        try {
            result = mcc.delete(key);
        }catch(Exception ex){
        }
        return result;
    }
}