package com.dick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dick.mapper.LoginMapper;
import com.dick.pojo.Auth_user;
/**
 * 处理登录的service层
 * @author Dick
 *
 */
@Service
public class LoginServiceImpl implements LoginService{
	//注解式自动匹配，使用mybatis相关方法，获取数据库的数据的处理
	@Autowired
	private LoginMapper loginMapper;
	
	/**
	 * 获取用户集合
	 */
	@Override
	public List<Auth_user> getUsers() throws Exception {
		List<Auth_user> userlist = this.loginMapper.findUsers();
		return userlist;
	}

}
