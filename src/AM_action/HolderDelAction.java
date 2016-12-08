package AM_action;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;

public class HolderDelAction implements Action {

	int delID;
	
	
	public int getDelID() {
		return delID;
	}

	public void setDelID(int delID) {
		this.delID = delID;
	}

	public String execute() throws Exception {
		DatabaseService ds = new DatabaseService();
		ds.DelfromAll(delID);
		return SUCCESS;
	}

}
