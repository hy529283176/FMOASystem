package com.dick.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dick.pojo.AccountSub;
import com.dick.pojo.Voucher;

/**
 * 凭证表mapper
 * @author 30541
 *
 */
public interface VoucherMapper {
	/*插入凭证*/
	Integer saveVoucher(Voucher voucher) throws Exception;
	List<AccountSub> selectSubjectListByName(String name) throws Exception;
	List<AccountSub> getSubjectListByType(@Param("acSub_classes")String type, @Param("supid")Integer supid) throws Exception;
	List<Voucher> getVoucherList(String sql) throws Exception;
	Integer deleteVoucherByVoucherId(Integer voucherid)  throws Exception;
	Integer updateVoucherCheck(@Param("cstatus")Integer cstatus,@Param("checker")String checker,@Param("voucherid")Integer voucherid) throws Exception; 
}
