package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.type;
import searchInfo.type_SearchInfo;
import service.type_service;
import utils.jsonInfo;

@Controller
@RequestMapping("type_c")
public class type_controller {

	@Autowired
	type_service tservice;
	
	@RequestMapping("def")
	public String def(Integer parentid,type_SearchInfo info1,ModelMap m) {
		if(parentid==null) parentid=0;
		
		m.put("parentid", parentid);
		if(parentid>0) {
			type t = tservice.getById(parentid);
			m.put("name",t.getName());
			String path = "/<a href=\"def?parentid="+t.getId()+"\">"+t.getName()+"</a>";
			while(t.getParentid()>0) {
				t = tservice.getById(t.getParentid());
				path="/<a href=\"def?parentid="+t.getId()+"\">"+t.getName()+"</a>"+path;
			}
			path="<a href=\"def?parentid=0\">根节点</a>"+path;
			m.put("path", path);
		}else {
			m.put("name","根节点");
			m.put("path", "<a href=\"def?parentid=0\">根节点</a>");
		}
		info1.setCanPage(false);
		info1.setWhere("where type.parentid="+parentid);
		m.put("list", tservice.def(info1));
		return "type/type_index";
	}
	
	@RequestMapping("insert")
	protected @ResponseBody jsonInfo insert(type t) {
		tservice.insert(t);
		return new jsonInfo(1, "");
	} 
	
	@RequestMapping("update")
	protected @ResponseBody jsonInfo update(type t) {
		System.out.println(11111);
		tservice.update(t);
		return new jsonInfo(1, "修改成功！");
	} 
	
	@RequestMapping("delete")
	protected String delete(int id, ModelMap m) {
		tservice.delete(id);
		return "redirect:def";
	}
	
	
	@RequestMapping("add")
	protected String add(int parentid,ModelMap m) {
		System.out.println(m);
		m.put("parentid", parentid);
		return "type/type_edit";
	}
	
	@RequestMapping("edit")
	protected String edit(int id,ModelMap m) {
		m.put("info", tservice.getById(id));
		return "type/type_edit";
	}
}

