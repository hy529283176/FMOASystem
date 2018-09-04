package com.dick.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dick.mapper.SubjectListMapper;
import com.dick.pojo.AccountSub;

@Service
public class SubjectListServiceImpl implements SubjectListService{
	@Autowired
	private SubjectListMapper subListMapper;
	
	@Override
	public List<AccountSub> getSubjectList(String acSub_classes,Integer currentPage,Integer pageSize) throws Exception {
		List<AccountSub> accSubList = this.subListMapper.getSubjectList(acSub_classes,currentPage,pageSize);
		return accSubList;
	}
	

	@Override
	public Integer saveSubject(AccountSub accountSub) throws Exception {
		return this.subListMapper.saveSubject(accountSub);
	}

	@Override
	public AccountSub getAccountSubById(Integer id) throws Exception {
		
		return this.subListMapper.getAccountSubById(id);
	}


	@Override
	public Integer updateSubject(AccountSub accountSub) throws Exception {
		
		return this.subListMapper.updateSubject(accountSub);
	}


	@Override
	public Integer deleteSubject(Integer id) throws Exception {
		return this.subListMapper.deleteSubject(id);
	}


	@Override
	public List<AccountSub> selectSubjectList(String sql) throws Exception {
		
		return this.subListMapper.selectSubjectList(sql);
	}


	@Override
	public List<AccountSub> selectSubjectListByName(String name)
			throws Exception {
		
		return this.subListMapper.selectSubjectListByName(name);
	}


	@Override
	public List<AccountSub> selectSubjectTotleCount(String acSub_classes)
			throws Exception {
		return this.subListMapper.selectSubjectTotleCount(acSub_classes);
	}
	
}
