package com.dick.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.spi.http.HttpContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dick.pojo.AccountSub;
import com.dick.pojo.Auth_role;
import com.dick.pojo.Auth_user;
import com.dick.service.UserRoleService;
import com.dick.util.PageUtil;
/**
 * 处理角色、用户的Controller层
 * @author Dick
 *
 */
@Controller
@RequestMapping(value = "userAndRole/")
public class UserRoleController {
	/*自动匹配相关的service层*/
	@Autowired
	private UserRoleService urService;
	
	/**
	 * 获取角色列表的方法
	 * @param request
	 * @return
	 */
	@RequestMapping(value="role/getRoleList.action")
	public String getRoleList(String sid,String sname,String currentPage,HttpServletRequest request){
		try {
			StringBuilder sql = new StringBuilder();
			if(!"".equals(sid)){
				sql.append(" AND role_id like '"+sid.trim().toString()+"%' ");
			}
			if(!"".equals(sname)){
				sql.append(" AND role_name like '%"+sname.trim().toString()+"%' ");
			}		
				PageUtil page = new PageUtil();
				/*每页记录数*/
				page.setPageSize(10);
				Integer cp = 1;
				if(!"".equals(currentPage)){
					cp = Integer.parseInt(currentPage);
				}
				/*当前页*/
				page.setCurrentPage(cp);
				/*总记录数*/
				page.setTotalCount(this.urService.getRoleList(sql.toString()).size());
				
				sql.append(" LIMIT "+((cp-1)*10)+","+10);
				List<Auth_role>  rlist = this.urService.getRoleList(sql.toString());
				if(rlist.size()>0){
					request.setAttribute("roleList", rlist);
				}
				
				request.setAttribute("page", page);
				request.setAttribute("sid", sid);
				request.setAttribute("sname", sname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/JSP/xitongguanli/RoleList.jsp";
	}
	
	/**
	 * 跳转到新增角色页面
	 * @return
	 */
	@RequestMapping(value="role/getRoleIndex.action")
	public String getRoleIndex(){
		return "/JSP/xitongguanli/Insert/InsertRole.jsp";
	}
	
	/**
	 * 添加角色的方法
	 * @param role_name
	 * @param request
	 * @return
	 */
	@RequestMapping(value="role/insertRole.action")
	public String insertRole(Auth_role role,HttpServletRequest request){
			try {
				if(role.getRole_name() != null){
					Integer id = this.urService.insertRole(role);
					if(id!=null){
						request.setAttribute("info", "添加成功！");
						List<Auth_role> rlist = this.urService.getRoleList1();
						ServletContext app01 = request.getServletContext();
						app01.removeAttribute("loginRoleList");
						app01.setAttribute("loginRoleList", rlist);
						return "/JSP/xitongguanli/Insert/InsertRole.jsp"; 
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		request.setAttribute("info", "添加失败！");
		return "/JSP/xitongguanli/Insert/InsertRole.jsp";
	}
	
	/**
	 * 删除角色的方法
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value="role/deleteRole.action")
	public String deleteRole(String id, HttpServletRequest request){
		Auth_role role = new Auth_role();
		role.setRole_id(Integer.parseInt(id));
		Integer mes;
		try {
			mes = this.urService.deleteRole(role);
			if(mes!=null && mes!=0){
				List<Auth_role> rlist = this.urService.getRoleList1();
				ServletContext app01 = request.getServletContext();
				app01.removeAttribute("loginRoleList");
				app01.setAttribute("loginRoleList", rlist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/userAndRole/role/getRoleList.action"; 
	}
	
	/**
	 * 去更新角色界面
	 * @param rid 角色id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "role/UpdateIndex.action")
	public String updateIndex(String rid,HttpServletRequest request){
		try {
			Auth_role role = this.urService.selectRoleBId(Integer.parseInt(rid)).get(0);
			request.setAttribute("role", role);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "/JSP/xitongguanli/Update/UpdateRole.jsp";
	}
	
	/**
	 * 更改角色的方法
	 * @param role
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="role/updateRole.action")
	public String updateRole(Auth_role role, HttpServletRequest request){
		Integer mes;
		try {
			mes = this.urService.updateRole(role);
			if(mes!=0){
				List<Auth_role> rlist = this.urService.getRoleList1();
				ServletContext app01 = request.getServletContext();
				app01.removeAttribute("loginRoleList");
				app01.setAttribute("loginRoleList", rlist);
				request.setAttribute("role", role);
				request.setAttribute("info", "更新成功！");
				return "/JSP/xitongguanli/Update/UpdateRole.jsp";
			}else{
				Auth_role role2 = this.urService.selectRoleBId(role.getRole_id()).get(0);
				request.setAttribute("role", role2);
				request.setAttribute("info", "更新失败！");
				return "/JSP/xitongguanli/Update/UpdateRole.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询角色的方法
	 * @param sid 根据id查询
	 * @param sname 根据角色名查询
	 * @param request
	 * @return
	 */
	@RequestMapping(value="role/selectRole.action")
	public String selectRole(String sid, String sname,HttpServletRequest request){
		try {
			//id查询
			if(!sid.isEmpty() && sname.isEmpty()){
				List<Auth_role> rlist = this.urService.selectRoleBId(Integer.parseInt(sid));
				if(rlist!=null){
					request.setAttribute("roleList", rlist);
					return "/JSP/xitongguanli/RoleList.jsp";
				}
			}
			if(sid.isEmpty() && !sname.isEmpty()){//角色名模糊查询
				List<Auth_role> rlist;
				rlist = this.urService.selectRoleByName(sname);
				request.setAttribute("roleList", rlist);
				return "/JSP/xitongguanli/RoleList.jsp";
			}
			if(sname.isEmpty() && sid.isEmpty()){//返回所有
				
				return "redirect:/userAndRole/role/getRoleList.action";
			}
			if(!sname.isEmpty() && !sid.isEmpty()){//返回所有
				return "redirect:/userAndRole/role/getRoleList.action";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 跳转到用户列表页面的方法
	 * @param request 返回用户列表，绑定到request
	 * @return
	 */
	@RequestMapping(value="user/getUserList.action")
	public String getUserList(String zhanghao,String mingcheng,String currentPage,HttpServletRequest request){
		try {
			StringBuilder sql = new StringBuilder("");
			if(!"".equals(zhanghao)){
				sql.append(" AND username like '%"+zhanghao.trim().toString()+"%' ");
			}
			if(!"".equals(mingcheng)){
				sql.append(" AND name like '%"+mingcheng.trim().toString()+"%' ");
			}		
				PageUtil page = new PageUtil();
				/*每页记录数*/
				page.setPageSize(10);
				Integer cp = 1;
				if(!"".equals(currentPage)){
					cp = Integer.parseInt(currentPage);
				}
				/*当前页*/
				page.setCurrentPage(cp);
				
				sql.append(" LIMIT "+((cp-1)*10)+","+10);
				List<Auth_user> ulist = this.urService.getUserlist1(sql.toString());
				if(ulist.size()>0){
					request.setAttribute("userlist", ulist);
				}
				/*总记录数*/
				page.setTotalCount(this.urService.getUserlist1(sql.toString()).size());
				request.setAttribute("page", page);
				request.setAttribute("sid", zhanghao);
				request.setAttribute("sname", mingcheng);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/JSP/xitongguanli/UserList.jsp";
	}
	
	/**
	 * 跳转到用户添加页面
	 * @param request 返回角色列表给页面
	 * @return
	 */
	@RequestMapping(value="user/InsertUserIndex.action")
	public String getInsertUserIndex(HttpServletRequest request){
		try {
			List<Auth_role> rlist = this.urService.getRoleList1();
			request.setAttribute("roleList", rlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/JSP/xitongguanli/Insert/InsertUser.jsp";
	}
	
	/**
	 * 新增用户的方法
	 * @param user Auth_user对象
	 * @return
	 */
	@RequestMapping(value="user/saveUser.action")
	public String insertUser(Auth_user user, HttpServletRequest request){		
		List<Auth_role> rlist = null;
		try{		
			Integer mes = this.urService.insertUser(user);
			if(mes!=0 && mes!=null){
				request.setAttribute("info", "添加成功！");
				rlist = this.urService.getRoleList1();
				request.setAttribute("roleList", rlist);
				return "/JSP/xitongguanli/Insert/InsertUser.jsp"; 
			}else{
				rlist = this.urService.getRoleList1();
				request.setAttribute("roleList", rlist);
				request.setAttribute("info", "添加失败！");
				return "/JSP/xitongguanli/Insert/InsertUser.jsp"; 
			}
		}catch(Exception e){
			e.printStackTrace();
		}		
		return null;
	}
	
	/**
	 * 跳转到更新用户页面
	 * @param uName
	 * @param username
	 * @param pwd
	 * @param request
	 * @return
	 */
	@RequestMapping(value="user/updateUserView.action")
	public String toUpdateUser(String uName,String username,
			HttpServletRequest request){
		try {
			Auth_user user = new Auth_user();
			user.setuName(uName);
			user.setUsername(username);
			List<Auth_role> rlist = this.urService.getRoleList1();
			request.setAttribute("user", user);
			request.setAttribute("roleList", rlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/JSP/xitongguanli/Update/UpdateUser.jsp";
	}
	
	/**
	 * 用户维护,更新信息
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="user/updateUser.action")
	public String updateUser(Auth_user user,HttpServletRequest request){
		Integer mes = null;
		try {
			List<Auth_role> rlist = this.urService.getRoleList1();
			request.setAttribute("user", user);
			request.setAttribute("roleList", rlist);
			mes = this.urService.updateUser(user);
			if(mes!=null && mes!=0){
				request.setAttribute("info", "更新成功");
				return "/JSP/xitongguanli/Update/UpdateUser.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("info", "更新失败");
		return "/JSP/xitongguanli/Update/UpdateUser.jsp";
	}
	
	@RequestMapping(value="searchUsers/getUsersInfor.action")
	public String searchUserInfo(String zhanghao,String mingcheng,HttpServletRequest request) throws Exception{
		//id查询
		if(!zhanghao.isEmpty() && mingcheng.isEmpty()){
			List<Auth_user> ulist = this.urService.selectUserById(zhanghao);
			if(ulist!=null){
				request.setAttribute("userlist", ulist);
				return "/JSP/xitongguanli/UserList.jsp";
			}
		}
		if(zhanghao.isEmpty() && !mingcheng.isEmpty()){//角色名模糊查询
			List<Auth_user> ulist = this.urService.selectUserByName(mingcheng);
			request.setAttribute("userlist", ulist);
			return "/JSP/xitongguanli/UserList.jsp";
		}
		if(zhanghao.isEmpty() && mingcheng.isEmpty()){//返回所有
			
			return "redirect:/userAndRole/user/getUserList.action";
		}
		if(!zhanghao.isEmpty() && !mingcheng.isEmpty()){//返回所有
			return "redirect:/userAndRole/user/getUserList.action";
		}
		
		return null;
	}
	
	/**
	 * 更新密码
	 * @param username
	 * @param pwd
	 * @param rPwd
	 * @param request
	 * @return
	 */
	@RequestMapping(value="updatePwd.action")
	public String updatePwd(String username, String pwd, String rPwd, HttpServletRequest request){
		Integer mes = null;
		try {
			Auth_user user = new Auth_user();
			user.setPwd(pwd);
			user.setUsername(username);
			if(pwd.equals(rPwd)){
				mes = this.urService.updatePwd(user);
				if(mes!=null && mes!=0){
					request.setAttribute("info", "更新成功");
					return "/JSP/xitongguanli/Update/UpdatePwd.jsp";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("info", "更新失败");
		return "/JSP/xitongguanli/Update/UpdatePwd.jsp";
	}
	
	
}
