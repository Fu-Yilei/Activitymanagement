package AM_action;

import com.opensymphony.xwork2.Action;

import AM_service.DatabaseService;

public class LogOutAction implements Action {

	String Email;
	
	
	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	public String execute() throws Exception {
		DatabaseService ds = new DatabaseService();
		ds.DelACfromTmp(Email);
		return SUCCESS;
	}

}
