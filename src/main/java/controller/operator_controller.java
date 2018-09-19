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
		operator oper = oservice.login(o);
		if(oper != null) {
			return new jsonInfo(1, "添加成功！");
		}else {
			return new jsonInfo(0, "添加失败！");
		}
	} 
	
	@RequestMapping("update")
	protected @ResponseBody jsonInfo update(operator o, ModelMap m) {
		oservice.update(o);
		return new jsonInfo(1, "");
	}
	
	@RequestMapping("uppass")
	protected @ResponseBody jsonInfo uppass(int id,String password) {
		oservice.uppass(id);
		return new jsonInfo(1, "修改成功");
	}
	
	@RequestMapping("edit")
	protected String edit(int id, ModelMap m) {
		m.put("info", oservice.getId(id));
		return "operator/operator-edit";
	}
	
	@RequestMapping("logins")
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
				session.setAttribute("error", "用户名密码错误");
			}
		}else {
			session.setAttribute("error","验证码错误");
		}
		return "redirect:/login.jsp";
		
	}
	
}
