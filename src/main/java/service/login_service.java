package service;

import java.util.List;

import entity.operator;

public interface login_service {
	

	public List<operator> getByName(String txt);

}
