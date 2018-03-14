package com.syc.oa.utils;

import java.util.Properties;

import com.alibaba.druid.filter.config.ConfigTools;
import com.alibaba.druid.util.DruidPasswordCallback;

/**
 * 利用公钥进行解密的工具类
 */
public class DBPasswordCallback extends DruidPasswordCallback {

	private static final long serialVersionUID = 1L;

	// 利用公钥进行解密
	private static final String PUBLICKEY = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC1ldydXGaeqar5FPccm8tIbHU59QNSCNXFS+rWcRFKRkUhHT8+uvMI8GMkCijtYbyar6Hhlc3u9vwvYjbcA8Bspipf0PYzoDbGqFM12mi8pMGiw/Ay8jqiIzdR4WQuzDYUmALSFuiDzYdSW5CBSRD09vr8atvNGNyYSyhTOwHycwIDAQAB";

	@Override
	public void setProperties(Properties properties) {
		super.setProperties(properties);
		String pwd = properties.getProperty("password");
		if (pwd != null) {
			try {
				//得到明文
				String decrypt = ConfigTools.decrypt(PUBLICKEY, pwd);
				//重新设置密码
				setPassword(decrypt.toCharArray());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
