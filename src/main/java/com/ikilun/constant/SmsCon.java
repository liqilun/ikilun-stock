package com.ikilun.constant;

public class SmsCon {
	public static String getRegCoach(String coach, String gymName, String password){
		return coach+"您好欢迎加入" + gymName+"本机手机号为您的登录账号，初始密码：" + password;
	}

	public static String getRegGymUser(String gymName, String password){
		return gymName+"欢迎加盟鲸健身平台，本机手机号为您的登录账号，初始密码：" + password;
	}
	public static String getZipPass(String zipPass){
		return zipPass+"，五分钟内有效";
	}
	public static String getRegMember(String code){
		return code+"，五分钟内有效";
	}
	public static String getMemberFindPass(String code){
		return code+"，五分钟内有效";
	}
	public static String getCoachFindPass(String code){
		return code+"，五分钟内有效";
	}
}
