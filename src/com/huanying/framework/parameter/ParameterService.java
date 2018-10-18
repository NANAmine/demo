package com.huanying.framework.parameter;

import java.util.Map;

public interface ParameterService {
	
	public void intParamObject() throws Exception;
	
	public Map<String,String> findParamsByType(String para_type_code) throws Exception;
	
	public String getParamValueByName(String para_name) throws Exception;
	
	public String getParamNameByValue(String para_value) throws Exception;
	
}
