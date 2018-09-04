package com.dick.mapper;

import java.util.List;

import com.dick.pojo.Auth_role;
import com.dick.pojo.Auth_user;
/**
 * 角色、用户的增删查改
 * @author Dick
 *
 */
public interface UserRoleMapper {
	//获取角色集合
	List<Auth_role> getRoleList(String sql) throws Exception;
	//获取角色集合
	List<Auth_role> getRoleList1() throws Exception;
	//添加角色
	Integer insertRole(Auth_role role) throws Exception;
	//获取用户集合
	List<Auth_user> getUserlist() throws Exception;
	//获取用户集合
	List<Auth_user> getUserlist1(String sql) throws Exception;
	//删除角色
	Integer deleteRole(Auth_role role) throws Exception;
	//更新角色
	Integer updateRole(Auth_role role) throws Exception;
	//通过id查询角色
	List<Auth_role> selectRoleById(Integer sid) throws Exception;
	//通过名字模糊查询角色
	List<Auth_role> selectRoleByName(String sname) throws Exception;
	//添加用户
	Integer insertUser(Auth_user user) throws Exception;
	//用户维护
	Integer updateUser(Auth_user user) throws Exception;
	//更新密码
	Integer updatePwd(Auth_user user) throws Exception;
	//通过账号查询用户
	List<Auth_user> selectUserById(String uid) throws Exception;
	/*通过姓名查用户*/
	List<Auth_user> selectUserByName(String uname) throws Exception;
}
