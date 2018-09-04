package com.dick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dick.mapper.VoucherMapper;
import com.dick.pojo.AccountSub;
import com.dick.pojo.Voucher;

/**
 * 凭证表
 * @author 30541
 *
 */
@Service
public class VoucherServiceImpl implements VoucherService {
	@Autowired
	private VoucherMapper voucherMapper;

	@Override
	public Integer saveVoucher(Voucher voucher) throws Exception {
		return this.voucherMapper.saveVoucher(voucher);
	}

	@Override
	public List<AccountSub> selectSubjectListByName(String name)
			throws Exception {
		return this.voucherMapper.selectSubjectListByName(name);
	}

	@Override
	public List<AccountSub> getSubjectListByType(String type,Integer supid) throws Exception {
		return this.voucherMapper.getSubjectListByType(type,supid);
	}

	@Override
	public List<Voucher> getVoucherList(String sql) throws Exception {
		return this.voucherMapper.getVoucherList(sql);
	}

	@Override
	public Integer deleteVoucherByVoucherId(Integer voucherid) throws Exception {
		return this.voucherMapper.deleteVoucherByVoucherId(voucherid);
	}

	@Override
	public Integer checkVoucher(Integer cstatus,String checker,Integer voucherid)
			throws Exception {
		
		return this.voucherMapper.updateVoucherCheck(cstatus,checker,voucherid);
	}
	
	
}
