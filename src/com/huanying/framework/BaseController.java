package com.huanying.framework;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;

public class BaseController {
	private static Logger logger = Logger.getLogger(BaseController.class);
	
	@Autowired    
	private HttpSession session;
	
	@Autowired    
	private HttpServletRequest request;
	
	@Autowired    
	private HttpServletResponse response;
	
	private final int pageSize = 10; 
	

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	@ExceptionHandler
	public String exception(Exception e) {
		StringBuilder sb = new StringBuilder();
		sb.append("");
	    //添加自己的异常处理逻辑，如日志记录　　　
		logger.error(e.getMessage(),e);
	      
	    // 根据不同的异常类型进行不同处理
	    if(e instanceof SQLException) 
	      return "error";   
	    else
	      return "error";  
	  }  
}
