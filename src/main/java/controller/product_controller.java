package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.product;
import entity.type;
import searchInfo.SearchInfo;
import searchInfo.operator_SearchInfo;
import searchInfo.product_SearchInfo;
import searchInfo.type_SearchInfo;
import service.product_service;
import service.type_service;
import utils.jsonInfo;

@Controller
@RequestMapping("product_c")
public class product_controller {
	
	@Autowired
	product_service pservice;
	@Autowired
	type_service tservice;
	
	@RequestMapping("def")
	public String def(product_SearchInfo info,type_SearchInfo info1, ModelMap m) {
		
		m.put("list",pservice.def(info));
		m.put("prev",product_SearchInfo.getPrev());
		m.put("next",product_SearchInfo.getNext());
		return "product/product_index";
	}
	
	@RequestMapping("insert")
	protected @ResponseBody jsonInfo insert(product p) {
		pservice.insert(p);
		return new jsonInfo(1, "");
	} 
	
	@RequestMapping("update")
	protected @ResponseBody jsonInfo update(product p, ModelMap m) {
		pservice.update(p);
		return new jsonInfo(1, "");
	}
	
	@RequestMapping("delete")
	protected String delete(int id, ModelMap m) {
		pservice.delete(id);
		return "redirect:def";
	}
	
	@RequestMapping("deleteall")
	protected String deleteall(String ids, ModelMap m) {
		String[] strs = ids.split(",");
		for (int i = 0; i < strs.length; i++) {
			try {
				int id = Integer.parseInt(strs[i]);
				pservice.deleteall(id);
			} catch (Exception e) {
			}
		}
		return "redirect:def";
	}
	
	@RequestMapping("add")
	protected String add(ModelMap m) {
		m.put("typelist",tservice.def(new type_SearchInfo(" where type.parentid=0")));
		return "product/product_edit";
	}
	
	@RequestMapping("edit")
	protected String edit(int id, ModelMap m) {
		m.put("info", pservice.getId(id));
		return add(m);
	}
	
	@RequestMapping("gettypelist")
	protected @ResponseBody ArrayList<type> gettypelist(int id, ModelMap m) {
		tservice.getByparentid(id);
		ArrayList<type> tp= new ArrayList<type>();
		tp=tservice.getByparentid(id);
		return tp;
	}
	
	@RequestMapping("getalltyple")
	@ResponseBody
	public List<List<type>> getAllType(Integer id){
	    ArrayList<List<type>> data=new ArrayList<List<type>>();
	    type list=tservice.getById(id);
	    List<type> slist=tservice.def(new type_SearchInfo(" where type.parentid="+list.getParentid()));
	    for(int i=0;i<slist.size();i++)if(slist.get(i).getId()==id) {
	    	slist.get(i).setParent_name("1");
	    }
	    data.add(slist);
	    while(list.getParentid()>0) {
	    	list=tservice.getById(list.getParentid());
	    	slist=tservice.def(new type_SearchInfo(" where type.parentid="+list.getParentid()));
	    	for(int i=0;i<slist.size();i++)if(slist.get(i).getId()==list.getId()) {
	    		slist.get(i).setParent_name("1");
	    	}
	    	data.add(0,slist);
	    }
	    return data;
	}

	
	/*@RequestMapping("upload")
    public @ResponseBody String  fileUpload2(@RequestParam CommonsMultipartFile file,HttpServletRequest req) throws IOException {
         long  startTime=System.currentTimeMillis();
         String filepath = req.getServletContext().getRealPath("uploadFile"); // 容器相对路径
         String parentDir = new File(filepath).getParentFile().getParent();
         parentDir=parentDir+"\\uploadFile";
  		File ww=new File(parentDir);
 		if (!ww.exists()) {
 			ww.mkdirs();
 		}
 		
 		String filename = file.getOriginalFilename();
		int pos = filename.lastIndexOf(".");
		// 取图片文件格式
		String ff;
		if (pos > 0) {
			 ff = startTime + filename.substring(pos);
		}else {
			ff = startTime+"";
		}
		filename = filepath + '/' + ff;
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(new File(filename));
        String p1= new File(req.getServletContext().getContextPath()).getParent(); 
        String p = p1 + "/uploadFile/" + ff;
		String json="{\"status\":1,\"url\":\""+p+"\"}";
        return json; 
    }
*/
	
}
