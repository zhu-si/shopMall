package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.orders;
import searchInfo.orders_SearchInfo;

@Repository("order_dao")
public interface order_dao {
	
	@Select(value = "select o.*,u.email,a.zone,a.addr from orders o inner join user u inner join address a on o.user_id=u.id and o.address_id=a.id ${where} ${limit}")
	public List<orders> def(orders_SearchInfo info);

	@Insert("insert into orders(date,code,amount,nowamount,address_id,user_id,status,comments) values(#{date},#{code},#{amount},#{nowamount},#{address_id},#{user_id},#{status},#{comments})")
	public void insert(orders r);

//	@Delete("delete from orders where id=#{id}")
//	public void deleteall(int id);
//	
//	@Delete("delete from orders where id=#{id}")
//	public void delete(int id);
//	
	//按时间查询
	@Select("select o.*,u.email,a.zone,a.addr from orders o inner join user u inner join address a on o.user_id=u.id and o.address_id=a.id where date>=#{start} and date<=#{end}")
	public List<orders> selectDate(@Param("start")String start,@Param("end")String end);
	
	
	
	
	
}
