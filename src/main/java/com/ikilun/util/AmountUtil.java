package com.ikilun.util;

import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;

public class AmountUtil {

	/**
	 * 将字符金额转化成分
	 * @param amout 金额，元，切记是元
	 * @return 返回分，整形
	 * @author leo
	 * @addTime 2016年6月24日下午1:58:05
	 */
	public static int toFen(String amout){
		if(StringUtils.isBlank(amout)){
			throw new IllegalArgumentException("amout is must");
		}
		int fee = Math.round(Float.valueOf(amout) * 100);
		return fee;
	}
	
	/**
	 * 将字符金额转化成分
	 * @param amout 金额，元，切记是元
	 * @return 返回分，整形
	 * @author leo
	 * @addTime 2016年6月24日下午1:58:05
	 */
	public static int toFen(Double amout){
		if(amout == null){
			throw new IllegalArgumentException("amout is must");
		}
		int fee = Long.valueOf(Math.round(amout * 100)).intValue();
		return fee;
	}

	/**
	 * 将分为单位的转换为元 （除100）
	 *
	 * @param amount
	 * @return
	 * @throws Exception
	 */
	public static String changeF2Y(Integer amount){
		if(amount == null) {
			throw new IllegalArgumentException("amout is must");
		}
		BigDecimal yuan = BigDecimal.valueOf(Long.valueOf(amount)).divide(new BigDecimal(100),2,BigDecimal.ROUND_DOWN);
		return yuan.toString();
	}


	public static void main(String[] args) {
		for(int i = 0; i < 100; i++){
			String amout = "19." + StringUtils.leftPad(i + "", 2, "0");
			System.out.println(amout + "===" + AmountUtil.toFen(amout));
		}
		System.out.println("===================================================================================");
		for(int i = 0; i < 100; i++){
			String amoutstr = "19." + StringUtils.leftPad(i + "", 2, "0");
			Double amout = new Double(amoutstr);
			System.out.println(amout + "===" + AmountUtil.toFen(amout));
		}
		System.out.println("===================================================================================");
		for(int i = 0; i < 199; i++){
			Integer amout = i;
			String yuan = AmountUtil.changeF2Y(amout);
			Integer fee = AmountUtil.toFen(yuan);
			System.out.println(amout + "===" + yuan + "==" + fee);
			if( !amout.equals(fee)){
				System.err.println(amout + "!=" + yuan + "!=" + fee);
			}
		}
		
	}
}
