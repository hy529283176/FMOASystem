package com.dick.pojo;
/**
 * 系统当前记账期数表，记录当前期，也就是本期的发生的借贷金额
 * @author 30541
 *
 */
public class Currentmoney {
	private String periods;//期数
	private Float currentDebit;//本期发生的借方金额
	private Float currentLender;//本期发生的贷方金额
	public String getPeriods() {
		return periods;
	}
	public void setPeriods(String periods) {
		this.periods = periods;
	}
	public Float getCurrentDebit() {
		return currentDebit;
	}
	public void setCurrentDebit(Float currentDebit) {
		this.currentDebit = currentDebit;
	}
	public Float getCurrentLender() {
		return currentLender;
	}
	public void setCurrentLender(Float currentLender) {
		this.currentLender = currentLender;
	}
	
}
