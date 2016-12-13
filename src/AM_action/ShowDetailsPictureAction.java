package AM_action;

import org.apache.struts2.ServletActionContext;
import java.io.File;

public class ShowDetailsPictureAction {
	String ActivityName;
	String Date;
	String PicturePath;
	int ID;
	
	
	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


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


	public void execute() throws Exception {
		int ID = getID();
		String TgtPath = ServletActionContext.getServletContext().getRealPath("/images/PosterOutput");
		File file = new File(TgtPath);
		String[] filelist = file.list();
		for(int i = 0; i < filelist.length; i++) {
			if(filelist[i].equals(ID+".jpg")) {
				setPicturePath(TgtPath + filelist[i]);
				return ;
			}
		}
	}
}
