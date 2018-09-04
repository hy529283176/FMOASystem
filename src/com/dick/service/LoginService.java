package com.dick.service;

import java.util.List;

import com.dick.pojo.Auth_user;

public interface LoginService {
	//查找一个list集合的Auth_user对象
	List<Auth_user> getUsers() throws Exception;
}
