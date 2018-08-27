package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import entity.operator;

@Repository("login_dao")
public interface login_dao {
	
	
	@Select("select * from operator where nike=#{txt}")  
	
	public List<operator> getByName(String txt);
	
}
