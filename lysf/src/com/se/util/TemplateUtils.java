package com.se.util;


import java.io.File;
import java.io.IOException;
import org.apache.commons.io.output.FileWriterWithEncoding;
import freemarker.template.Configuration;
import freemarker.template.Template;


public class TemplateUtils {
	

    public void createHtml(String templateName, Object model,String templatePath,String filePath,String fileName) {
    	FileWriterWithEncoding  out = null;
        try {
        	  // 获取config对象
            Configuration configuration = new Configuration(Configuration.VERSION_2_3_0);
            // 制定模板路径
            configuration.setClassForTemplateLoading(this.getClass(),templatePath);
            //设置编码格式
            configuration.setDefaultEncoding("utf-8");

            // 获取所要的模板名称
            Template template = configuration.getTemplate(templateName);
            
            //写入路径
            File writeFile = new File(filePath); 
            
            if(!writeFile.exists() ){
            	writeFile.mkdirs();
            }
            
             
            //ͨ输出html页面
            out =new FileWriterWithEncoding(new File(filePath+fileName),"UTF-8");
           
            template.process(model, out);
            out.flush();
        } catch (Throwable e) {
        	e.printStackTrace();
            
        }finally{
        	try {
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
       
    }

    


}
