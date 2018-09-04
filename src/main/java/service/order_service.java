package service;

import java.util.List;

import entity.orders;
import searchInfo.orders_SearchInfo;

public interface order_service {
	
	public List<orders> def(orders_SearchInfo info);

	public void insert(orders r);

	public void delete(int id);

	public void deleteall(int id);

	public Object getId(int id);

	public List<orders> selectDate(String start,String end);
}
