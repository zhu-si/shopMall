package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.operator;
import searchInfo.operator_SearchInfo;
import service.operator_service;
import utils.jsonInfo;

@Controller
@RequestMapping("operator_c")
public class operator_controller {

	@Autowired
	operator_service oservice;
	
	@RequestMapping("def")
	public String def(ModelMap model,operator_SearchInfo info) {
		model.put("list", oservice.def(info));
		model.put("prev",operator_SearchInfo.getPrev());
		model.put("next",operator_SearchInfo.getNext());
		return "operator/operator_index";
	}
	
	@RequestMapping("insert")
	protected @ResponseBody jsonInfo insert(operator o) {
		oservice.insert(o);
		return new jsonInfo(1, "");
	} 
	
	@RequestMapping("update")
	protected @ResponseBody jsonInfo update(operator o, ModelMap m) {
		oservice.update(o);
		return new jsonInfo(1, "");
	}
	
	@RequestMapping("delete")
	protected String delete(int id, ModelMap m) {
		oservice.delete(id);
		return "redirect:def";
	}
	
	@RequestMapping("deleteall")
	protected String deleteall(String ids, ModelMap m) {
		String[] strs = ids.split(",");
		for (int i = 0; i < strs.length; i++) {
			try {
				int id = Integer.parseInt(strs[i]);
				oservice.deleteall(id);
			} catch (Exception e) {
			}
		}
		return "redirect:def";
	}
	
	@RequestMapping("edit")
	protected String edit(int id, ModelMap m) {
		m.put("info", oservice.getId(id));
		return "operator/operator-edit";
	}
	
	@RequestMapping("login")
	public String asas(operator o,String code,HttpSession session) {
		
		if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
			operator user=oservice.login(o);
			if(user!=null) {
				session.setMaxInactiveInterval(100000000);
				session.setAttribute("user", user);
				session.setAttribute("name", oservice.login(o).getName());
				session.setAttribute("id", oservice.login(o).getId());
				return "index";
			}else {
				session.setAttribute("error", "用户名密码错误！");
			}
		}else {
			session.setAttribute("error", "验证码错误！");
		}
		return "redirect:/login.jsp";
		
	}
	
}
