package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.type;
import searchInfo.type_SearchInfo;

@Repository
public interface type_dao {
	
	@Select(value = "select type.*,t.name parent_name from type left join type t on type.parentid=t.id ${where} ${limit}")
	public List<type> def(type_SearchInfo info);

	@Insert("insert into type(name,parentid) values(#{name},#{parentid})")
	public void insert(type t);

	@Update("update type set name=#{name} where id=#{id}")
	public void update(type t);
	
	@Delete("delete from type where id=#{id}")
	public void delete(int id);
	
	@Select(value = "select * from type where id=#{id}")
	public type getById(int id);
	
	@Select(value = "select * from type where parentid=#{parentid}")
	public ArrayList<type> getByparentid(int id);
}
