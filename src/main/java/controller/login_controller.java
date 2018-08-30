package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.login_service;

@Controller
public class login_controller {

	@Autowired
	login_service lservice;

	@RequestMapping("login")
	private String login(HttpServletRequest req) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		if(lservice.getByName(username).isEmpty()) {
			return "login";
		}
		else {
			String nike = lservice.getByName(username).get(0).getNike();
			String pass = lservice.getByName(username).get(0).getPassword();
			if (username.equals(nike) && password.equals(pass)) {
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute(password, password);
				session.setAttribute("id", lservice.getByName(username).get(0).getId());
				session.setAttribute("name", lservice.getByName(username).get(0).getName());
				session.setMaxInactiveInterval(5);
				return "index";
			} else {
				return "login";
			}
		}
	}
}
