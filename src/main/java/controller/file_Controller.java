package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class file_Controller {
	@RequestMapping("upload")
    public @ResponseBody String  fileUpload2(@RequestParam CommonsMultipartFile file,HttpServletRequest req) throws IOException {
         long  startTime=System.currentTimeMillis();
         String filepath = req.getServletContext().getRealPath("uploadFile"); // �������·��
 		String parentDir = new File(filepath).getParentFile().getParent();
 		parentDir=parentDir+"\\uploadFile";
 		File ww=new File(parentDir);
 		if (!ww.exists()) {
 			ww.mkdirs();
 		}
 		
 		String filename = file.getOriginalFilename();
		int pos = filename.lastIndexOf(".");
		// ȡͼƬ�ļ���ʽ
		String ff;
		if (pos > 0) {
			 ff = startTime + filename.substring(pos);
		}else {
			ff = startTime+"";
		}
		filename = parentDir + '/' + ff;
        //ͨ��CommonsMultipartFile�ķ���ֱ��д�ļ���ע�����ʱ��
        file.transferTo(new File(filename));
       String p1= new File(req.getServletContext().getContextPath()).getParent(); 
        String p = p1 + "/uploadFile/" + ff;
		String json="{\"status\":1,\"url\":\""+p+"\"}";
        return json; 
    }
}
