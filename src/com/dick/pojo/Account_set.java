package com.dick.pojo;
/**
 * 账套表
 * @author 30541
 *
 */
public class Account_set {
	private String companyName;//账套的公司名
	private String periods;//期数
	private Boolean isSettleAccounts;//是够结账
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getPeriods() {
		return periods;
	}
	public void setPeriods(String periods) {
		this.periods = periods;
	}
	public Boolean getIsSettleAccounts() {
		return isSettleAccounts;
	}
	public void setIsSettleAccounts(Boolean isSettleAccounts) {
		this.isSettleAccounts = isSettleAccounts;
	}
	
}
