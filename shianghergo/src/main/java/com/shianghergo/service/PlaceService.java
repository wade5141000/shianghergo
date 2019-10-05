package com.shianghergo.service;

import java.util.List;

import com.shianghergo.model.PlaceBean;

public interface PlaceService {
	List<PlaceBean> getAllPlace();
	void setLatLngs(Double lat,Double lng,String loca);
}
