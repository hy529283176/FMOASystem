package com.dick.pojo;
/**
 * 固定资产的表
 * @author 30541
 *
 */
public class Asset {
	private Integer assetid;//资产id
	private String assettype;//资产类型
	private String zhejiufa;//折旧计算的方法
	private String preUseYear;//预计使用年限
	private Float preJingZhi;//预计净残值率
	private String accSub;//所属固定资产科目名
	private String sumzhejiu;//所属累计折旧科目名
	private String assdesc;//备注
	
	public Integer getAssetid() {
		return assetid;
	}
	public void setAssetid(Integer assetid) {
		this.assetid = assetid;
	}
	public String getAssettype() {
		return assettype;
	}
	public void setAssettype(String assettype) {
		this.assettype = assettype;
	}
	public String getZhejiufa() {
		return zhejiufa;
	}
	public void setZhejiufa(String zhejiufa) {
		this.zhejiufa = zhejiufa;
	}
	public String getPreUseYear() {
		return preUseYear;
	}
	public void setPreUseYear(String preUseYear) {
		this.preUseYear = preUseYear;
	}
	public Float getPreJingZhi() {
		return preJingZhi;
	}
	public void setPreJingZhi(Float preJingZhi) {
		this.preJingZhi = preJingZhi;
	}
	public String getAccSub() {
		return accSub;
	}
	public void setAccSub(String accSub) {
		this.accSub = accSub;
	}
	public String getSumzhejiu() {
		return sumzhejiu;
	}
	public void setSumzhejiu(String sumzhejiu) {
		this.sumzhejiu = sumzhejiu;
	}
	public String getAssdesc() {
		return assdesc;
	}
	public void setAssdesc(String assdesc) {
		this.assdesc = assdesc;
	}
	
}
