package com.ikilun.sec;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.RandomUtils;

public class DESUtils {
	public static final String strKey = "cFgH+Lf54mKGUQkUdUbO8SlbXsM+7HYE";
	public static void main(String[] args) throws Exception {  
      /*  byte[] key=new BASE64Decoder().decodeBuffer("cFgH+Lf54mKGUQkUdUbO8SlbXsM+7HYE");  
        byte[] keyiv = { 1, 2, 3, 4, 5, 6, 7, 8 };  */
          
       /* byte[] data="中国ABCabc123".getBytes("UTF-8");  
          
        System.out.println("ECB加密解密");  
        byte[] str3 = des3EncodeECB(key,data );  
        byte[] str4 = des3DecodeECB(key,str3);  
        System.out.println(new BASE64Encoder().encode(str3));  
        System.out.println(new String(str4, "UTF-8"));  
        System.out.println("-----------------------------");  
        System.out.println("CBC加密解密");  
        byte[] str5 = des3EncodeCBC(key, keyiv, data);  
        byte[] str6 = des3DecodeCBC(key, keyiv, str5);  
        System.out.println(new BASE64Encoder().encode(str5));  
        System.out.println(new String(str6, "UTF-8"));  */
       /* byte[] data="中国ABCabc123".getBytes("UTF-8");  
		String encode = new String(des3EncodeECB(key, data));
		String decode = new String(des3DecodeECB(key, encode.getBytes("UTF-8")));
		System.out.println(decode);*/
		
		/*String key = getRandomKey(24);
		System.out.println(key);*/
		
		String data = "ABCabc1233F";
		String encode = des3EncodeECB(strKey, data);
		System.out.println(encode);
		String decode = des3DecodeECB(strKey, encode);
		System.out.println(decode);
    }  
	 public static String des3EncodeECB(String strKey, String data) throws Exception{
		 byte[] key =  Base64.decodeBase64(strKey);
		 return Base64.encodeBase64String(des3EncodeECB(key, data.getBytes("utf-8")));
	 }
	 public static String des3DecodeECB(String strKey, String encode)  
	            throws Exception {  
		 byte[] key =  Base64.decodeBase64(strKey);
		 return new String(des3DecodeECB(key, Base64.decodeBase64(encode)), "utf-8");
	 }
    /** 
     * ECB加密,不要IV 
     * @param key 密钥 
     * @param data 明文 
     * @return Base64编码的密文 
     * @throws Exception 
     */  
    public static byte[] des3EncodeECB(byte[] key, byte[] data)  
            throws Exception {  
        Key deskey = null;  
        DESedeKeySpec spec = new DESedeKeySpec(key);  
        SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");  
        deskey = keyfactory.generateSecret(spec);  
        Cipher cipher = Cipher.getInstance("desede" + "/ECB/PKCS5Padding");  
        cipher.init(Cipher.ENCRYPT_MODE, deskey);  
        byte[] bOut = cipher.doFinal(data);  
        return bOut;  
    }  
    /** 
     * ECB解密,不要IV 
     * @param key 密钥 
     * @param data Base64编码的密文 
     * @return 明文 
     * @throws Exception 
     */  
    public static byte[] des3DecodeECB(byte[] key, byte[] data)  
            throws Exception {  
        Key deskey = null;  
        DESedeKeySpec spec = new DESedeKeySpec(key);  
        SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");  
        deskey = keyfactory.generateSecret(spec);  
        Cipher cipher = Cipher.getInstance("desede" + "/ECB/PKCS5Padding");  
        cipher.init(Cipher.DECRYPT_MODE, deskey);  
        byte[] bOut = cipher.doFinal(data);  
        return bOut;  
    }  
    /** 
     * CBC加密 
     * @param key 密钥 
     * @param keyiv IV 
     * @param data 明文 
     * @return Base64编码的密文 
     * @throws Exception 
     */  
    public static byte[] des3EncodeCBC(byte[] key, byte[] keyiv, byte[] data)  
            throws Exception {  
        Key deskey = null;  
        DESedeKeySpec spec = new DESedeKeySpec(key);  
        SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");  
        deskey = keyfactory.generateSecret(spec);  
        Cipher cipher = Cipher.getInstance("desede" + "/CBC/PKCS5Padding");  
        IvParameterSpec ips = new IvParameterSpec(keyiv);  
        cipher.init(Cipher.ENCRYPT_MODE, deskey, ips);  
        byte[] bOut = cipher.doFinal(data);  
        return bOut;  
    }  
    /** 
     * CBC解密 
     * @param key 密钥 
     * @param keyiv IV 
     * @param data Base64编码的密文 
     * @return 明文 
     * @throws Exception 
     */  
    public static byte[] des3DecodeCBC(byte[] key, byte[] keyiv, byte[] data)  
            throws Exception {  
        Key deskey = null;  
        DESedeKeySpec spec = new DESedeKeySpec(key);  
        SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");  
        deskey = keyfactory.generateSecret(spec);  
        Cipher cipher = Cipher.getInstance("desede" + "/CBC/PKCS5Padding");  
        IvParameterSpec ips = new IvParameterSpec(keyiv);  
        cipher.init(Cipher.DECRYPT_MODE, deskey, ips);  
        byte[] bOut = cipher.doFinal(data);  
        return bOut;  
    }
    public static String getRandomKey(int length){
		byte[] key = new byte[length];
		for(int i=0;i<length;i++){
			key[i] = (byte)(RandomUtils.nextInt() & 0xff);
		}
		return Base64.encodeBase64String(key); 
	}
}
