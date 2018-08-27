package serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.type_dao;
import entity.type;
import searchInfo.type_SearchInfo;
import service.type_service;
@Service
public class type_serviceImpl implements type_service{
	
	@Autowired
	type_dao tdao;

	public List<type> def(type_SearchInfo info) {
		return tdao.def(info);
	}

	public void insert(type t) {
		tdao.insert(t);
	}

	public void delete(int id) {
		tdao.delete(id);
	}

	public type getById(int id) {
		return tdao.getById(id);
	}

	public void update(type t) {
		tdao.update(t);
		
	}

	


	
}
