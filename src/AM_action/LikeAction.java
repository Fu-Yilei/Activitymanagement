package AM_action;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;

public class LikeAction implements Action {

	String userEmail;
	int activityID;
	
	
	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	


	public int getActivityID() {
		return activityID;
	}


	public void setActivityID(int activityID) {
		this.activityID = activityID;
	}


	public String execute() throws Exception {
		DatabaseService ds = new DatabaseService();
		ds.LikeAC(userEmail,activityID);
		return SUCCESS;
	}

}
