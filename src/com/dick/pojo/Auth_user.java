package com.dick.pojo;
/**
 * 用户表
 * @author 30541
 *
 */
public class Auth_user {
	private String username;//用户名
	private String pwd;//密码
	private String uName;//用户昵称
	private Integer role_id;//角色id
	private String role_name;//角色名
	private Boolean enStatus;//是否启用
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public Boolean getEnStatus() {
		return enStatus;
	}
	public void setEnStatus(Boolean enStatus) {
		this.enStatus = enStatus;
	}
	
	
}
