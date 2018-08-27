package serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.orders_details_dao;
import entity.orders_details;
import service.orders_details_service;
@Service
public class orders_details_serviceImpl implements orders_details_service{
	
	@Autowired
	orders_details_dao ddao;

	public List<orders_details> def(String txt) {
		return ddao.def(txt);
	}

	public void insert(orders_details d) {
		ddao.insert(d);
	}
	
	public void update(orders_details d) {
		ddao.update(d);
	}

	public void delete(int id) {
		ddao.delete(id);
	}

	public void deleteall(int id) {
		ddao.deleteall(id);
	}

	public List<orders_details> getId(int id) {
		return ddao.getId(id);
	}

	
	
}
