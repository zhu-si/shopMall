package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.currentUser_dao;
import entity.operator;
import service.currentUser_service;

@Service
public class currentUser_serviceImpl implements currentUser_service{
	
	@Autowired
	currentUser_dao cdao;
	
	public void update(operator o) {
		cdao.update(o);
		
	}

	public operator getId(int id) {
		return cdao.getId(id);
	}
}
