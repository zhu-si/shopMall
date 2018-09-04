package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.orders;
import searchInfo.orders_SearchInfo;
import service.order_service;
import service.orders_details_service;
import service.user_service;
import utils.jsonInfo;

@Controller
@RequestMapping("order_c")
public class order_controller {

	@Autowired
	order_service rservice;
	@Autowired
	orders_details_service dservice;
	@Autowired
	user_service uservice;
	
	@RequestMapping("def")
	public String def(String start,String end,orders_SearchInfo info,ModelMap model) {
		if(start != null) {
			model.put("start", start);
			model.put("end", end);
			model.put("list", rservice.selectDate(start, end));
//			for(int i =0 ; i <(rservice.selectDate(start, end)).size(); i++) {
//				int id = rservice.selectDate(start, end).get(i).getUser_id();
//				model.put("list",uservice.getId(id));
//				}
		}else {
			model.put("list", rservice.def(info));
			model.put("prev",orders_SearchInfo.getPrev());
			model.put("next",orders_SearchInfo.getNext());
//			for(int i =0 ; i <(rservice.selectDate(start, end)).size(); i++) {
//				int id = rservice.selectDate(start, end).get(i).getUser_id();
//				model.put("user",uservice.getId(id));
//				}
		}
		return "orders/order_index";
	}
	
	@RequestMapping("search")
	public String getId(int id,ModelMap model) {
		model.put("lists", dservice.getId(id));
		return "orders/order_view";
	}
	
//	@RequestMapping("selectDate")
//	public String selectDate(String start,String end,ModelMap model) {
//		System.out.println(start);
//		model.put("start", start);
//		model.put("end", end);
//		model.put("datelist", rservice.selectDate(start, end));
//		return "orders/order_index";
//	}
	
	@RequestMapping("insert")
	protected @ResponseBody jsonInfo insert(orders r) {
		rservice.insert(r);
		return new jsonInfo(1, "");
	} 
	
	@RequestMapping("delete")
	protected String delete(int id, ModelMap m) {
		rservice.delete(id);
		return "redirect:def";
	}
	
	@RequestMapping("deleteall")
	protected String deleteall(String ids, ModelMap m) {
		String[] strs = ids.split(",");
		for (int i = 0; i < strs.length; i++) {
			try {
				int id = Integer.parseInt(strs[i]);
				rservice.deleteall(id);
			} catch (Exception e) {
			}
		}
		return "redirect:def";
	}
	
	@RequestMapping("add")
	protected String add(ModelMap m) {
		return "orders/order_add";
	}
	
	
}

