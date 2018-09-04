package com.dick.pojo;
/**
 * 凭证类型
 * @author 30541
 *
 */
public class VoucherType {
	private Integer vou_id;//凭证类型id
	private String vou_name;//凭证类型名字
	private String printTitle;//打印的标题
	private Boolean enStatus;//是否启用
	public Integer getVou_id() {
		return vou_id;
	}
	public void setVou_id(Integer vou_id) {
		this.vou_id = vou_id;
	}
	public String getVou_name() {
		return vou_name;
	}
	public void setVou_name(String vou_name) {
		this.vou_name = vou_name;
	}
	public String getPrintTitle() {
		return printTitle;
	}
	public void setPrintTitle(String printTitle) {
		this.printTitle = printTitle;
	}
	public Boolean isEnStatus() {
		return enStatus;
	}
	public void setEnStatus(Boolean enStatus) {
		this.enStatus = enStatus;
	}
	
}
