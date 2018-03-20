package com.ikilun.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
//日期	股票代码	名称	收盘价	最高价	最低价	开盘价	前收盘	涨跌额	涨跌幅	换手率	成交量	成交金额
//2018/3/19	'000001	平安银行	11.83	11.84	11.61	11.66	11.64	0.19	1.6323	0.4779	80853872	947664744.4
//平台管理员
@Entity
public class Stock extends BaseObject {
	private static final long serialVersionUID = -2829814025469479479L;
	@Id@Column(name="ukey")
	private String ukey;
	//股票代码
	private String scode;
	//日期
	private Date date;
	//收盘价
	private Double spj;
	//最高价
	private Double zgj;
	//最低价
	private Double zdj;
	//开盘价
	private Double kpj;
	//前收盘
	private Double qspj;
	//涨跌额
	private Double zde;
	//涨跌幅
	private Double zdf;
	//换手率
	private Double hsl;
	//成交量
	private Double cjl;
	//成交金额
	private Double cjje;

	public String getUkey() {
		return ukey;
	}

	public void setUkey(String ukey) {
		this.ukey = ukey;
	}

	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getSpj() {
		return spj;
	}

	public void setSpj(Double spj) {
		this.spj = spj;
	}

	public Double getZgj() {
		return zgj;
	}

	public void setZgj(Double zgj) {
		this.zgj = zgj;
	}

	public Double getZdj() {
		return zdj;
	}

	public void setZdj(Double zdj) {
		this.zdj = zdj;
	}

	public Double getKpj() {
		return kpj;
	}

	public void setKpj(Double kpj) {
		this.kpj = kpj;
	}

	public Double getQspj() {
		return qspj;
	}

	public void setQspj(Double qspj) {
		this.qspj = qspj;
	}

	public Double getZde() {
		return zde;
	}

	public void setZde(Double zde) {
		this.zde = zde;
	}

	public Double getZdf() {
		return zdf;
	}

	public void setZdf(Double zdf) {
		this.zdf = zdf;
	}

	public Double getHsl() {
		return hsl;
	}

	public void setHsl(Double hsl) {
		this.hsl = hsl;
	}

	public Double getCjl() {
		return cjl;
	}

	public void setCjl(Double cjl) {
		this.cjl = cjl;
	}

	public Double getCjje() {
		return cjje;
	}

	public void setCjje(Double cjje) {
		this.cjje = cjje;
	}

	public Stock() {
	}

	@Override
	public Serializable realId() {
		return ukey;
	}


}
