package com.dick.common;

public class VoucherFixed {
	private Integer fvoucher_id;
	private String fcreateTime;
	private String fperiods;
	private Integer fbills;//单据数量
	private String fformMaker;//制单人
	private Float fsumDebit;//借方金额总计
	private Float fsumCreditor;//贷方金额总计
	public Integer getFvoucher_id() {
		return fvoucher_id;
	}
	public void setFvoucher_id(Integer fvoucher_id) {
		this.fvoucher_id = fvoucher_id;
	}
	public String getFcreateTime() {
		return fcreateTime;
	}
	public void setFcreateTime(String fcreateTime) {
		this.fcreateTime = fcreateTime;
	}
	public String getFperiods() {
		return fperiods;
	}
	public void setFperiods(String fperiods) {
		this.fperiods = fperiods;
	}
	public Integer getFbills() {
		return fbills;
	}
	public void setFbills(Integer fbills) {
		if(fbills == null){
			this.fbills = 0;
		}else{
			this.fbills = fbills;
		}
		
	}
	public String getFformMaker() {
		return fformMaker;
	}
	public void setFformMaker(String fformMaker) {
		this.fformMaker = fformMaker;
	}
	public Float getFsumDebit() {
		return fsumDebit;
	}
	public void setFsumDebit(Float fsumDebit) {
		this.fsumDebit = fsumDebit;
	}
	public Float getFsumCreditor() {
		return fsumCreditor;
	}
	public void setFsumCreditor(Float fsumCreditor) {
		this.fsumCreditor = fsumCreditor;
	}
	
	
}
