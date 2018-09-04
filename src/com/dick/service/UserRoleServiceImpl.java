package com.dick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dick.mapper.UserRoleMapper;
import com.dick.pojo.Auth_role;
import com.dick.pojo.Auth_user;
/**
 * 处理用户、角色的service层
 * @author Dick
 *
 */
@Service
public class UserRoleServiceImpl implements UserRoleService{
	//使用用户角色数据库数据处理的接口
	@Autowired
	private UserRoleMapper urMapper;
	
	/**
	 * 获取角色集合
	 */
	@Override
	public List<Auth_role> getRoleList(String sql) throws Exception {
		List<Auth_role> rlist = this.urMapper.getRoleList(sql);
		return rlist;
	}
	
	//保存角色
	@Override
	public Integer insertRole(Auth_role role) throws Exception {
			return this.urMapper.insertRole(role);
	}
	
	//获取用户集合
	@Override
	public List<Auth_user> getUserList() throws Exception {
		List<Auth_user> ulist = this.urMapper.getUserlist();
		return ulist;
	}
	//删除角色
	@Override
	public Integer deleteRole(Auth_role role) throws Exception {
		
		return this.urMapper.deleteRole(role);
	}
	//更新角色
	@Override
	public Integer updateRole(Auth_role role) throws Exception {
		
		return this.urMapper.updateRole(role);
	}
	//id查询角色
	@Override
	public List<Auth_role> selectRoleBId(Integer sid) throws Exception {
		List<Auth_role> rolelist = this.urMapper.selectRoleById(sid);
		return rolelist;
	}
	//名字查询角色
	@Override
	public List<Auth_role> selectRoleByName(String sname) throws Exception {
		List<Auth_role> rlist = this.urMapper.selectRoleByName(sname);
		return rlist;
	}
	//添加用户
	@Override
	public Integer insertUser(Auth_user user) throws Exception {
		
		return this.urMapper.insertUser(user);
	}
	//用户维护
	@Override
	public Integer updateUser(Auth_user user) throws Exception {
		return this.urMapper.updateUser(user);
	}
	//更新密码
	@Override
	public Integer updatePwd(Auth_user user) throws Exception {
		return this.urMapper.updatePwd(user);
	}

	@Override
	public List<Auth_user> selectUserById(String uid) throws Exception {
		return this.urMapper.selectUserById(uid);
	}

	@Override
	public List<Auth_user> selectUserByName(String uname) throws Exception {
		return this.urMapper.selectUserByName(uname);
	}

	@Override
	public List<Auth_role> getRoleList1() throws Exception {
		// TODO Auto-generated method stub
		return this.urMapper.getRoleList1();
	}

	@Override
	public List<Auth_user> getUserlist1(String sql) throws Exception {
		return this.urMapper.getUserlist1(sql);
	}

}
