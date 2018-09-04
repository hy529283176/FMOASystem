package com.dick.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dick.pojo.AccountSub;
import com.dick.service.SubjectListService;

@Controller
@RequestMapping(value = "zhangbuchaxun/")
public class ZHANBUController {
	@Autowired
	private SubjectListService subService;
	/**
	 * 获取会计科目列表的方法
	 * @param request绑定携带的科目类别参数，并把数据返回到页面
	 * @return 返回到页面
	 */
	@RequestMapping(value = "SubjectRemainingSum.action")
	public String getAssetSubjectList(HttpServletRequest request) throws Exception{
		List<AccountSub> subjectList = null;
		subjectList = this.subService.getSubjectList("zichan",0,10);
		if(subjectList != null){
			request.setAttribute("subjectList", subjectList);
		}
		return "/JSP/zhangbuchaxun/SubjectRemainingSum.jsp";
	}
}
