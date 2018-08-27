package service;

import java.util.List;

import entity.type;
import searchInfo.type_SearchInfo;

public interface type_service {
	
	public List<type> def(type_SearchInfo info);

	public void insert(type t);

	public void delete(int id);
	
	public type getById(int id);

	public void update(type t);
	
}
