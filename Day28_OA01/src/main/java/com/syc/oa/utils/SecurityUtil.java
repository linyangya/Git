package com.syc.oa.utils;

import com.alibaba.druid.filter.config.ConfigTools;

/*
 * 利用私钥对明文进行加密的工具类
 */
public class SecurityUtil {

	// 私钥.此处私钥用来进行加密.
	private static final String PRIVATEKEY = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBALWV3J1cZp6pqvkU9xyby0hsdTn1A1II1cVL6tZxEUpGRSEdPz668wjwYyQKKO1hvJqvoeGVze72/C9iNtwDwGymKl/Q9jOgNsaoUzXaaLykwaLD8DLyOqIjN1HhZC7MNhSYAtIW6IPNh1JbkIFJEPT2+vxq280Y3JhLKFM7AfJzAgMBAAECgYBXD9lM4YaaQAMnlbO9Vb0rpkS2WxESfgXwqKuZ0XBWykZO0DUIoJ3yBT+jgfOJjTjeeaMGA8tO7cCP/2kKKApTvVjMO6PK+vbYnU+VHIWw6wSEQXrEHphWut+G5puckJowuqLyOHYmmO+gZ7T0ccKZ0YtOVvxMYb1txSVAKXb0QQJBAPI6Spbnnd/pPHrPTX80Y0XGIqMMjTj8ATvFdGArreU4dwBYEZQzt75PMCeTILsaWlZ71xiQo2hDpsIZwWyotqMCQQC/6OaKPbgomq40CAjpVVErUVhJ9XoC288a2ewvUkFaTKYChxv93zgIdI7sl+Duf6SEM1h3iYa/EX4qvLI+ASHxAkEA4sznmCIoNUYaRdcidc9kgClDty0Cce+ra/62t3FOckiLS/wqAXznNz7IFNXymJ3VJhLwVGThS7fERQt+izHxRwJBAI7rfR2A33Bl2cxoG3LiFgQDnZPe29HbLz7ZApsvT/pW0N9bDY6guZMacwJiDaKwrq3Bq2XCpvYOqf5b7wZcQ5ECQQCUklMr/E+2u9MMT96yz0G7uNpWYK72kFjdCdHpFfcKtHzD8qmtx42Z/xo8UeswVPEgVO9W7gPSuZz2ViJ1CkpA";

	// msg:是待加密的明文
	public static String encryptDes(String msg) {
		// 注意:在Druid中,Druid实现加解密利用的IBM提供的算法,在这个算法中,是利用的
		// 私钥进行加密,公钥进行解密,也就是与正常的RSA算法相反.
		try {
			return ConfigTools.encrypt(PRIVATEKEY, msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String[] args) {
		//syc字符串是明文
		String encryptDes = encryptDes("ycj");
		System.out.println("密文:"+encryptDes);
	}
}
