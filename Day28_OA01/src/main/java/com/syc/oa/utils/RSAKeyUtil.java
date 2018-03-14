package com.syc.oa.utils;

import java.io.IOException;
import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.HashMap;
import java.util.Map;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * 创建密钥对的工具类.
 */
@SuppressWarnings("restriction")
public class RSAKeyUtil {
	
	// 非对称加密算法包含RSA算法.
	private static final String KEY_ALGORITHM = "RSA";
	// private static final String KEY_AIGO="MD5WithRSA";

	// 获取公钥的key
	public static final String PUBLICKEY = "RSAPublicKey";
	// 获取私钥的key
	public static final String PRIVATEKEY = "RSAPirvateKey";

	// 创建密钥对
	public static Map<String, Object> initKey() {
		Map<String, Object> map = new HashMap<String, Object>(2);
		try {
			// 生成指定算法的密钥对
			// 获取密钥对生成器
			KeyPairGenerator generator = KeyPairGenerator.getInstance(KEY_ALGORITHM);
			// 限定生成的密钥的长度为1024,最低是512.
			generator.initialize(1024);
			// 生成密钥对
			KeyPair keyPair = generator.generateKeyPair();
			// 得到公钥
			PublicKey publicKey = keyPair.getPublic();
			// 得到私钥
			PrivateKey privateKey = keyPair.getPrivate();

			// 将公钥与私钥存储到集合中
			map.put(PUBLICKEY, publicKey);
			map.put(PRIVATEKEY, privateKey);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return map;
	}

	// 利用Base64编码进行加密的方法
	public static String encryptBase64(byte[] key) {
		BASE64Encoder encoder = new BASE64Encoder();
		return encoder.encodeBuffer(key);
	}

	// 利用Base64编码进行解密的方法
	public static byte[] decryptBase64(String key) {
		try {
			BASE64Decoder decoder = new BASE64Decoder();
			return decoder.decodeBuffer(key);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		
		Map<String, Object> map = initKey();
		
		//从集合中获取公钥
		Key pubKey= (Key) map.get(PUBLICKEY);
		Key priKey= (Key) map.get(PRIVATEKEY);
		
		//进过base64重新编码后得到的公钥
		String pub = encryptBase64(pubKey.getEncoded());
		//进过base64重新编码后得到的私钥
		String pri = encryptBase64(priKey.getEncoded());
		System.out.println("公钥="+pub);
		System.out.println("私钥="+pri);
	}
}
