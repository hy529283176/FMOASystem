package com.dick.pojo;
/**
 * 科目表的model
 * @author 30541
 *
 */
public class AccountSub{
	private Integer acSub_id;//科目编号
	private String acSub_name;//科目名称
	private String acSub_classes;//科目类别
	private String acSub_property;//科目性质
	private String balanceDirection;//余额方向
	private Float initDebitRemaining;//期初借方余额
	private Integer initDebitQuantity;//期初借方数量，启用数量核算时存储
	private Float initDebitPrice;//期初借方价格
	private Float initLenderRemaining;//期初贷方余额
	private Integer initLenderQuantity;//期初贷方数量
	private Float initLenderPrice;//期初贷方价格
	private Float yearSumDebit;//本年累计借方金额
	private Integer yearDebitQuantity;//本年累计借方数量
	private Float yearDebitPrice;//本年累计借方价格
	private Float yearSumLender;//本年累计贷方金额
	private Integer yearLenderQuantity;//本年累计贷方数量
	private Float yearLenderPrice;//本年累计贷方价格
	private Float endDebitBalance;//期末借方余额
	private Integer endDebitQuantity;//期末借方数量
	private Float endDebitPrice;//期末借方价格
	private Float endLenderBalance;//期末贷方余额
	private Integer endLenderQuantity;//期末贷方数量
	private Float endLenderPrice;//期末贷方价格
	private Boolean isQuantity;//是否启用数量核算
	private Boolean enStatus;//科目是否启用
	private Integer super_id;//父类科目编号
	private Integer countNume;
	
	public Integer getCountNume() {
		return countNume;
	}
	public void setCountNume(Integer countNume) {
		this.countNume = countNume;
	}
	public void setSuper_id(Integer super_id) {
		this.super_id = super_id;
	}
	public Integer getAcSub_id() {
		return acSub_id;
	}
	public void setAcSub_id(Integer acSub_id) {
		this.acSub_id = acSub_id;
	}
	public String getAcSub_name() {
		return acSub_name;
	}
	public void setAcSub_name(String acSub_name) {
		this.acSub_name = acSub_name;
	}
	public String getAcSub_classes() {
		return acSub_classes;
	}
	public void setAcSub_classes(String acSub_classes) {
		this.acSub_classes = acSub_classes;
	}
	public String getAcSub_property() {
		return acSub_property;
	}
	public void setAcSub_property(String acSub_property) {
		this.acSub_property = acSub_property;
	}
	public String getBalanceDirection() {
		return balanceDirection;
	}
	public void setBalanceDirection(String balanceDirection) {
		this.balanceDirection = balanceDirection;
	}
	public Float getInitDebitRemaining() {
		return initDebitRemaining;
	}
	public void setInitDebitRemaining(Float initDebitRemaining) {
		this.initDebitRemaining = initDebitRemaining;
	}
	public Integer getInitDebitQuantity() {
		return initDebitQuantity;
	}
	public void setInitDebitQuantity(Integer initDebitQuantity) {
		this.initDebitQuantity = initDebitQuantity;
	}
	public Float getInitDebitPrice() {
		return initDebitPrice;
	}
	public void setInitDebitPrice(Float initDebitPrice) {
		this.initDebitPrice = initDebitPrice;
	}
	public Float getInitLenderRemaining() {
		return initLenderRemaining;
	}
	public void setInitLenderRemaining(Float initLenderRemaining) {
		this.initLenderRemaining = initLenderRemaining;
	}
	public Integer getInitLenderQuantity() {
		return initLenderQuantity;
	}
	public void setInitLenderQuantity(Integer initLenderQuantity) {
		this.initLenderQuantity = initLenderQuantity;
	}
	public Float getInitLenderPrice() {
		return initLenderPrice;
	}
	public void setInitLenderPrice(Float initLenderPrice) {
		this.initLenderPrice = initLenderPrice;
	}
	public Float getYearSumDebit() {
		return yearSumDebit;
	}
	public void setYearSumDebit(Float yearSumDebit) {
		this.yearSumDebit = yearSumDebit;
	}
	public Integer getYearDebitQuantity() {
		return yearDebitQuantity;
	}
	public void setYearDebitQuantity(Integer yearDebitQuantity) {
		this.yearDebitQuantity = yearDebitQuantity;
	}
	public Float getYearDebitPrice() {
		return yearDebitPrice;
	}
	public void setYearDebitPrice(Float yearDebitPrice) {
		this.yearDebitPrice = yearDebitPrice;
	}
	public Float getYearSumLender() {
		return yearSumLender;
	}
	public void setYearSumLender(Float yearSumLender) {
		this.yearSumLender = yearSumLender;
	}
	public Integer getYearLenderQuantity() {
		return yearLenderQuantity;
	}
	public void setYearLenderQuantity(Integer yearLenderQuantity) {
		this.yearLenderQuantity = yearLenderQuantity;
	}
	public Float getYearLenderPrice() {
		return yearLenderPrice;
	}
	public void setYearLenderPrice(Float yearLenderPrice) {
		this.yearLenderPrice = yearLenderPrice;
	}
	public Float getEndDebitBalance() {
		return endDebitBalance;
	}
	public void setEndDebitBalance(Float endDebitBalance) {
		this.endDebitBalance = endDebitBalance;
	}
	public Integer getEndDebitQuantity() {
		return endDebitQuantity;
	}
	public void setEndDebitQuantity(Integer endDebitQuantity) {
		this.endDebitQuantity = endDebitQuantity;
	}
	public Float getEndDebitPrice() {
		return endDebitPrice;
	}
	public void setEndDebitPrice(Float endDebitPrice) {
		this.endDebitPrice = endDebitPrice;
	}
	public Float getEndLenderBalance() {
		return endLenderBalance;
	}
	public void setEndLenderBalance(Float endLenderBalance) {
		this.endLenderBalance = endLenderBalance;
	}
	public Integer getEndLenderQuantity() {
		return endLenderQuantity;
	}
	public void setEndLenderQuantity(Integer endLenderQuantity) {
		this.endLenderQuantity = endLenderQuantity;
	}
	public Float getEndLenderPrice() {
		return endLenderPrice;
	}
	public void setEndLenderPrice(Float endLenderPrice) {
		this.endLenderPrice = endLenderPrice;
	}
	public Boolean getIsQuantity() {
		return isQuantity;
	}
	public void setIsQuantity(Boolean isQuantity) {
		this.isQuantity = isQuantity;
	}
	public Boolean getEnStatus() {
		return enStatus;
	}
	public void setEnStatus(Boolean enStatus) {
		this.enStatus = enStatus;
	}
	public Integer getSuper_id() {
		return super_id;
	}
	
	
}
