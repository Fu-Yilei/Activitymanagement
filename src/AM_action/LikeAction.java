package AM_action;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;

public class LikeAction implements Action {

	String userEmail;
	String activityID;
	
	
	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getActivityID() {
		return activityID;
	}


	public void setActivityID(String activityID) {
		this.activityID = activityID;
	}


	public String execute() throws Exception {
		DatabaseService ds = new DatabaseService();
		ds.LikeAC(userEmail,activityID);
		return SUCCESS;
	}

}
