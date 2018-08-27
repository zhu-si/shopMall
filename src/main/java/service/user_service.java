package service;

import java.util.List;

import entity.user;
import searchInfo.user_SearchInfo;

public interface user_service {
	
	public List<user> def(user_SearchInfo info);

	public void insert(user u);

	public void update(user u);

	public void delete(int id);

	public void deleteall(int id);

	public Object getId(int id);
	
}
