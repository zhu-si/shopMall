package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import entity.product;
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
		return "product/product_edit";
	}
	
	@RequestMapping("edit")
	protected String edit(int id, ModelMap m) {
		m.put("info", pservice.getId(id));
		return add(m);
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
