package com.shianghergo.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shianghergo.dao.StoreDao;
import com.shianghergo.model.StoreBean;
import com.shianghergo.service.StoreService;


@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	StoreDao dao;

	@Transactional
	@Override
	public List<StoreBean> getAllStores() {
		return dao.getAllStores();
	}

	@Transactional
	@Override
	public void buildStore(StoreBean sb) {
		dao.buildStore(sb);
	}

	@Transactional
	@Override
	public StoreBean getStoreById(int id) {
		return dao.getStoreById(id);
	}

	@Transactional
	@Override
	public List<StoreBean> getStoreList() {
		return dao.getStoreList();
	}

	@Transactional
	@Override
	public void updateStore(StoreBean sb) {
		StoreBean oldStoreBean=dao.getStoreById(sb.getId());
		oldStoreBean.setName(sb.getName());
		oldStoreBean.setDetail(sb.getDetail());
		sb.setStatus(3);
		dao.updateStore(oldStoreBean);
	}
	
	@Transactional
	@Override
	public void closeStore(StoreBean sb) {
		StoreBean oldStoreBean=dao.getStoreById(sb.getId());
		oldStoreBean.setName(sb.getName());
		oldStoreBean.setDetail(sb.getDetail());
		oldStoreBean.setStatus(3);
		dao.updateStore(oldStoreBean);
	}

	@Transactional
	@Override
	public boolean checkStoreExist(Integer member_id) {
		boolean result = dao.checkStoreExist(member_id); 
		return result;
	}

	@Transactional
	@Override
	public StoreBean getStoreByMember_Id(Integer member_id) {
		return dao.getStoreByMember_Id(member_id);
	}
	
}
