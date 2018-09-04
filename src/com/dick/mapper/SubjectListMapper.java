package com.dick.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dick.pojo.AccountSub;

public interface SubjectListMapper {
	/*通过科目类别获取科目列表*/
	List<AccountSub> getSubjectList(@Param("acSub_classes")String acSub_classes,@Param("currentPage")Integer currentPage,@Param("pageSize")Integer pageSize) throws Exception;
	/*插入科目*/
	Integer saveSubject(AccountSub accountSub) throws Exception;
	/*更新科目*/
	Integer updateSubject(AccountSub accountSub) throws Exception;
	/*删除科目*/
	Integer deleteSubject(Integer id) throws Exception;
	/*通过id查询科目*/
	AccountSub getAccountSubById(Integer id) throws Exception;
	/*查询科目列表*/
	List<AccountSub> selectSubjectList(String sql) throws Exception;
	List<AccountSub> selectSubjectListByName(String name) throws Exception;
	List<AccountSub> selectSubjectTotleCount(String acSub_classes) throws Exception;
}
