package com.shianghergo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shianghergo.dao.PlaceDao;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.service.PlaceService;

@Service
@Transactional
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	PlaceDao dao;
	
	@Override
	public List<PlaceBean> getAllPlace() {
		return dao.getAllPlace();
	}

	@Override
	public void setLatLngs(Double lat, Double lng, String loca) {
		dao.setLatLngs(lat, lng, loca);
	}

}
