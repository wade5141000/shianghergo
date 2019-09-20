package com.shianghergo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shianghergo.model.PlaceBean;
import com.shianghergo.service.PlaceService;

@Controller
public class MapController {

	@Autowired
	PlaceService placeService;
	
	@RequestMapping("showmap")
	public String showMap(Model model) {
		List<PlaceBean> list = placeService.getAllPlace();
		model.addAttribute("items",list);
		System.out.println(list.get(0).getLongitude());
		return "googleMap";
	}
}
