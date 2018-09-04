package com.dick.pojo;
/**
 * 凭证表
 * @author 30541
 *
 */
public class Voucher {
	private Integer voucher_id;//凭证id
	private Integer acSub_id;//会计科目id
	private String acSub_name;
	private String acsAbstract;//摘要
	private Float debitMoney;//借方金额
	private Integer debitQuantity;//借方数量
	private Float debitPrice;//借方价格
	private Float creditorMoney;//贷方金额
	private Integer creditorQuantity;//贷方数量
	private Float creditorPrice;//贷方价格
	private Float sumDebit;//借方金额总计
	private Float sumCreditor;//贷方金额总计
	private String formMaker;//制单人
	private String reChecker;//审核人
	private String bookKeeper;//记账人
	private String bookKeeperTime;///记账时间
	private Boolean checkStatus;//审核状态
	private String createTime;//凭证填写日期
	private String periods;//期数
	private Integer bills;//单据数量
	private Integer billsPhotos;//单据图片
	private Integer superid;//父类凭证id
	private Boolean jiezhang;
	
	public Boolean getJiezhang() {
		return jiezhang;
	}
	public void setJiezhang(Boolean jiezhang) {
		this.jiezhang = jiezhang;
	}
	public Integer getVoucher_id() {
		return voucher_id;
	}
	public void setVoucher_id(Integer voucher_id) {
		this.voucher_id = voucher_id;
	}
	public Integer getAcSub_id() {
		return acSub_id;
	}
	public void setAcSub_id(Integer acSub_id) {
		this.acSub_id = acSub_id;
	}
	public String getAcsAbstract() {
		return acsAbstract;
	}
	public void setAcsAbstract(String acsAbstract) {
		this.acsAbstract = acsAbstract;
	}
	public Float getDebitMoney() {
		return debitMoney;
	}
	public void setDebitMoney(Float debitMoney) {
		this.debitMoney = debitMoney;
	}
	public Integer getDebitQuantity() {
		return debitQuantity;
	}
	public void setDebitQuantity(Integer debitQuantity) {
		this.debitQuantity = debitQuantity;
	}
	public Float getDebitPrice() {
		return debitPrice;
	}
	public void setDebitPrice(Float debitPrice) {
		this.debitPrice = debitPrice;
	}
	public Float getCreditorMoney() {
		return creditorMoney;
	}
	public void setCreditorMoney(Float creditorMoney) {
		this.creditorMoney = creditorMoney;
	}
	public Integer getCreditorQuantity() {
		return creditorQuantity;
	}
	public void setCreditorQuantity(Integer creditorQuantity) {
		this.creditorQuantity = creditorQuantity;
	}
	public Float getCreditorPrice() {
		return creditorPrice;
	}
	public void setCreditorPrice(Float creditorPrice) {
		this.creditorPrice = creditorPrice;
	}
	public Float getSumDebit() {
		return sumDebit;
	}
	public void setSumDebit(Float sumDebit) {
		this.sumDebit = sumDebit;
	}
	public Float getSumCreditor() {
		return sumCreditor;
	}
	public void setSumCreditor(Float sumCreditor) {
		this.sumCreditor = sumCreditor;
	}
	public String getFormMaker() {
		return formMaker;
	}
	public void setFormMaker(String formMaker) {
		this.formMaker = formMaker;
	}
	public String getReChecker() {
		return reChecker;
	}
	public void setReChecker(String reChecker) {
		this.reChecker = reChecker;
	}
	public String getBookKeeper() {
		return bookKeeper;
	}
	public void setBookKeeper(String bookKeeper) {
		this.bookKeeper = bookKeeper;
	}
	public String getBookKeeperTime() {
		return bookKeeperTime;
	}
	public void setBookKeeperTime(String bookKeeperTime) {
		this.bookKeeperTime = bookKeeperTime;
	}
	public Boolean getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(Boolean checkStatus) {
		this.checkStatus = checkStatus;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getPeriods() {
		return periods;
	}
	public void setPeriods(String periods) {
		this.periods = periods;
	}
	public Integer getBills() {
		return bills;
	}
	public void setBills(Integer bills) {
		this.bills = bills;
	}
	public Integer getBillsPhotos() {
		return billsPhotos;
	}
	public void setBillsPhotos(Integer billsPhotos) {
		this.billsPhotos = billsPhotos;
	}
	public Integer getSuperid() {
		return superid;
	}
	public void setSuperid(Integer superid) {
		this.superid = superid;
	}
	public String getAcSub_name() {
		return acSub_name;
	}
	public void setAcSub_name(String acSub_name) {
		this.acSub_name = acSub_name;
	}
	
	
}
