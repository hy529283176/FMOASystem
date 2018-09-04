package com.dick.pojo;
/**
 *会计货币
 * @author 30541
 *
 */
public class Currency {
	private Integer currency_id;//货币ID
	private String currency_name;//货币币种的名字
	private Float exchangeRate;//汇率
	private Boolean enStatus;//是否启用
	
	
	public Integer getCurrency_id() {
		return currency_id;
	}
	public void setCurrency_id(Integer currency_id) {
		this.currency_id = currency_id;
	}
	public String getCurrency_name() {
		return currency_name;
	}
	public void setCurrency_name(String currency_name) {
		this.currency_name = currency_name;
	}
	public Float getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(Float exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public Boolean isEnStatus() {
		return enStatus;
	}
	public void setEnStatus(Boolean enStatus) {
		this.enStatus = enStatus;
	}
	
}
