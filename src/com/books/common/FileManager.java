package com.books.common;

import java.io.File;

import org.springframework.stereotype.Component;

@Component
public class FileManager {
	//returning file extension name method
	public String getExt(String path) {
		int lastIndex = path.lastIndexOf(".");
		return path.substring(lastIndex+1,path.length());
	}
	
	public boolean save() {
		return false;
	}
	
	public String renameByDate(File originFile,String dir) {
		long time = System.currentTimeMillis();
		String filename = time+"."+getExt(originFile.getName());//새 파일이름
		boolean result = originFile.renameTo(new File(dir+"/"+filename));
		if(result==false) {
			filename = null;
		}
		return filename;
	}
}
