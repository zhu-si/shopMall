package service;

import java.util.List;

import entity.orders_details;

public interface orders_details_service {
	
	public List<orders_details> def(String txt);

	public void insert(orders_details d);
	
	public void update(orders_details d);

	public void delete(int id);

	public void deleteall(int id);

	public List<orders_details> getId(int id);

	
}
