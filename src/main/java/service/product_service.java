package service;

import java.util.List;

import entity.product;
import searchInfo.product_SearchInfo;

public interface product_service {

	public List<product> def(product_SearchInfo info);

	public void insert(product p);

	public void update(product p);

	public void delete(int id);

	public void deleteall(int id);

	public Object getId(int id);


}
