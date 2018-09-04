package com.dick.mapper;

import java.util.List;

import com.dick.pojo.Auth_user;

public interface LoginMapper {
	List<Auth_user> findUsers() throws Exception;
}
