package AM_action;

import java.io.File;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;

public class DetailsAction implements Action {

	int ID;
	String Email;
	String ActivityName;
	String Date;
	String PicturePath;




	public String getActivityName() {
		return ActivityName;
	}


	public void setActivityName(String activityName) {
		ActivityName = activityName;
	}


	public String getDate() {
		return Date;
	}


	public void setDate(String date) {
		Date = date;
	}


	public String getPicturePath() {
		return PicturePath;
	}


	public void setPicturePath(String picturePath) {
		PicturePath = picturePath;
	}

	
	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String execute() throws Exception {
		System.out.println("email = "+ Email);
		System.out.println("id = " + ID);
		if (Email != null && !Email.isEmpty() && !Email.equals("")){
			String tmp = "";
			DatabaseService ds = new DatabaseService();
			if (ds.whetherLike(Email,ID))
				tmp = "1";
			else
				tmp = "0";
			Cookie judge = new Cookie("Whether",tmp);
			HttpServletResponse response = ServletActionContext.getResponse();
			judge.setMaxAge(60*60);
			response.addCookie(judge);
		}
		String a = ID + "";
		System.out.println("a = "+a);
		Cookie id = new Cookie("ACID",a);
		HttpServletResponse response = ServletActionContext.getResponse();  
		id.setMaxAge(60*60);
		response.addCookie(id);
		
		
		String TgtPath = ServletActionContext.getServletContext().getRealPath("/images/PosterOutput");
		TgtPath = TgtPath.replaceAll("\\\\","/");
		System.out.println(TgtPath);
		File file = new File(TgtPath);
		String[] filelist = file.list();
//		File[] tempList = file.listFiles();
//		System.out.println("该目录下对象个数："+tempList.length);
		System.out.println(filelist.length);
		for(int i = 0; i < filelist.length; i++) {
//			System.out.println(TgtPath + filelist[i]);
			if(filelist[i].equals(ID+".jpg")) {
				String Path = TgtPath + "/" + filelist[i];
				return SUCCESS;
			}
		}
		return SUCCESS;
	}

}
