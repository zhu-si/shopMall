package dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.operator;
import searchInfo.operator_SearchInfo;

@Repository("operator_dao")
public interface operator_dao {
	
	@Select(value = "select * from operator ${where} ${limit}")
	public List<operator> def(operator_SearchInfo info);

	@Insert("insert into operator(nike,password,name,sex,tel,power,status,comments) values(#{nike},#{password},#{name},#{sex},#{tel},#{power},#{status},#{comments})")
	public void insert(operator o);

	@Update("update operator set nike=#{nike},name=#{name},sex=#{sex},tel=#{tel},power=#{power},status=#{status},comments=#{comments} where id=#{id}")
	public void update(operator o);
	
	@Delete("delete from operator where id=#{id}")
	public void deleteall(int id);
	
	@Delete("delete from operator where id=#{id}")
	public void delete(int id);
	
	@Select("select * from operator where id = #{id}")  
	public operator getId(int id);
	
	@Select("select * from operator where nike=#{nike} and password=#{password}")
	public operator login(operator o);

}
