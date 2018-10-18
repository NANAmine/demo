package com.huanying.framework.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

/**
 * Created on 17/6/7.
 * 短信API产品的DEMO程序,工程中包含了一个SmsDemo类，直接通过
 * 执行main函数即可体验短信产品API功能(只需要将AK替换成开通了云通信-短信产品功能的AK即可)
 * 工程依赖了2个jar包(存放在工程的libs目录下)
 * 1:aliyun-java-sdk-core.jar
 * 2:aliyun-java-sdk-dysmsapi.jar
 *
 * 备注:Demo工程编码采用UTF-8
 * 国际短信发送请勿参照此DEMO
 */
public class SmsUtility {
	
	private static Logger logger = Logger.getLogger(SmsUtility.class);

    //产品名称:云通信短信API产品,开发者无需替换
    static final String product = "Dysmsapi";
    //产品域名,开发者无需替换
    static final String domain = "dysmsapi.aliyuncs.com";

    // TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
    static final String accessKeyId = "LTAIKEpLP92keMk1";
    static final String accessKeySecret = "K0YCdPcuj3ub9dHUT2SGKpz9fM1Qxz";

    /**
     * @param phone接受短信手机号
     * @param type发送短信类型  1.注册  2.修改密码 3.验证码登录
     * @return Map{flag:0/1;code:""}   flag发送标识  0失败 1成功  code发送验证码
     * @throws ClientException
     */
    public static Map sendSms(String phone,int type) {
    	
    	int code = 0;
    	int flag = 1;
    	Map returnMap = new HashMap();
        //可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        try {
			DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
		} catch (ClientException e1) {
			logger.error("向手机"+phone+"发送短信--"+type+"--失败",e1);
			flag = 0;
			returnMap.put("flag", flag);
			returnMap.put("code", code);
			return returnMap;
		}
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象-具体描述见控制台-文档部分内容
        SendSmsRequest request = new SendSmsRequest();
        //必填:待发送手机号
        request.setPhoneNumbers(phone);
        //必填:短信签名-可在短信控制台中找到
        request.setSignName("阿里云短信测试专用");
        //必填:短信模板-可在短信控制台中找到
        switch (type) {
		case 1:
			request.setTemplateCode("SMS_112815038");
			break;
		case 2:
			request.setTemplateCode("SMS_112815037");
			break;
		case 3:
			request.setTemplateCode("SMS_112815040");
			break;
		}
        //可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
        code = 1 + (int)(Math.random() * ((999999 - 1) + 1));
        request.setTemplateParam("{\"code\":\""+code+"\"}");

        //选填-上行短信扩展码(无特殊需求用户请忽略此字段)
        //request.setSmsUpExtendCode("90997");

        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        //request.setOutId("yourOutId");

        //hint 此处可能会抛出异常，注意catch
        try {
			SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
		} catch (ServerException e) {
			logger.error("向手机--"+phone+"--发送短信--"+type+"--失败",e);
			flag = 0;
			returnMap.put("flag", flag);
			returnMap.put("code", code);
			return returnMap;
		} catch (ClientException e) {
			logger.error("向手机--"+phone+"--发送短信--"+type+"--失败",e);
			flag = 0;
			returnMap.put("flag", flag);
			returnMap.put("code", code);
			return returnMap;
		}
        
        returnMap.put("flag", flag);
        returnMap.put("code", code);
        return returnMap;
    }


    public static QuerySendDetailsResponse querySendDetails(String phone,String bizId) throws ClientException {

        //可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        //初始化acsClient,暂不支持region化
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);

        //组装请求对象
        QuerySendDetailsRequest request = new QuerySendDetailsRequest();
        //必填-号码
        request.setPhoneNumber(phone);
        //可选-流水号
        request.setBizId(bizId);
        //必填-发送日期 支持30天内记录查询，格式yyyyMMdd
        SimpleDateFormat ft = new SimpleDateFormat("yyyyMMdd");
        request.setSendDate(ft.format(new Date()));
        //必填-页大小
        request.setPageSize(10L);
        //必填-当前页码从1开始计数
        request.setCurrentPage(1L);

        //hint 此处可能会抛出异常，注意catch
        QuerySendDetailsResponse querySendDetailsResponse = acsClient.getAcsResponse(request);

        return querySendDetailsResponse;
    }

    public static void main(String[] args) throws ClientException, InterruptedException {

    	Map m = SmsUtility.sendSms("18611585837",1);
    	System.out.println(m.get("flag"));
    	System.out.println(m.get("code"));
    }
}
