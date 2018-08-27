package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.user;
import searchInfo.user_SearchInfo;

@Repository("user_dao")
public interface user_dao {
	
	@Select(value = "select * from user ${where} ${limit}")
	public List<user> def(user_SearchInfo info);

	@Insert("insert into user(email,password,tel,level,amount,status,comments) values(#{email},#{password},#{tel},#{level},#{amount},#{status},#{comments})")
	public void insert(user u);

	@Update("update user set email=#{email},password=#{password},tel=#{tel},level=#{level},amount=#{amount},status=#{status},comments=#{comments} where id=#{id}")
	public void update(user u);
	
	@Delete("delete from user where id=#{id}")
	public void deleteall(int id);
	
	@Delete("delete from user where id=#{id}")
	public void delete(int id);
	
	@Select("select * from user where id = #{id}")  
	public user getId(int id);
	
	
}
