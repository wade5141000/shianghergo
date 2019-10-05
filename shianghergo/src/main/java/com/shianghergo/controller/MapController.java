package com.shianghergo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shianghergo.model.GroupsBean;
import com.shianghergo.model.PlaceBean;
import com.shianghergo.service.GroupsService;
import com.shianghergo.service.PlaceService;

@Controller
public class MapController {

	@Autowired
	PlaceService placeService;
	
	@Autowired
	GroupsService groupsService;
	
	
	@RequestMapping("wade/showmap")
	public String showMap(Model model) {
		List<PlaceBean> list = placeService.getAllPlace();
		model.addAttribute("items",list);
		
		List<GroupsBean> glist = groupsService.getAllGroups();
		model.addAttribute("groups",glist);
		
//		System.out.println(list.get(0).getLongitude());
		
		return "wade/googleMap";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("wade/changeMarker")
	public void changeMarker(Model model,HttpServletResponse rp,@RequestParam Integer gId) {
		System.out.println(gId);
		ObjectMapper mapper = new ObjectMapper();
		String result = "";
		List<PlaceBean> newList = new ArrayList<>();
		List<GroupsBean> groupList = new ArrayList<>();
		
		if(gId==1) {
			List<PlaceBean> list = placeService.getAllPlace();
			for(int i=0 ; i<list.size() ; i++) {
				PlaceBean pb = new PlaceBean();
				PlaceBean old = list.get(i);
				pb.setId(old.getId());
				pb.setAddress(old.getAddress());
				pb.setLatitude(old.getLatitude());
				pb.setLongitude(old.getLongitude());
				pb.setTime(old.getTime());
				newList.add(pb);
				
				GroupsBean gb = new GroupsBean();
				GroupsBean oldgb = old.getGroupsBean();
				gb.setId(oldgb.getId());
				gb.setName(oldgb.getName());
				gb.setEnd_time(oldgb.getEnd_time());
				groupList.add(gb);
			}
		
		}else {
			GroupsBean group = groupsService.getGroupById(gId);
			List<PlaceBean> list = new ArrayList<>(group.getPlace());
			for(int i=0 ; i<list.size() ; i++) {
				PlaceBean pb = new PlaceBean();
				PlaceBean old = list.get(i);
				pb.setId(old.getId());
				pb.setAddress(old.getAddress());
				pb.setLatitude(old.getLatitude());
				pb.setLongitude(old.getLongitude());
				pb.setTime(old.getTime());
				newList.add(pb);
				
				GroupsBean gb = new GroupsBean();
				GroupsBean oldgb = old.getGroupsBean();
				gb.setId(oldgb.getId());
				gb.setName(oldgb.getName());
				gb.setEnd_time(oldgb.getEnd_time());
				groupList.add(gb);
			}
		}
		
		Map map = new HashMap();
		map.put("placeList", newList);
		map.put("groupList", groupList);
		
		try {
			result = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
			rp.getWriter().write(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
