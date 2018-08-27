package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user_dao;
import entity.user;
import searchInfo.user_SearchInfo;
import service.user_service;

@Service
public class user_serviceImpl implements user_service{
	
	@Autowired
	user_dao udao;
	
	public List<user> def(user_SearchInfo info) {
		return udao.def(info);
	}

	public void insert(user u) {
		udao.insert(u);
		
	}

	public void update(user u) {
		udao.update(u);
		
	}

	public void delete(int id) {
		udao.delete(id);
		
	}

	public void deleteall(int id) {
		udao.deleteall(id);
		
	}

	public Object getId(int id) {
		return udao.getId(id);
	}

}
