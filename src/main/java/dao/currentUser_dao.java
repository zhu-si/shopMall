package dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.operator;

@Repository("currentUser_dao")
public interface currentUser_dao {
	
	@Update("update operator set password=#{password} where id=#{id}")
	public void update(operator o);
	
	@Select("select * from operator where id = #{id}")  
	public operator getId(int id);
	
}
