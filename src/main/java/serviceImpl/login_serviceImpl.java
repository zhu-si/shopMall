package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.login_dao;
import entity.operator;
import service.login_service;

@Service
public class login_serviceImpl implements login_service{
	
	@Autowired
	login_dao ldao;

	public List<operator> getByName(String txt) {
		return ldao.getByName(txt);
	}
	
	

}
