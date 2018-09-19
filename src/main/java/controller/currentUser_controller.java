package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import entity.operator;
import service.currentUser_service;
import utils.jsonInfo;

@Controller
@RequestMapping("currentUser_c")
public class currentUser_controller {

	@Autowired
	currentUser_service cservice;
	 
	@RequestMapping("update")
	protected @ResponseBody jsonInfo update(operator o,int id,HttpServletRequest req,HttpServletResponse resp,ModelMap m) {
		
		String pass = cservice.getId(id).getPassword();
		String pass1 = req.getParameter("password0");
		String password = req.getParameter("password");
		
		String password1 = req.getParameter("password1");
		if(pass.equals(pass1)) {
			if(password.equals(password1)) {
				o.setPassword(password);
				cservice.update(o);
				return new jsonInfo(2, "修改成功");
			}else {
				return new jsonInfo(1,"新密码不一致");
			}
		}else {
			return new jsonInfo(0, "原密码不正确");
		}
		
	}
	
//	@RequestMapping("update")
//	protected @ResponseBody jsonInfo update(operator o, ModelMap m) {
//		cservice.update(o);
//		return new jsonInfo(1, "");
//	}
	
	@RequestMapping("edit")
	protected String edit(int id, ModelMap m) {
		m.put("info", cservice.getId(id));
		return "currentUser/currentUser-edit";
	}
}
