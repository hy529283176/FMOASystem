package com.dick.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

/**
 *    判断用户是否登录,未登录则跳转到登录界面
 */
public class SessionFilter implements Filter {

    public FilterConfig config;

    public void destroy() {
        this.config = null;
    }

    public static boolean isContains(String container, String[] regx) {
        boolean result = false;

        for (int i = 0; i < regx.length; i++) {
            if (container.indexOf(regx[i].toString()) != -1) {
                return true;
            }
        }
        return result;
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest hrequest = (HttpServletRequest)request;
        HttpServletResponse hresponse = (HttpServletResponse)response;
        
        String logonStrings = config.getInitParameter("logonStrings");        // 登录登陆页面
        String includeStrings = config.getInitParameter("includeStrings");    // 过滤资源后缀参数
        
        String[] logonList = logonStrings.split(";");
        String[] includeList = includeStrings.split(";");

        if (!SessionFilter.isContains(hrequest.getRequestURI(), includeList)) {// 只对指定过滤参数后缀进行过滤
            chain.doFilter(request, response);
            return;
        }

        if (SessionFilter.isContains(hrequest.getRequestURI(), logonList)) {// 对登录页面不进行过滤
            chain.doFilter(request, response);
            return;
        }
        String user = ( String )hrequest.getSession().getAttribute("UserName");//判断用户是否登录
        System.out.println(user);
        if (user == null) {
        	hresponse.sendRedirect("login.jsp");
            return;
        }else {
            chain.doFilter(request, response);
            return;
        }
       
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
    }
}
