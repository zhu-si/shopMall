package service;

import java.util.List;

import entity.operator;
import searchInfo.operator_SearchInfo;

public interface operator_service {
	
	public List<operator> def(operator_SearchInfo info);

	public void insert(operator o);

	public void update(operator o);
	
	public void uppass(int id);

	public void delete(int id);

	public void deleteall(int id);

	public Object getId(int id);
	
	public operator login(operator o);
}
