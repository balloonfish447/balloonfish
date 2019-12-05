package com.se.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

//文件上传
public class UpLoad {
	
	public  static void upLoad(String realPath,CommonsMultipartFile file,String fileName){
		File pathFile = new File(realPath);
		File newFile=new File(realPath+fileName);
		if(!pathFile.exists() ){
			pathFile.mkdirs();
		}
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        try {
			file.transferTo(newFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
