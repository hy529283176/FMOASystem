package com.dick.common;

public class VoucherDynamic {
	private Integer[] dacSub_id;//会计科目i
	private String[] zhaiyao;
	private Float[] debitMoney;
	private Float[] creditorMoney;//贷方金额
	private String[] accountSub_Name;
	
	public Integer[] getDacSub_id() {
		return dacSub_id;
	}
	public void setDacSub_id(Integer[] dacSub_id) {		
		this.dacSub_id = dacSub_id;
	}
	public String[] getZhaiyao() {
		return zhaiyao;
	}
	public void setZhaiyao(String[] zhaiyao) {
		this.zhaiyao = zhaiyao;
	}
	public Float[] getDebitMoney() {
		return debitMoney;
	}
	public void setDebitMoney(Float[] debitMoney) {
		if(debitMoney == null){
			this.debitMoney = new Float[1];
		}else{
			this.debitMoney = debitMoney;
		}	
	}
	public Float[] getCreditorMoney() {
		return creditorMoney;
	}
	public void setCreditorMoney(Float[] creditorMoney) {
		if(creditorMoney == null){
			this.creditorMoney = new Float[1];
		}else{
			this.creditorMoney = creditorMoney;
		}
	}
	public String[] getAccountSub_Name() {
		return accountSub_Name;
	}
	public void setAccountSub_Name(String[] accountSub_Name) {
		this.accountSub_Name = accountSub_Name;
	}
	
}
