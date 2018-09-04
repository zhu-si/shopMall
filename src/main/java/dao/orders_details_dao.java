package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.orders;
import entity.orders_details;

@Repository("orders_details_dao")
public interface orders_details_dao {
	
	@Select(value = "select * from orders_details where orders_id like CONCAT(CONCAT('%', #{txt}),'%')")
	public List<orders_details> def(String txt);

	@Insert("insert into orders_details(orders_id,product_id,count,price,nowprice,comments) values(#{orders_id},#{product_id},#{count},#{price},#{nowprice},#{comments})")
	public void insert(orders_details d);
	
	@Update("update orders_details set orders_id=#{orders_id},product_id=#{product_id},count=#{count},price=#{price},nowprice=#{nowprice},info=#{info},price=#{price},nowprice=#{nowprice},comments=#{comments} where id=#{id}")
	public void update(orders_details d);
	
	@Delete("delete from orders_details where id=#{id}")
	public void deleteall(int id);
	
	@Delete("delete from orders_details where id=#{id}")
	public void delete(int id);
	
	@Select("select * from orders_details where orders_id = #{id}")  
	public List<orders_details> getId(int id);
	
	
	
}
