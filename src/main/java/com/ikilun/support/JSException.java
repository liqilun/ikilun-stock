package com.ikilun.support;

public class JSException extends Exception {
	private static final long serialVersionUID = 2655277597799028091L;
	private String msg;
	private String code;
	public JSException(String code, String msg){
		super(msg);
		this.code = code;
		this.msg = msg;
	}
	public JSException(String msg){
		this("9999", msg);
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}
