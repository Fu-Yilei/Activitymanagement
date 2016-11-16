package AM_action;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;

public class DelAction implements Action {

	int delID;
	String delUser;
	
	
	public String getDelUser() {
		return delUser;
	}

	public void setDelUser(String delUser) {
		this.delUser = delUser;
	}

	public int getDelID() {
		return delID;
	}

	public void setDelID(int delID) {
		this.delID = delID;
	}

	public String execute() throws Exception {
		DatabaseService ds = new DatabaseService();
		ds.DelfromUserLike(delUser,delID);
		return SUCCESS;
	}

}
