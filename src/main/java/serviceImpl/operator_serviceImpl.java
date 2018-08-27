package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.operator_dao;
import entity.operator;
import searchInfo.operator_SearchInfo;
import service.operator_service;

@Service
public class operator_serviceImpl implements operator_service{
	
	@Autowired
	operator_dao odao;
	
	
	public List<operator> def(operator_SearchInfo info) {
		return odao.def(info);
	}


	public void insert(operator o) {
		odao.insert(o);
		
	}


	public void update(operator o) {
		odao.update(o);
		
	}


	public void delete(int id) {
		odao.delete(id);
		
	}


	public void deleteall(int id) {
		odao.deleteall(id);
	}

	public operator getId(int id) {
		return odao.getId(id);
	}


	public operator login(operator o) {
		return odao.login(o);
	}

}
