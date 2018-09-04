package com.dick.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dick.pojo.Auth_user;
import com.dick.service.LoginService;

/**
 * 处理登录请求的控制层
 * @author Dick
 *
 */
@Controller
public class LoginController {
	//自动匹配相关的service层
	@Autowired
	private LoginService loginService;
	
	//处理登录请求
	@RequestMapping(value = "doLogin.action")
	public String doLogin(String username, String password, String auth,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		//定义保存用户的list集合
		List<Auth_user> list = null;
		try {
			//获取业务处理层得到用户集合，并赋值给list
			list = this.loginService.getUsers();
			//一个个遍历，看登录请求的用户名、密码和权限是否一致
			for(Auth_user user : list){
				if(username.equals(user.getUsername()) & password.equals(user.getPwd()) &
						auth.equals(user.getRole_name()) & true==user.getEnStatus()){
					session.setAttribute("UserName", username);
					session.setAttribute("uName", user.getuName());
					session.setAttribute("rolename", user.getRole_name());
					return "redirect:/index.jsp";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("loginError", "用户名或密码或角色错误...");
		return "/login.jsp";
	}

	//处理注销请求
	@RequestMapping(value = "loginOut.action")
	public String doLoginOut(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/login.jsp";
	}
	
	
}
