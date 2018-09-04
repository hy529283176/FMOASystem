	package com.dick.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dick.pojo.AccountSub;
import com.dick.service.SubjectListService;
import com.dick.util.PageUtil;
/**
 * 会计科目功能的Controller层
 * @author 30541
 *
 */
@Controller
@RequestMapping(value = "xitongguanli/")
public class SubjectListController {
	@Autowired
	private SubjectListService subService;
	
	
	/**
	 * 获取会计科目列表的方法
	 * @param request绑定携带的科目类别参数，并把数据返回到页面
	 * @return 返回到页面
	 */
	@RequestMapping(value = "assetSubject/getAssetSubjectList.action")
	public String getAssetSubjectList(HttpServletRequest request) throws Exception{
		/*总记录树*/
		String acSub_classes = request.getParameter("acSub_classes").toString();
		String bianhao = null;
		String mingcheng = null;
		String leixing = null;
		if("".equals(request.getParameter("bianhao").toString())){
			bianhao = "";
		}
		if("".equals(request.getParameter("mingcheng").toString())){
			mingcheng="";
		}
		if("".equals(request.getParameter("leixing").toString())){
			leixing="";
		}
		
		List<AccountSub> subjectList = null;
		subjectList = this.subService.getSubjectList(acSub_classes,0,10);
		if(subjectList != null){
			request.setAttribute("subjectList", subjectList);
		}
		PageUtil page = new PageUtil();
		/*每页记录数*/
		page.setPageSize(10);
		/*当前页*/
		page.setCurrentPage(1);
		/*总记录数*/
		page.setTotalCount(this.subService.selectSubjectTotleCount(acSub_classes).size());
		request.setAttribute("page", page);
		request.setAttribute("classtype", acSub_classes);
		request.setAttribute("bianhao", bianhao);
		request.setAttribute("mingcheng", mingcheng);
		request.setAttribute("leixing", leixing);
		return "/JSP/xitongguanli/SubjectList.jsp";
	}
	/**
	 * 跳转到新增科目页面
	 * @return
	 */
	@RequestMapping(value = "InsertSubject/getEditIndex.action")
	public String getEditIndex(HttpServletRequest request){
		return "/JSP/xitongguanli/Insert/InsertSubject.jsp";
	}
	
	/**
	 * 添加新的会计科目方法
	 * @param accountSub 页面表单传来的AccountSub类对象
	 * @param request HttpServletRequest参数返回信息给页面
	 * @return
	 */
	@RequestMapping(value = "InsertSubject/SaveSubject.action")
	public String saveSubject(AccountSub accountSub,HttpServletRequest request) throws Exception {
		AccountSub accSub = this.subService.getAccountSubById(accountSub.getAcSub_id());
		Integer info = 0;
		if(accSub!=null){
			request.setAttribute("infor", "会计科目已存");
			return "/JSP/xitongguanli/Insert/InsertSubject.jsp";
		}else{
				
				info = this.subService.saveSubject(accountSub);
				if(info!=0){
					request.setAttribute("infor", "添加成功!");			
					return "redirect:/xitongguanli/update/getUpdateIndex.action?id="+accountSub.getAcSub_id();
				}
		}
		request.setAttribute("infor", "添加失败!");
		return "/JSP/xitongguanli/Update/UpdateSubject.jsp";
	}

	/**
	 * 异步返回父类上级科目id
	 * 
	 **/
	@RequestMapping(value = "InsertSubject/getSuperKey.action",method = { RequestMethod.POST })
	@ResponseBody 
	public Map<String, String> getSuperKey(String acSub_id) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		Integer id = Integer.parseInt(acSub_id.toString());
		AccountSub accSub1 = this.subService.getAccountSubById(id);
		/*先判断存不在该科目*/
		if (accSub1 == null || accSub1.getAcSub_name().isEmpty()) {
			result.put("mes", "没有上级科目");
			result.put("parentId", "0");
		} else {			
			AccountSub accSub2 = null;
			/*如果传入ID的长度为4，先判断是否存在该项目*/
			if(acSub_id.length()==4){
				accSub2 = this.subService.getAccountSubById(id);
				if(accSub2==null){
					result.put("mes", "没有上级科目");
					result.put("parentId", "0");
				}else{
					result.put("mes", "已存在该科目");
				}
				
			}else if(acSub_id.length()==6){
				if(acSub_id.equals(accSub1.getAcSub_id().toString())){
					result.put("mes", "已存在该科目");
				}else{
					accSub2 = this.subService.getAccountSubById(Integer.parseInt(acSub_id.substring(0, 4).toString()));
					if (accSub2==null) {
						result.put("mes", "没有上级科目");
						result.put("parentId", "0");
					} else {
						result.put("mes", ""+accSub2.getAcSub_id()+" "+accSub2.getAcSub_name());
						result.put("parentId", accSub2.getAcSub_id().toString());
					}
				}
			}else{
				if(acSub_id.equals(accSub1.getAcSub_id().toString())){
					result.put("mes", "已存在该科目");
				}else{
					accSub2 = this.subService.getAccountSubById(Integer.parseInt(acSub_id.substring(0, 6).toString()));
					if (accSub2==null) {
						result.put("mes", "没有上级科目");
						result.put("parentId", "0");
					} else {
						result.put("mes", ""+accSub2.getAcSub_id()+" "+accSub2.getAcSub_name());
						result.put("parentId", accSub2.getAcSub_id().toString());
					}
				}
			}
		}
				
		return result;
	}
	
	/**
	 * 去往更新页面
	 * @param id 科目id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "update/getUpdateIndex.action")
	public String toUpdateIndex(String id,HttpServletRequest request){
		try {
			AccountSub accSub = this.subService.getAccountSubById(Integer.parseInt(id));
			request.setAttribute("accountSub", accSub);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "/JSP/xitongguanli/Update/UpdateSubject.jsp";
	}
	
	/**
	 * 更新科目
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "update/updateSubject.action")
	public String updateAccountSub(AccountSub accSub,HttpServletRequest request){
		try {
			Integer mes = this.subService.updateSubject(accSub);
			if(mes!=0 || mes != null){
				request.setAttribute("infor", "更新成功");
				AccountSub sub = this.subService.getAccountSubById(accSub.getAcSub_id());
				request.setAttribute("accountSub", sub);
				return "/JSP/xitongguanli/Update/UpdateSubject.jsp";
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("accountSub", accSub);
		request.setAttribute("infor", "更新失败");
		return "/JSP/xitongguanli/Update/UpdateSubject.jsp";
	}
	/**
	 * 删除科目，也会删除该科目的凭证
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "delete/deleteSubject.action")
	public String deleteSubject(String id){
		try {
			Integer mes = this.subService.deleteSubject(Integer.parseInt(id));
			if(mes!=0 || mes!=null){
				return "/xitongguanli/assetSubject/getAssetSubjectList.action?acSub_classes=zichan";
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询科目的方法
	 * @param bianhao 科目编号
	 * @param mingcheng 科目名称
	 * @param leixing 科目类型
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "select/searchSubject.action")
	public String selectSubject(String bianhao,String mingcheng,String leixing,String classtype,String currentPage,HttpServletRequest request) throws Exception{
		StringBuilder sql = new StringBuilder();
		if(!"".equals(bianhao)){
			sql.append(" AND t.acSub_id like '"+bianhao.trim().toString()+"%' ");
		}
		if(!"".equals(mingcheng)){
			sql.append(" AND t.acSub_name like '%"+mingcheng.trim().toString()+"%' ");
		}
		if(!"".equals(leixing)) {
			sql.append(" AND t.acSub_property like '"+leixing.trim().toString()+"%' ");
		}
		if(!"".equals(classtype)){
			sql.append(" AND t.acSub_classes like '%"+classtype.trim()+"%' ");
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
		page.setTotalCount(this.subService.selectSubjectList(sql.toString()).size());
		sql.append(" LIMIT "+((cp-1)*10)+","+10);
		List<AccountSub> subList = this.subService.selectSubjectList(sql.toString());
		if(subList.size()>0 || !subList.isEmpty()){
			request.setAttribute("subjectList", subList);
		}
		request.setAttribute("page", page);
		request.setAttribute("classtype", classtype);
		request.setAttribute("bianhao", bianhao);
		request.setAttribute("mingcheng", mingcheng);
		request.setAttribute("leixing", leixing);
		return "/JSP/xitongguanli/SubjectList.jsp";
	}

}
