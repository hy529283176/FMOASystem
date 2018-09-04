package com.dick.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dick.pojo.Auth_role;

public class LoginInfoListener  implements ServletContextListener {

	public LoginInfoListener(){
		super();
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		arg0.getServletContext().removeAttribute("loginRoleList");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
				//1.向容器读取对象
				WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
				//2.获取sqlSessionFactory
				SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) springContext.getBean("sqlSessionFactory");
				// 3. 创建SqlSession对象
				SqlSession sqlSession = sqlSessionFactory.openSession();
				// 4. 执行SqlSession对象执行查询，获取结果Auth_role
				// 参数是UserRoleMapper.xml的获取角色列表的查询方法的id
				List<Auth_role> rolelist = sqlSession.selectList("getRoleList");
				// 5.用Application弄个全局属性，共登录界面读取
				 ServletContext app01 = arg0.getServletContext();
				 app01.setAttribute("loginRoleList", rolelist);
				// 6. 释放资源
				sqlSession.close();
	}

}
