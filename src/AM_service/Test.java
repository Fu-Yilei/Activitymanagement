package AM_service;

import java.io.File;

import org.apache.struts2.ServletActionContext;

public class Test {

	public static void main(String[] args) {
		String TgtPath = ServletActionContext.getServletContext().getRealPath("/images/PosterOutput");
		File file = new File(TgtPath);
		String[] filelist = file.list();
		for(int i = 0; i < filelist.length; i++) {
			System.out.println(filelist[i]);
		}
	}
}