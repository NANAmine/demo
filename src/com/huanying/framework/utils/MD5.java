package com.huanying.framework.utils;

import java.security.MessageDigest;

import org.apache.log4j.Logger;

import com.aliyuncs.exceptions.ClientException;

public class MD5 {
	private static Logger logger = Logger.getLogger(MD5.class);

	private static String[] hexDigits = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	/**
	* 转换字节数组为16进制字串
	* @param b
	* 字节数组
	* @return 16进制字串
	*/
	private static String byteArrayToHexString(byte[] b) {
	StringBuffer resultSb = new StringBuffer();
	for (int i = 0; i < b.length; i++) {
	resultSb.append(byteToHexString(b[i]));
	}
	return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
	int n = b;
	if (n < 0) n += 256;
	int d1 = n / 16;
	int d2 = n % 16;
	return hexDigits[d1] + hexDigits[d2];
	}

	public static String MD5Encode(String origin) {
	String resultString = null;
	try {
	resultString = new String(origin);
	MessageDigest md = MessageDigest.getInstance("MD5");
	resultString = byteArrayToHexString(md.digest(resultString.getBytes()));
	}
	catch (Exception ex) {
	ex.printStackTrace();
	}
	return resultString;
	}


	//测试
   public static String main(String password,String salt) throws ClientException, InterruptedException {
	MD5 md5 = new MD5();
	String password_md5 = md5.MD5Encode(password+salt);
	//System.out.println(password_md5);
	return password_md5;
	}
}



