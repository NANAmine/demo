package com.huanying.framework.parameter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huanying.framework.BaseDao;

@Service
public class ParameterServiceImpl implements ParameterService {
	@Autowired
	private BaseDao dao;
	
	@Override
	public void intParamObject() throws Exception {
		//if(Parameter.getPara_object() == null){
			String hql = "from Parameter where status=1";
			List param_list = dao.exculeHqlByParams(hql, null);
			String type_str;
			Parameter param_obj;
			List l = new ArrayList();
			Map paramObject;
			for(int j=0;j<param_list.size();j++){
				param_obj = (Parameter)param_list.get(j);
				paramObject = new HashMap();
				paramObject.put("value", param_obj.getPara_value());
				paramObject.put("name",param_obj.getPara_name());
				paramObject.put("type", param_obj.getPara_type_code());
				l.add(paramObject);
			}
			Parameter.setPara_object(l);
		//}
	}
	
	@Override
	public Map<String,String> findParamsByType(String para_type_code) throws Exception {
		return null;
	}


	@Override
	public String getParamValueByName(String para_name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getParamNameByValue(String para_value) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
