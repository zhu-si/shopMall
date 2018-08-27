package serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.product_dao;
import entity.product;
import searchInfo.product_SearchInfo;
import service.product_service;

@Service
public class product_serviceImpl implements product_service{
	
	@Autowired
	product_dao pdao;

	public List<product> def(product_SearchInfo info) {
		return pdao.def(info);
	}

	public void insert(product p) {
		pdao.insert(p);
		
	}

	public void update(product p) {
		pdao.update(p);
	}

	public void delete(int id) {
		pdao.delete(id);
	}

	public void deleteall(int id) {
		pdao.deleteall(id);
	}

	public Object getId(int id) {
		return pdao.getId(id);
	}
	
}
