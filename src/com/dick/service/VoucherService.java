package com.dick.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dick.pojo.AccountSub;
import com.dick.pojo.Voucher;


public interface VoucherService {
	/*插入科目*/
	Integer saveVoucher(Voucher voucher) throws Exception;
	List<AccountSub> selectSubjectListByName(String name) throws Exception;
	List<AccountSub> getSubjectListByType(String type,Integer supid) throws Exception;
	List<Voucher> getVoucherList(String sql) throws Exception;
	Integer deleteVoucherByVoucherId(Integer voucherid) throws Exception;
	Integer checkVoucher( Integer cstatus,String chekcer,Integer voucherid) throws Exception;
} 
