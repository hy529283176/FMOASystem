package com.dick.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dick.common.VoucherDynamic;
import com.dick.common.VoucherFixed;
import com.dick.service.VoucherService;
import com.dick.util.PageUtil;
import com.dick.pojo.AccountSub;
import com.dick.pojo.Auth_role;
import com.dick.pojo.Voucher;
/**
 * 凭证管理控制层
 * @author 30541
 *
 */
@Controller
@RequestMapping(value = "pingzhengguanli/")
public class VoucherController {
	//自动匹配相关的service层
		@Autowired
		private VoucherService voucherService;
		
		@RequestMapping(value = "InsertVoucher/SaveVouchert.action")
		public String insertVoucher(VoucherFixed vf,VoucherDynamic vd,HttpServletRequest request) throws Exception{
			int mes = 0;
			int count = 0;
			if(vf!=null){
				for(int i=0;i<vd.getDacSub_id().length;i++){
					Voucher voucher = null;
					if(i == 0){
						voucher = new Voucher();
						voucher.setVoucher_id(vf.getFvoucher_id());
						voucher.setAcSub_id(vd.getDacSub_id()[i]);
						voucher.setAcsAbstract(vd.getZhaiyao()[i]);
						voucher.setDebitMoney(vd.getDebitMoney()[i]);
						voucher.setCreditorMoney(vd.getCreditorMoney()[i]);
						voucher.setSumDebit(vf.getFsumDebit());
						voucher.setSumCreditor(vf.getFsumCreditor());
						voucher.setFormMaker(vf.getFformMaker());
						voucher.setCreateTime(vf.getFcreateTime());
						voucher.setPeriods(vf.getFperiods());
						voucher.setBills(vf.getFbills());
						voucher.setSuperid(0);
					}else{
						voucher = new Voucher();
						voucher.setAcSub_id(vd.getDacSub_id()[i]);
						voucher.setAcsAbstract(vd.getZhaiyao()[i]);
						voucher.setDebitMoney(vd.getDebitMoney()[i]);
						voucher.setCreditorMoney(vd.getCreditorMoney()[i]);
						voucher.setSumDebit(vf.getFsumDebit());
						voucher.setSumCreditor(vf.getFsumCreditor());
						voucher.setFormMaker(vf.getFformMaker());
						voucher.setCreateTime(vf.getFcreateTime());
						voucher.setPeriods(vf.getFperiods());
						voucher.setBills(vf.getFbills());
						voucher.setSuperid(vf.getFvoucher_id());
					}
					if(voucher != null){
						mes = this.voucherService.saveVoucher(voucher);
						count++;
					}	
				}
				if(mes!=0 || count != 0){
					return "redirect:/pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=&qijian2=&currentPage=1";
				}	
			}
			return null;
		}
		
		/**
		 * 获取科目json数据
		 * @param acSubjectName 页面输入框传来的数据
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "getSomeSubjects/getSubjects.action")
		@ResponseBody
		public Map<String, String> getSubjects(String acSubjectName,HttpServletRequest request) throws Exception{
			Map<String, String> result = new HashMap<String, String>();
			String mes = "succeed";
			String data = "{data:[";
			if(this.voucherService.selectSubjectListByName(acSubjectName).size()>0){
				List<AccountSub> accountSubList = this.voucherService.selectSubjectListByName(acSubjectName);
				for(AccountSub sub : accountSubList){
					data+= "{'id':'"+sub.getAcSub_id()+"','name':'"+sub.getAcSub_name()+"'},";
				}
				data = data.substring(0, data.length()-1);
				data += "]}";
				result.put("mes", mes);
				result.put("dataList", data);
			}else{
				mes = "failed";
				result.put("mes", mes);
			}
			return result;
		}
		
		/**
		 * 获取科目选择树数据
		 * @param subjectType 科目类目
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "getSubjectTree/getSubjectTree.action")
		public @ResponseBody String getSubjectListTreeJson(String subjectType) throws Exception{
			StringBuilder strBuilder = new StringBuilder("[");
			String strTree = getTree(subjectType,0);
			if(null != strTree){
				strBuilder.append(strTree);
			}			
			strBuilder.append("]");			
			return strBuilder.toString();
		}
		/**
		 * 获取科目下级科目的方法
		 * @param type
		 * @param supid
		 * @return
		 * @throws Exception
		 */
		public String getTree(String type,Integer supid) throws Exception{
			List<AccountSub> subList = null;
			
			if(supid == 0){
				subList = this.voucherService.getSubjectListByType(type,0);
			}else{
				subList = this.voucherService.getSubjectListByType(type, supid);
			}
			int count = subList.size();
            if (count > 0)
            {
            	StringBuilder strBuilder = new StringBuilder("");
                for (int i = 0; i < count; i++)
                {
                    if (i > 0)
                    {
                        strBuilder.append(",");
                    }
                    strBuilder.append("{");
                    strBuilder.append("\"id\":\""+subList.get(i).getAcSub_id()+"\",\"text\":\""+subList.get(i).getAcSub_name()+"\"");
                    Integer subqhID = subList.get(i).getAcSub_id();
                    String str = getTree(type,subqhID);
                    if (null != str)
                    {
                        strBuilder.append(",\"children\":[");
                        strBuilder.append(str);
                        strBuilder.append("]");
                    }
                    else
                    {
                        strBuilder.append(",\"icon\":\"glyphicon glyphicon-flash\"");
                    }
                    strBuilder.append("}");
                }               
                return strBuilder.toString();
            }
			return null;
		}
		/**
		 * 凭证汇总模块凭证列表
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "getVoucher/getVoucherList.action")
		public String getVoucherList(String qijian1,String qijian2,String voucher_id1,String voucher_id2,String currentPage,HttpServletRequest request) throws Exception{
			StringBuilder sql = new StringBuilder("");
			if(!"".equals(qijian1) | !"".equals(qijian2)){
				sql.append(" AND t.createTime BETWEEN '"+qijian1.trim().toString()+"' AND '"+qijian2.trim().toString()+"' ");
			}
			if(!"".equals(voucher_id1) | !"".equals(voucher_id2)){
				sql.append(" AND (t.voucher_id BETWEEN '"+voucher_id1.trim().toString()+"' AND '"+voucher_id2.trim().toString()+"' OR t.superid BETWEEN '"+voucher_id1.trim().toString()+"' AND '"+voucher_id2.trim().toString()+"')");
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
				page.setTotalCount(this.voucherService.getVoucherList(sql.toString()).size());
				sql.append(" LIMIT "+((cp-1)*10)+","+10);
				List<Voucher>  list = this.voucherService.getVoucherList(sql.toString());
				if(list.size()>0){
					request.setAttribute("voucherlist", list);
				}
				
				request.setAttribute("page", page);
				request.setAttribute("qijian1", qijian1);
				request.setAttribute("qijian2", qijian2);
			return "/JSP/pingzhengguanli/VoucherList.jsp";
		}
		/**
		 * 审核凭证子模块获取凭证列表
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "getVoucher/auditVoucherList.action")
		public String auditVoucherList(String qijian1,String qijian2,String currentPage,HttpServletRequest request) throws Exception{
			StringBuilder sql = new StringBuilder("");
			if(!"".equals(qijian1) | !"".equals(qijian2)){
				sql.append(" AND t.createTime BETWEEN '"+qijian1.trim().toString()+"' AND '"+qijian2.trim().toString()+"' ");
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
				page.setTotalCount(this.voucherService.getVoucherList(sql.toString()).size());
				sql.append(" LIMIT "+((cp-1)*10)+","+10);
				List<Voucher>  list = this.voucherService.getVoucherList(sql.toString());
				if(list.size()>0){
					request.setAttribute("voucherlist", list);
				}
				request.setAttribute("page", page);
				request.setAttribute("qijian1", qijian1);
				request.setAttribute("qijian2", qijian2);
				return "/JSP/pingzhengguanli/AuditVoucher.jsp";
		}
		/**
		 * 删除凭证
		 * @param voucherid
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value = "delete/deleteVoucher.action")
		public String deleteVoucher(Integer voucherid,HttpServletRequest request) throws Exception{
			Integer mes = 0;
			if(voucherid != null){
			  mes = this.voucherService.deleteVoucherByVoucherId(voucherid);
			}
			if(mes != 0){
				return "redirect:/pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=&qijian2=&currentPage=1";
			}
			return null;
		}
		/**
		 * 审核凭证
		 * @param voucherid
		 * @param cstatus
		 * @param checker
		 * @param request
		 * @return
		 * @throws Exception
		 */
		@RequestMapping(value="shenhe/shenheVoucher.action")
		public String shenHeVoucher(Integer voucherid,Integer cstatus,String checker,HttpServletRequest request) throws Exception{
			Integer mes = 0;
			if(voucherid != 0){
				mes = this.voucherService.checkVoucher(cstatus,checker,voucherid);
			}
			if(mes!=0){
				return "redirect:/pingzhengguanli/getVoucher/auditVoucherList.action?qijian1=&qijian2=&currentPage=1";
			}
			return null;
		}
		
		
		@RequestMapping(value="update/updateVoucher.action")
		public String updateVouchers(Integer voucherid,HttpServletRequest request) throws Exception{
			
			return null;
		}
}
