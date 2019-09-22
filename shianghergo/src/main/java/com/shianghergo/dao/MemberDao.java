package com.shianghergo.dao;

import java.util.List;

import com.shianghergo.model.MemberBean;




public interface  MemberDao {

	
	List<MemberBean> getMember ();
	
	void saveMemberIdToStop(Integer target);
	
	Integer loginMember(String account);
	
}
